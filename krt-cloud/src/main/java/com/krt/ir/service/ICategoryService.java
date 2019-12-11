package com.krt.ir.service;

import com.krt.common.base.IBaseService;
import com.krt.ir.entity.Category;

import java.util.List;
import java.util.Map;

/**
 * 类别表服务接口层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
public interface ICategoryService extends IBaseService<Category> {
    /**
     * 查询所有类别名和类别id集合
     * @return
     */
    List<Map> selectAllCategoryNames();
}
