package com.krt.access.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 应用列表实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("t_app")
public class TApp extends BaseEntity {

    /**
     * 应用名称
     */
    private String name;

}