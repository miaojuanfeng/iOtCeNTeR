package com.krt.access.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.krt.access.service.ITCallbackLogService;
import com.krt.common.util.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.access.entity.TCallback;
import com.krt.access.mapper.TCallbackMapper;
import com.krt.access.service.ITCallbackService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * 回调列表服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Service
public class TCallbackServiceImpl extends BaseServiceImpl<TCallbackMapper, TCallback> implements ITCallbackService {

    @Resource
    private TCallbackMapper callbackMapper;

    @Override
    public TCallback selectCallbackUrl(Integer appId) {
        return callbackMapper.selectCallbackUrl(appId);
    }


//    /**
//     * 回调地址测试
//     * @param id 回调id
//     * @param url 回调地址
//     * @return
//     */
//    @Override
//    public Boolean test(Integer id, String url) {
//        Map data = new HashMap(2);
//        data.put("msg", "callbackTest");
//
//        try {
//            String res = HttpUtils.doPost(url, data, null);
//            JSONObject json = JSONObject.parseObject(res);
//            if(Integer.parseInt(json.getString("code")) == 200){
//                callbackMapper.updateURLStatus(id, 1);
//                return true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            callbackMapper.updateURLStatus(id, 4);
//        }
//
//        return false;
//    }
//
//    /**
//     * 插入一条数据，获取插入的id
//     * @param callback
//     * @return
//     */
//    @Override
//    public int insertCallbackByMap(TCallback callback){
//        return callbackMapper.insertCallbackByMap(callback);
//    }
//
//    /**
//     * 设置URL状态
//     * @param id url id
//     * @param status 状态码
//     */
//    @Override
//    public void updateURLStatus(int id, int status) {
//        callbackMapper.updateURLStatus(id, status);
//    }


}
