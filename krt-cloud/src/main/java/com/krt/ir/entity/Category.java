package com.krt.ir.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 类别表实体类
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("category")
public class Category extends BaseEntity {

    /**
     * 类别名
     */
    private String name;

    /**
     * 状态
     */
    private Byte status;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 类别名_英文
     */
    private String nameEn;

    /**
     * 类别名_繁体
     */
    private String nameTw;

    /**
     * 投稿人
     */
    private String contributor;

}