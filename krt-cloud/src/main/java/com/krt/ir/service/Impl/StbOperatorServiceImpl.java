package com.krt.ir.service.Impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.ir.entity.StbOperator;
import com.krt.ir.mapper.StbOperatorMapper;
import com.krt.ir.service.IStbOperatorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 机顶盒运营商服务接口实现层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Service
public class StbOperatorServiceImpl extends BaseServiceImpl<StbOperatorMapper, StbOperator> implements IStbOperatorService {

    @Resource
    private StbOperatorMapper stbOperatorMapper;

    /**
     * 通过id查询机顶盒运营商
     *
     * @param id
     * @return
     */
    @Override
    public Map selectStbOperatorById(Integer id) {
        return stbOperatorMapper.selectStbOperatorById(id);
    }

}
