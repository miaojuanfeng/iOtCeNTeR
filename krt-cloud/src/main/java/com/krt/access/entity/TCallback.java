package com.krt.access.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 回调列表实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("t_callback")
public class TCallback extends BaseEntity {

    /**
     * 应用ID
     */
    private Integer appId;

    /**
     * 回调URL
     */
    private String url;

//    /**
//     * 回调类型：1表设备数据回调，2表设备状态回调
//     */
//    private Integer type;

}