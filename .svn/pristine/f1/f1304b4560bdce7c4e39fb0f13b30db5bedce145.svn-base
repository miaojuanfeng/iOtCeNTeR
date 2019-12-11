package com.krt.cloud.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* @author 郭明德
* @version 1.0
* @Description: 产品表实体类
* @date 2019-04-08 21:21:42
*/
@TableName("t_product")
@Getter
@Setter
@ToString(callSuper = true)
public class Product extends BaseEntity {
    /**
     * 产品编号
     */
    private Long productId;
    /**
     * 产品名称
     */
    private String name;

    /**
     * 产品描述
     */
    private String detail;
    /**
     * 是否开启ssl
     */
    @TableField(value="`ssl`")
    private Boolean ssl;

}