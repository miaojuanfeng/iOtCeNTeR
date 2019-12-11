package com.krt.mqtt.client.netty;

import com.krt.mqtt.client.beans.MqttSendMessage;
import com.krt.mqtt.client.constant.CommonConst;
import com.krt.mqtt.client.constant.MqttMessageStateConst;
import com.krt.mqtt.client.constant.TopicNameConst;
import com.krt.mqtt.client.utils.MessageIdUtil;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.handler.codec.mqtt.*;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
public class NettyCommon {

    public static boolean sendAck(Boolean isSsl, Integer messageId, String topicName, byte[] bytes){
        try {
            MqttFixedHeader mqttFixedHeader = new MqttFixedHeader(MqttMessageType.PUBLISH, false, MqttQoS.AT_MOST_ONCE,false,0);
            MqttPublishVariableHeader mqttPublishVariableHeader = new MqttPublishVariableHeader(topicName, messageId);
            MqttPublishMessage mqttPublishMessage = new MqttPublishMessage(mqttFixedHeader, mqttPublishVariableHeader, Unpooled.copiedBuffer(bytes));
            // 增加引用计数
            mqttPublishMessage.payload().retain();

            if( isSsl ){
                return NettySSLClient.writeAndFlush(mqttPublishMessage);
            }else{
                return NettyClient.writeAndFlush(mqttPublishMessage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean sendCmd(Boolean isSsl, Integer messageId, String topicName, byte[] bytes, MqttQoS mqttQoS, boolean isDup){
        try {
            MqttFixedHeader mqttFixedHeader = new MqttFixedHeader(MqttMessageType.PUBLISH, isDup, mqttQoS,false,0);
            MqttPublishVariableHeader mqttPublishVariableHeader = new MqttPublishVariableHeader(topicName, messageId);
            MqttPublishMessage mqttPublishMessage = new MqttPublishMessage(mqttFixedHeader, mqttPublishVariableHeader, Unpooled.copiedBuffer(bytes));
            // 增加引用计数
            mqttPublishMessage.payload().retain();

            boolean retval = false;
            if( isSsl ) {
                retval = NettySSLClient.writeAndFlush(mqttPublishMessage);
            }else{
                retval = NettyClient.writeAndFlush(mqttPublishMessage);
            }

            if( MqttQoS.AT_LEAST_ONCE.equals(mqttQoS) && !isDup ){
                saveSendMessage(isSsl, messageId, topicName, bytes, mqttQoS, MqttMessageStateConst.PUB);
            }

            return retval;
        } catch (Exception e) {
            log.info(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public static void saveSendMessage(Boolean ssl, Integer messageId, String topicName, byte[] payload, MqttQoS mqttQoS, int state){
        Channel channel = null;
        if( ssl ){
            channel = NettySSLClient.getChannel();
        }else{
            channel = NettyClient.getChannel();
        }
        MqttSendMessage mqttSendMessage = new MqttSendMessage();
        mqttSendMessage.setMessageId(messageId);
        mqttSendMessage.setTopicName(topicName);
        mqttSendMessage.setPayload(payload);
        mqttSendMessage.setState(state);
        mqttSendMessage.setMqttQoS(mqttQoS);
        mqttSendMessage.setCtx(channel);
        mqttSendMessage.setSendTime(new Date().getTime());
        mqttSendMessage.setResendCount(1);
        mqttSendMessage.setSsl(ssl);
//        mqttSendMessage.setVer(ver);
//        mqttSendMessage.setMultiport(multiport);
//        mqttSendMessage.setDeviceId(deviceId);
        CommonConst.sendMessages.put(messageId, mqttSendMessage);
    }

    public static void resendSendMessage(){
        for (Integer messageId : CommonConst.sendMessages.keySet()) {
            MqttSendMessage mqttSendMessage = CommonConst.sendMessages.get(messageId);
            if (mqttSendMessage.getCtx() != null && mqttSendMessage.getCtx().isActive() && mqttSendMessage.getCtx().isWritable()) {
                if (mqttSendMessage.getState() == MqttMessageStateConst.PUB) {
                    if (mqttSendMessage.getResendCount() > CommonConst.MAX_RESEND_COUNT) {
                        log.error("未发送消息（" + messageId + "）超过最大重发次数，已忽略该消息");
                        CommonConst.sendMessages.remove(messageId);
                        continue;
                    }
                    if (checkResendTime(mqttSendMessage.getSendTime(), mqttSendMessage.getResendCount())) {
                        sendCmd(mqttSendMessage.isSsl(), mqttSendMessage.getMessageId(), mqttSendMessage.getTopicName(), mqttSendMessage.getPayload(), mqttSendMessage.getMqttQoS(), true);
                        mqttSendMessage.setSendTime(new Date().getTime());
                        mqttSendMessage.setResendCount(mqttSendMessage.getResendCount()+1);
                    }
                } else {
                    log.error("未完成发布报文（" + messageId + "）状态错误（" + mqttSendMessage.getMqttQoS() + ", " + mqttSendMessage.getState() + "）");
                }
            } else {
                /**
                 * 通道已关闭，删除消息
                 */
                CommonConst.sendMessages.remove(messageId);
            }
        }
    }

    public static boolean subscribeTopic(Boolean isSsl, List<MqttTopicSubscription> subscriptions){
        MqttSubscribePayload mqttSubscribePayload = new MqttSubscribePayload(subscriptions);
        MqttFixedHeader mqttFixedHeader = new MqttFixedHeader(MqttMessageType.SUBSCRIBE,false, MqttQoS.AT_LEAST_ONCE,false,0);
        MqttMessageIdVariableHeader mqttMessageIdVariableHeader =MqttMessageIdVariableHeader.from(MessageIdUtil.messageId());
        MqttSubscribeMessage mqttSubscribeMessage = new MqttSubscribeMessage(mqttFixedHeader,mqttMessageIdVariableHeader,mqttSubscribePayload);

        boolean retval = false;
        try {
            if( isSsl ) {
                retval = NettySSLClient.writeAndFlush(mqttSubscribeMessage);
            }else{
                retval = NettyClient.writeAndFlush(mqttSubscribeMessage);
            }
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return retval;
    }

    public static boolean unsubscribeTopic(Boolean isSsl, List<String> unSubscriptions){
        MqttUnsubscribePayload mqttUnsubscribePayload = new MqttUnsubscribePayload(unSubscriptions);
        MqttFixedHeader mqttFixedHeader = new MqttFixedHeader(MqttMessageType.UNSUBSCRIBE,false, MqttQoS.AT_LEAST_ONCE,false,0);
        MqttMessageIdVariableHeader mqttMessageIdVariableHeader =MqttMessageIdVariableHeader.from(MessageIdUtil.messageId());
        MqttUnsubscribeMessage mqttSubscribeMessage = new MqttUnsubscribeMessage(mqttFixedHeader,mqttMessageIdVariableHeader,mqttUnsubscribePayload);

        boolean retval = false;
        try {
            if( isSsl ) {
                retval = NettySSLClient.writeAndFlush(mqttSubscribeMessage);
            }else{
                retval = NettyClient.writeAndFlush(mqttSubscribeMessage);
            }
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return retval;
    }

//    public static void resendVerMessage(){
//        for (Long deviceId : CommonConst.verMessages.keySet()) {
//            MqttSendMessage mqttSendMessage = CommonConst.verMessages.get(deviceId);
//            if (mqttSendMessage.getCtx() != null && mqttSendMessage.getCtx().isActive() && mqttSendMessage.getCtx().isWritable()) {
//                if (mqttSendMessage.getState() == MqttMessageStateConst.PUB) {
//                    if (mqttSendMessage.getResendCount() > CommonConst.MAX_RESEND_COUNT) {
//                        log.error("未发送命令（" + deviceId + "）超过最大重发次数，已忽略该命令");
//                        CommonConst.verMessages.remove(deviceId);
//                        continue;
//                    }
//                    if (checkResendTime(mqttSendMessage.getSendTime(), mqttSendMessage.getResendCount()*5)) {
//                        sendCmd(mqttSendMessage.getDeviceId(), mqttSendMessage.getMessageId(), mqttSendMessage.getTopicName(), mqttSendMessage.getPayload(), mqttSendMessage.getMqttQoS(), true, mqttSendMessage.getVer(), mqttSendMessage.isMultiport());
//                        mqttSendMessage.setSendTime(new Date().getTime());
//                        mqttSendMessage.setResendCount(mqttSendMessage.getResendCount()+1);
//                    }
//                } else {
//                    log.error("未完成发布命令（" + deviceId + "）状态错误（" + mqttSendMessage.getMqttQoS() + ", " + mqttSendMessage.getState() + "）");
//                }
//            } else {
//                /**
//                 * 通道已关闭，删除消息
//                 */
//                CommonConst.verMessages.remove(deviceId);
//            }
//        }
//    }

    private static boolean checkResendTime(long sendTime, long interval) {
        return System.currentTimeMillis()-sendTime>=interval*1000;
    }

    /*public static void main(String[] args){

        JSONObject json = new JSONObject();
        json.put("CMD", 0);
        json.put("ID", "07978356742");
        json.put("SIM", "07978356792");
        json.put("KEY", "6C8BB7DCCE219283A153FC75C7687273");
        json.put("channelID", "b4df3465");

        // 解析content中的字段
        JSONObject jsonContent = JSONObject.fromObject("{\"CMD\":11,\"ID\":\"865192040645037\",\"CSQ\":\"-61\",\"MACHINE\":\"0X03\",\"ORDER\":[0,1,2,3,4,5,6,7,8,9]}");
        json.put("TargetCMD", 12);
        json.put("TargetID", jsonContent.get("ID"));
        json.put("MACHINE", jsonContent.get("MACHINE"));
        json.put("ORDER", jsonContent.get("ORDER"));

        initChannel();
        JSONObject json = new JSONObject();
        json.put("CMD", 0);
        json.put("ID", "07978356742");
        json.put("SIM", "07978356792");
        json.put("KEY", "6C8BB7DCCE219283A153FC75C7687273");
        json.put("channelID", "00000");

        // 解析content中的字段
        json.put("TargetCMD", 12);
        json.put("TargetID", "123");
        json.put("MACHINE", "213");
        json.put("ORDER", "123");

            NettyClient.sendMsg(json.toString());
        try {
            if( writeAndFlush(json.toString()) ) {
                System.out.println("YES");
            }else{
                System.out.println("NO");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }*/
}
