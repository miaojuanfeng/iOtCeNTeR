package com.krt.cloud.service.impl;

import com.krt.cloud.entity.Product;
import com.krt.common.constant.SysConstant;
import com.krt.common.validator.Assert;
import org.springframework.stereotype.Service;
import com.krt.cloud.mapper.ProductMapper;
import com.krt.cloud.service.ProductService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.Map;
import java.util.List;

/**
 * @author 郭明德
 * @version 1.0
 * @Description: 产品表服务接口实现层
 * @date 2019-04-08 21:21:42
 */
@Service
public class ProductServiceImpl extends BaseServiceImpl<ProductMapper, Product> implements ProductService {

    @Resource
    private ProductMapper productMapper;

    /**
     * 插入产品时，判断产品名称是否存在
     */
    @Override
    public String checkProductName(String name) {
        return productMapper.checkProductName(name);
    }

    /**
     * 设备管理需要 查询产品名称和id
     * @return
     */
    @Override
    public List<Map> selectNameAndId() {
        return productMapper.selectNameAndId();
    }

    @Override
    public Product selectByProductId(Long productId) {
        return productMapper.selectByProductId(productId);
    }

}
