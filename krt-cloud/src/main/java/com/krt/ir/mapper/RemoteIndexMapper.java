package com.krt.ir.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.ir.entity.RemoteIndex;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 遥控指示映射层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Mapper
public interface RemoteIndexMapper extends BaseMapper<RemoteIndex> {
    /**
     * 通过id查询遥控指示
     * @param id
     * @return
     */
    Map selectRemoteIndexById(@Param(value = "id") Integer id);

    /**
     * 根据码库id 查询 remote
     * @param id
     * @return
     */
    String selectRemoteById(@Param("id") String id);

}
