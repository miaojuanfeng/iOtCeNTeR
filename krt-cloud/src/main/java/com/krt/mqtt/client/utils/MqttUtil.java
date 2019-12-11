package com.krt.mqtt.client.utils;

import io.netty.buffer.ByteBuf;

import java.io.UnsupportedEncodingException;

public class MqttUtil {

    public static byte[] readBytes(ByteBuf byteBuf){
        byte[] bytes = new byte[byteBuf.readableBytes()];
        byteBuf.readBytes(bytes);
        return bytes;
    }

    public static String byteToString(byte[] bytes){
        return new String(bytes);
    }

    public static String byteToString(byte[] bytes, String charset) throws UnsupportedEncodingException {
        return new String(bytes, charset);
    }
}