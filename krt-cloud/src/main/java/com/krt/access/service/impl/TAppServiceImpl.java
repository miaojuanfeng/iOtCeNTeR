package com.krt.access.service.impl;

import org.springframework.stereotype.Service;
import com.krt.access.entity.TApp;
import com.krt.access.mapper.TAppMapper;
import com.krt.access.service.ITAppService;
import com.krt.common.base.BaseServiceImpl;


/**
 * 应用列表服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Service
public class TAppServiceImpl extends BaseServiceImpl<TAppMapper, TApp> implements ITAppService {

}
