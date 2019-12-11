package com.krt.ir.service;

import com.krt.common.base.IBaseService;
import com.krt.ir.entity.IrProtocol;

import java.util.Map;

/**
 * 红外协议服务接口层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
public interface IIrProtocolService extends IBaseService<IrProtocol> {
    /**
     * 通过id查询红外协议
     * @param id
     * @return
     */
     Map selectIrProtocolById(Integer id);

}
