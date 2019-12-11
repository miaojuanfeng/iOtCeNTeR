package com.krt.cloud.service.impl;

import org.springframework.stereotype.Service;
import com.krt.cloud.entity.DeviceData;
import com.krt.cloud.mapper.DeviceDataMapper;
import com.krt.cloud.service.DeviceDataService;
import com.krt.common.base.BaseServiceImpl;


/**
 * @author LiXiang
 * @version 1.0
 * @Description: 设备数据服务接口实现层
 * @date 2019-04-10 15:19:53
 */
@Service
public class DeviceDataServiceImpl extends BaseServiceImpl<DeviceDataMapper,DeviceData> implements DeviceDataService {

}
