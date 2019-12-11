package com.krt.cloud.entity;

import com.krt.common.base.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* @author LiXiang
* @version 1.0
* @Description: 设备数据实体类
* @date 2019-04-10 15:19:53
*/
@Getter
@Setter
@ToString(callSuper = true)
public class DeviceData extends BaseEntity {

    /**
     * 设备id
     */
    private String deviceId;

    /**
     * 数据类型
     */
    private String dataType;

    /**
     * 设备数据
     */
    private String deviceData;

    /**
     * 是否被删除 0被删除 1未被删除
     */
    private String isDelete;

}