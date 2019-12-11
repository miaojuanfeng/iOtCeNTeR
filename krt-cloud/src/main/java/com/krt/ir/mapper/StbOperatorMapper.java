package com.krt.ir.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.ir.entity.StbOperator;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 机顶盒运营商映射层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Mapper
public interface StbOperatorMapper extends BaseMapper<StbOperator>{
    /**
     * 通过id查询机顶盒运营商
     * @param id
     * @return
     */
    Map selectStbOperatorById(@Param(value = "id") Integer id);
}
