package com.krt.ir.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.ir.entity.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 类别表映射层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
    /**
     * 查询所有的类别名
     * @return
     */
    List<Map> selectAllCategoryNames();
}
