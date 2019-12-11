package com.krt.cloud.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* @author FuCongYuan
* @version 1.0
* @Description: 我的设备实体类
* @date 2019-04-13 10:10:21
*/
@TableName("t_device")
@Getter
@Setter
@ToString(callSuper = true)
public class Device extends BaseEntity {

    /**
     * 设备各称
     */
    private String name;

    /**
     * 设备ID
     */
    private Long deviceId;

    /**
     * 设备标识码
     */
    private String deviceCode;

    /**
     * 验证码
     */
    private String verifyCode;

    /**
     * 设备类型
     */
    private Integer deviceType;

    /**
     * 所属产品id
     */
    private Long productId;

    /**
     * 状态0启动  1 暂停  2作废
     */
    private Integer state;

    /**
     * 设备的地址
     */
    private String deviceAddress;
}