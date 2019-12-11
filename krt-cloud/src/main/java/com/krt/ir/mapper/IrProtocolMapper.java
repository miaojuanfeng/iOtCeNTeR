package com.krt.ir.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.ir.entity.IrProtocol;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 红外协议映射层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Mapper
public interface IrProtocolMapper extends BaseMapper<IrProtocol>{
    /**
     * 通过id查询红外协议
     * @param id
     * @return
     */
    Map selectIrProtocolById(@Param(value = "id") Integer id);
}
