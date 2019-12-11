package com.krt.mqtt.client.thread;

import com.alibaba.fastjson.JSONObject;
import com.krt.mqtt.client.constant.CommonConst;
import com.krt.mqtt.client.netty.NettyClient;
import com.krt.mqtt.client.netty.NettySSLClient;
import io.netty.handler.codec.mqtt.MqttFixedHeader;
import io.netty.handler.codec.mqtt.MqttMessage;
import io.netty.handler.codec.mqtt.MqttMessageType;
import io.netty.handler.codec.mqtt.MqttQoS;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Slf4j
public class NettyBeatThread extends Thread{

    private static MqttMessage mqttMessage = null;

    public static boolean isConnect = false;

    private static Object lock = new Object();

    private static final long timeout = CommonConst.ALIVE_TIME*1000;

    public NettyBeatThread(){
        this.mqttMessage  = new MqttMessage(new MqttFixedHeader(MqttMessageType.PINGREQ, false, MqttQoS.AT_MOST_ONCE, false, 0));
        log.info("开启心跳线程");
        this.start();
    }

    public static void awake(){
        synchronized (lock){
            lock.notify();
        }
    }

    @Override
    public void run() {
        while (isConnect) {
            synchronized (lock) {
                try {
                    lock.wait(timeout);
                    if( isConnect ){
                        NettyClient.writeAndFlush(mqttMessage);
                        NettySSLClient.writeAndFlush(mqttMessage);
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        log.info("终止心跳线程");
    }
}
