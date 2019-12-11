package com.krt.cloud.service.impl;

import com.krt.cloud.entity.t1AnalogusDevice;
import com.krt.cloud.mapper.AnalogueMapper;
import com.krt.cloud.service.AnalogueService;
import com.krt.common.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author 郭明德
 * @Description
 * @Date 2019/4/11 11:19
 *
 **/
@Service
public class AnalogueServiceImpl extends BaseServiceImpl<AnalogueMapper, t1AnalogusDevice> implements AnalogueService{

    @Resource
    private AnalogueMapper analogueMapper;

    /**
     * 添加模拟数据
     * @param m
     */
    @Override
    public void InsertData(Map m) {
        analogueMapper.InsertData(m);
    }

    /**
     * 查询模拟数据
     * @return
     */
    @Override
    public List<Map> SelectAnalogue() {
        List<Map> list = analogueMapper.SelectAnalogue();
        return list;
    }

}
