package com.krt.mqtt.client.netty;

import com.krt.access.thread.CallbackThread;
import com.krt.mqtt.client.beans.MqttSendMessage;
import com.krt.mqtt.client.constant.CommonConst;
import com.krt.mqtt.client.constant.MqttMessageStateConst;
import com.krt.mqtt.client.thread.KeepAliveThread;
import com.krt.mqtt.client.thread.SendMessageThread;
import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.mqtt.*;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.net.ssl.KeyManagerFactory;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Component
public class NettyClient implements ApplicationContextAware {

    @Autowired
    private static NettyClientInitializer nettyClientInitializer;

    private static Bootstrap bootstrap = null;

    private static Channel channel = null;

    private static EventLoopGroup group = null;

    private static Object lock = new Object();

    private static final String jksPath = "/home/krt/iot/iot-mqttsev-32009/SHA256withRSA_iot.krtyun.com.jks";
//    private static final String jksPath = "C:\\Users\\k\\Desktop\\SHA256withRSA_iot.krtyun.com.jks";

    private static final String jksPassword = "az8TMPQ78S1f";

    /**
     * Bootstrap 客户端初始化
     */
    public static void initBootstrap() {
        try {
            KeyManagerFactory keyManagerFactory = null;
            KeyStore keyStore = KeyStore.getInstance("JKS");
            keyStore.load(new FileInputStream(jksPath), jksPassword.toCharArray());
            keyManagerFactory = KeyManagerFactory.getInstance("SunX509");
            keyManagerFactory.init(keyStore, jksPassword.toCharArray());

            group = new NioEventLoopGroup();
            bootstrap = new Bootstrap();
            bootstrap.group(group).channel(NioSocketChannel.class);
            bootstrap.handler(nettyClientInitializer);
            bootstrap.option(ChannelOption.SO_KEEPALIVE, true);
        }catch (Exception e){
            log.info("连接初始化失败");
            e.printStackTrace();
        }
    }

    /**
     * 获得连接通道 channel
     * @return
     */
    public static void initChannel() {
        if( bootstrap == null ){
            initBootstrap();
        }
        try {
            channel = bootstrap.connect(CommonConst.HOST, CommonConst.PORT).sync().channel();
        } catch (InterruptedException e) {
            log.info("连接MQTT服务器失败：" + CommonConst.HOST + ":" + CommonConst.PORT);
            e.printStackTrace();
        }
    }

    public static boolean writeAndFlush(Object content) throws InterruptedException {
        synchronized (lock) {
            if (channel == null || !channel.isActive() || !channel.isWritable()) {
                initChannel();
                Thread.sleep(1000);
            }
        }
        if (channel != null && channel.isActive() && channel.isWritable()) {
            channel.writeAndFlush(content);
            return true;
        }
        return false;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        if( nettyClientInitializer == null ){
            nettyClientInitializer = applicationContext.getBean(NettyClientInitializer.class);
        }
        //initChannel();
    }

    public static Channel getChannel() {
        return channel;
    }
}
