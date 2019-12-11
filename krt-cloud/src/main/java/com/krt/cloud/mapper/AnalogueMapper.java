package com.krt.cloud.mapper;

import com.krt.cloud.entity.t1AnalogusDevice;
import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @Author 郭明德
 * @Description
 * @Date 2019/4/11 11:21
 *
 **/
@Mapper
public interface AnalogueMapper extends BaseMapper<t1AnalogusDevice>{

    /**
     * 添加数据
     */
    void InsertData(Map m);
    /**
     * 查询模拟数据
     * @return
     */
    List<Map> SelectAnalogue();

}