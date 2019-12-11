package com.krt.cloud.entity;

import com.krt.common.base.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* @author LiXiang
* @version 1.0
* @Description: 云回复命令实体类
* @date 2019-04-12 10:52:59
*/
@Getter
@Setter
@ToString(callSuper = true)
public class DeviceCmd extends BaseEntity {

    /**
     * device_id
     */
    private Integer deviceId;

    private String topicName;
    /**
     * 命令
     */
    private String topicContent;

    private Integer status;

}