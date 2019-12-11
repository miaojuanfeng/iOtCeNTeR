package com.krt.cloud.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.IBaseService;
import com.krt.cloud.entity.Device;

import java.util.List;
import java.util.Map;

/**
 * @author FuCongYuan
 * @version 1.0
 * @Description: 我的设备服务接口层
 * @date 2019-04-13 10:10:21
 */
public interface DeviceService extends IBaseService<Device> {


    List selectByProductId(Integer id);

    int checkAvailable(String name, String value);

    List srcDeviceName();

    void deleteDeviceById(Integer id);

    void deleteDeviceByIds(String ids);

    void updateDeviceState(String state, String id);

    Device selectEntityById(Integer id);

    List<Map> selectByDevType();

    List<Device> selectByIds(Integer[] ids);

    List<Map> selectByDeviceIds(String[] deviceIds);

    List<Map> selectDeviceList();

    IPage selectCodeBank(Map para);

    String selectBrandById(Integer id);

    /**
     * 获取所有设备
     * @return
     */
    List<Device> listDevices();

    List<Device> selectDeviceByProductId(Integer id);
}
