package com.krt.access.thread;

import com.alibaba.fastjson.JSONObject;
import com.krt.access.entity.TCallback;
import com.krt.access.entity.TCallbackLog;
import com.krt.access.service.ITCallbackLogService;
import com.krt.access.service.ITCallbackService;
import com.krt.common.util.HttpUtils;
import com.krt.common.util.SpringUtils;
import lombok.extern.slf4j.Slf4j;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @author 郭明德
 * @description 线程安全的回调地址测试线程
 * @date 2019/8/9 11:59
 */
@Slf4j
public class CallbackThread extends Thread{

    private static ITCallbackLogService callbackLogService;

    private static ITCallbackService callbackService;

    /**
     * 存储回调信息Map
     */
    private static List<CallBackInfo> callBackList = new CopyOnWriteArrayList<>();
    /**
     * 线程安全锁
     */
    private static Object lock = new Object();
    /**
     * 最大测试次数
     */
    private Integer maxRetry = 10;
    /**
     * 开始延时次数
     */
    private Integer minCount = 3;

    static {
        callbackLogService = SpringUtils.getBean(ITCallbackLogService.class);
        callbackService = SpringUtils.getBean(ITCallbackService.class);
    }

    public CallbackThread(){
        log.info("开启回调线程");
        this.start();
    }

    /**
     * 主程序
     */
    @Override
    public void run() {
        while (true){
            if( callBackList.size() == 0 ){
                synchronized (lock) {
                    try {
                        lock.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            synchronized (lock){
                try {
                    for (Iterator<CallBackInfo> ite = callBackList.iterator(); ite.hasNext();) {
                        CallBackInfo callBackInfo = ite.next();
                        if( !callBackInfo.getWorking() ) {
                            if (callBackInfo.getCount() == 0){
                                insertCallbackLog(callBackInfo, Constant.CALLBACK_WORKING);
                            }
                            if (callBackInfo.getCount() > maxRetry) {
                                updateCallbackLog(callBackInfo, Constant.CALLBACK_OVERTIME);
                                callBackList.remove(callBackInfo);
                                continue;
                            }
                            if (checkTime(callBackInfo.getCount(), callBackInfo.getTime())) {
                                callBackInfo.setWorking(true);
                                new Thread(() -> {
                                    try {
                                        String res = HttpUtils.doPost(callBackInfo.getUrl(), callBackInfo.getData(), null);
                                        JSONObject json = JSONObject.parseObject(res);
                                        if (json.getInteger("code") == 200) {
                                            updateCallbackLog(callBackInfo,  Constant.CALLBACK_FINISHED);
                                            callBackList.remove(callBackInfo);
                                        } else {
                                            log.info("获取响应失败："+callBackInfo.getCount());
                                            callBackInfo.setCount(callBackInfo.getCount()+1);
                                            callBackInfo.setTime(System.currentTimeMillis());
                                            callBackInfo.setWorking(false);
                                        }
                                    } catch (Exception e) {
                                        log.info("回调失败原因："+e.getMessage());
                                        e.printStackTrace();
                                        updateCallbackLog(callBackInfo,  Constant.CALLBACK_EXCEPTION);
//                                        ite.remove();
                                        callBackInfo.setCount(callBackInfo.getCount()+1);
                                        callBackInfo.setTime(System.currentTimeMillis());
                                        callBackInfo.setWorking(false);
                                    }
                                }).start();
                            }
                        }
                    }
                    lock.wait(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 往存储回调信息的容器中添加数据
     * @param
     */
    public static void add(TCallback callback, Map data){
        CallBackInfo callBackInfo = new CallBackInfo();
        callBackInfo.setCallbackId(callback.getId());
        callBackInfo.setAppId(callback.getAppId());
        callBackInfo.setUrl(callback.getUrl());
        callBackInfo.setData(data);
        callBackInfo.setCount(0);
        callBackInfo.setTime(System.currentTimeMillis());
        callBackInfo.setWorking(false);

        synchronized (lock) {
            callBackList.add(callBackInfo);
            lock.notify();
        }
    }

    public static void add(Integer appId, Map data) {
        TCallback callback = callbackService.selectCallbackUrl(appId);
        if( callback != null ){
            add(callback, data);
        }else{
            log.info("回调不存在：AppId="+appId);
        }
    }

    /**
     * 判断是否满足测试时间
     * @param count 测试次数
     * @param time 测试时间
     * @return
     */
    private Boolean checkTime(Integer count, Long time){
        if( count == 0 ){
            return true;
        }else if( count <= minCount ){
            return (System.currentTimeMillis() - time) > 1000L;
        }else {
            return (System.currentTimeMillis() - time) > (count-minCount+1) * 1000L;
        }
    }

    /**
     * 插入一条回调日志
     * @param callBackInfo 回调
     * @param status 状态
     */
    private void insertCallbackLog(CallBackInfo callBackInfo, int status){
        TCallbackLog callbackLog = new TCallbackLog();
        callbackLog.setCallbackId(callBackInfo.getCallbackId());
        callbackLog.setUrl(callBackInfo.getUrl());
        callbackLog.setData(callBackInfo.getData().toString());
        callbackLog.setStatus(status);
        callbackLogService.insert(callbackLog);
        callBackInfo.setCallbackLogId(callbackLog.getId());
    }

    /**
     * 更新回调日志
     * @param callBackInfo
     * @param status
     */
    private void updateCallbackLog(CallBackInfo callBackInfo, int status){
        TCallbackLog callbackLog = new TCallbackLog();
        callbackLog.setId(callBackInfo.getCallbackLogId());
        callbackLog.setStatus(status);
        callbackLogService.updateById(callbackLog);
    }

}