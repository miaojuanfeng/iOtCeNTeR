package com.krt.ir.service;

import com.krt.common.base.IBaseService;
import com.krt.ir.entity.RemoteIndex;

import java.util.Map;


/**
 * 遥控指示服务接口层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
public interface IRemoteIndexService extends IBaseService<RemoteIndex> {

    /**
     * 通过id查询遥控指示
     * @param id
     * @return
     */
    Map selectRemoteIndexById(Integer id);

    /**
     * 根据码库id 查询 remote
     * @param id
     * @return
     */
    String selectRemoteById(String id);

}
