package com.krt.ir.service.Impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.ir.entity.IrProtocol;
import com.krt.ir.mapper.IrProtocolMapper;
import com.krt.ir.service.IIrProtocolService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 红外协议服务接口实现层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Service
public class IrProtocolServiceImpl extends BaseServiceImpl<IrProtocolMapper, IrProtocol> implements IIrProtocolService {

    @Resource
    private IrProtocolMapper irProtocolMapper;

    @Override
    public Map selectIrProtocolById(Integer id) {
        return irProtocolMapper.selectIrProtocolById(id);
    }

}
