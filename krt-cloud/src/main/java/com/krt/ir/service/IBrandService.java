package com.krt.ir.service;

import com.krt.common.base.IBaseService;
import com.krt.ir.entity.Brand;

/**
 * 品牌表服务接口层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
public interface IBrandService extends IBaseService<Brand> {

    String selectNameById(Integer id);

}
