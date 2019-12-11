package com.krt.ir.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 红外协议实体类
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("ir_protocol")
public class IrProtocol extends BaseEntity {

    /**
     * 名称
     */
    private String name;

    /**
     * 状态
     */
    private Byte status;

    /**
     * 类型
     */
    private Byte type;

    /**
     * 投稿人
     */
    private String contributor;

    /**
     * 启动代码
     */
    private String bootCode;

    /**
     * 修改时间
     */
//    private String updateTime;



}