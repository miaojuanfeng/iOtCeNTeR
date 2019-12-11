package com.krt.ir.service.Impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.ir.entity.Category;
import com.krt.ir.mapper.CategoryMapper;
import com.krt.ir.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 类别表服务接口实现层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Service
public class CategoryServiceImpl extends BaseServiceImpl<CategoryMapper, Category> implements ICategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    /**
     * 查询所有类别名和类别id的集合
     * @return
     */
    @Override
    public List<Map> selectAllCategoryNames() {
        return categoryMapper.selectAllCategoryNames();
    }
}
