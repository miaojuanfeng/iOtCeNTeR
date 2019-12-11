package com.krt.ir.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.ir.entity.Brand;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 品牌表映射层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Mapper
public interface BrandMapper extends BaseMapper<Brand> {

    /**
     * 根据品牌id 查询品牌名称
     * @param id
     * @return
     */
    String selectNameById(@Param("id") Integer id);

}
