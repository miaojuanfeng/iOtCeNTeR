package com.krt.ir.service.Impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.ir.entity.RemoteIndex;
import com.krt.ir.mapper.RemoteIndexMapper;
import com.krt.ir.service.IRemoteIndexService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 遥控指示服务接口实现层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Service
public class RemoteIndexServiceImpl extends BaseServiceImpl<RemoteIndexMapper, RemoteIndex> implements IRemoteIndexService {

    @Resource
    private RemoteIndexMapper remoteIndexMapper;

    /**
     * 通过id查询遥控指示
     * @param id
     * @return
     */
    @Override
    public Map selectRemoteIndexById(Integer id) {
        return remoteIndexMapper.selectRemoteIndexById(id);
    }

    /**
     * 根据码库id 查询 remote
     * @param id
     * @return
     */
    @Override
    public String selectRemoteById(String id) {
        return remoteIndexMapper.selectRemoteById(id);
    }

}
