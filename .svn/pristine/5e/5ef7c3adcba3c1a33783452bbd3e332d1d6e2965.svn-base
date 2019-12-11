package com.krt.access.service.impl;

import org.springframework.stereotype.Service;
import com.krt.access.entity.TCallbackLog;
import com.krt.access.mapper.TCallbackLogMapper;
import com.krt.access.service.ITCallbackLogService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.Map;


/**
 * 回调列表日志服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Service
public class TCallbackLogServiceImpl extends BaseServiceImpl<TCallbackLogMapper, TCallbackLog> implements ITCallbackLogService {

    @Resource
    private TCallbackLogMapper tCallbackLogMapper;

    /**
     * 插入一条回调日志
     * @param map
     */
    @Override
    public void insertByMap(Map map) {
        tCallbackLogMapper.insertByMap(map);
    }

}
