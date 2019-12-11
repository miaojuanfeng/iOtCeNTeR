package com.krt.ir.service;

import com.krt.common.base.IBaseService;
import com.krt.ir.entity.StbOperator;

import java.util.Map;

/**
 * 机顶盒运营商服务接口层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
public interface IStbOperatorService extends IBaseService<StbOperator> {
    /**
     * 通过id查询机顶盒运营商
     * @param id
     * @return
     */
    Map selectStbOperatorById(Integer id);

}
