package com.krt.mqtt.client.thread;

import com.krt.mqtt.client.constant.CommonConst;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class KeepAliveThread extends Thread{

    private Object lock = new Object();

    private final long timeout = 10000;

    public KeepAliveThread(){
        log.info("开启保活线程");
        this.start();
    }

    @Override
    public void run() {
        while(true){
            synchronized (lock){
                try {
                    if( null == CommonConst.beatThread ){
                        createBeatThread();
                    }
//                    log.info("心跳线程状态："+CommonConst.beatThread.getState());
                    if( State.TERMINATED.equals(CommonConst.beatThread.getState()) ){
                        createBeatThread();
                    }
                    lock.wait(timeout);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void createBeatThread(){
        NettyBeatThread.isConnect = true;
        CommonConst.beatThread = new NettyBeatThread();
    }
}
