package com.krt.ir.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 机顶盒运营商实体类
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("stb_operator")
public class StbOperator extends BaseEntity {

    /**
     * 运营商id
     */
    private String operatorId;

    /**
     * 运营商名称
     */
    private String operatorName;

    /**
     * 城市代号
     */
    private String cityCode;

    /**
     * 城市名称
     */
    private String cityName;

    /**
     * 状态
     */
    private Byte status;

    /**
     * operator_name_tw
     */
    private String operatorNameTw;

}