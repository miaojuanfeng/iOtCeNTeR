package com.krt.cloud.utils;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class CommandIdUtil {

//    private static AtomicInteger index = new AtomicInteger(0);

    private static ConcurrentHashMap<Long, AtomicInteger> deviceCommandId = new ConcurrentHashMap<>();

    /**
     * 获取messageId
     * @return id
     */
    public static int commandId(Long deviceId){
        if( deviceCommandId.get(deviceId) == null ){
            deviceCommandId.put(deviceId, new AtomicInteger(0));
        }
        AtomicInteger index = deviceCommandId.get(deviceId);
        for (;;) {
            int current = index.get();
            int next = (current >= Integer.MAX_VALUE ? 0: current + 1);
            if (index.compareAndSet(current, next)) {
                return current;
            }
        }
    }
}