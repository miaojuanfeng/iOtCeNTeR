package com.krt;

import com.krt.access.thread.CallbackThread;
import com.krt.mqtt.client.thread.KeepAliveThread;
import com.krt.mqtt.client.thread.SendMessageThread;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * 程序启动类
 * @author 殷帅
 * @version 1.0
 * @date 2018年06月15日
 */
@ComponentScan("cn.afterturn.easypoi")
@ComponentScan("com.krt")
@EnableAspectJAutoProxy(exposeProxy = true)
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);

        new KeepAliveThread();
        new SendMessageThread();
        new CallbackThread();

        // 启动WebSocket服务端
//        WebSocket.start(32009);
    }
}
