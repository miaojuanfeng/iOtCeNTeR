package com.krt.ir.service.Impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.ir.entity.Brand;
import com.krt.ir.mapper.BrandMapper;
import com.krt.ir.service.IBrandService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * 品牌表服务接口实现层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Service
public class BrandServiceImpl extends BaseServiceImpl<BrandMapper, Brand> implements IBrandService {

    @Resource
    private BrandMapper brandMapper;

    /**
     * 根据品牌id 查询品牌名称
     * @param id
     * @return
     */
    @Override
    public String selectNameById(Integer id) {
        return brandMapper.selectNameById(id);
    }

}
