package com.krt.ir.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 品牌表实体类
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("brand")
public class Brand extends BaseEntity {

    /**
     * 品牌名
     */
    private String name;

    /**
     * 类别id
     */
    private Integer categoryId;

    /**
     * 类别名
     */
    private String categoryName;

    /**
     * 状态
     */
    private Byte status;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 优先权
     */
    private Integer priority;

    /**
     * 品牌名_英文
     */
    private String nameEn;

    /**
     * 品牌名_繁体
     */
    private String nameTw;

    /**
     * 投稿人
     */
    private String contributor;

}