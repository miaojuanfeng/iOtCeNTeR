package com.krt.access.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.access.entity.TCallback;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 回调列表映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Mapper
public interface TCallbackMapper extends BaseMapper<TCallback>{
//    /**
//     * 插入一条数据，获取插入的id
//     * @param callback
//     * @return
//     */
//    int insertCallbackByMap(TCallback callback);
//
//    /**
//     * 设置URL状态
//     * @param id url id
//     * @param status 状态码
//     */
//    void updateURLStatus(@Param("id") int id, @Param("status") int status);

    TCallback selectCallbackUrl(@Param("appId") Integer appId);

}
