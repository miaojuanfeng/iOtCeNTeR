package com.krt.ir.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 遥控指示实体类
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("remote_index")
public class RemoteIndex extends BaseEntity {

    /**
     * category_id
     */
    private Integer categoryId;

    /**
     * 类别名称
     */
    private String categoryName;

    /**
     * brand_id
     */
    private Integer brandId;

    /**
     * 品牌名称
     */
    private String brandName;

    /**
     * city_code
     */
    private String cityCode;

    /**
     * 城市名称
     */
    private String cityName;

    /**
     * operator_id
     */
    private String operatorId;

    /**
     * 服务商名称
     */
    private String operatorName;

    /**
     * protocol
     */
    private String protocol;

    /**
     * remote
     */
    private String remote;

    /**
     * remote_map
     */
    private String remoteMap;

    /**
     * sub_cate
     */
    private Byte subCate;

    /**
     * 状态
     */
    private Byte status;

    /**
     * priority
     */
    private Integer priority;

    /**
     * remote_number
     */
    private String remoteNumber;

    /**
     * operator_name_tw
     */
    private String operatorNameTw;

    /**
     * category_name_tw
     */
    private String categoryNameTw;

    /**
     * brand_name_tw
     */
    private String brandNameTw;

    /**
     * city_name_tw
     */
    private String cityNameTw;

    /**
     * binary_md5
     */
    private String binaryMd5;

    /**
     * contributor
     */
    private String contributor;

    /**
     * update_time
     */
//    private String updateTime;

}