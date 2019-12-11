package com.krt.cloud.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.krt.common.bean.PageHelper;
import com.krt.common.bean.Query;
import com.krt.common.constant.SysConstant;
import com.krt.common.validator.Assert;
import org.springframework.stereotype.Service;
import com.krt.cloud.entity.Device;
import com.krt.cloud.mapper.DeviceMapper;
import com.krt.cloud.service.DeviceService;
import com.krt.common.base.BaseServiceImpl;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
 * @author FuCongYuan
 * @version 1.0
 * @Description: 我的设备服务接口实现层
 * @date 2019-04-13 10:10:21
 */
@Service
public class DeviceServiceImpl extends BaseServiceImpl<DeviceMapper,Device> implements DeviceService {

    @Resource
    private DeviceMapper deviceMapper;

    @Override
    public List selectByProductId(Integer id) {
        return baseMapper.selectByProductId(id);
    }

    @Override
    public int checkAvailable(String name, String value) {
        Map map=new HashMap();
        map.put("name",name);
        map.put("value",value);
        Map map1=deviceMapper.checkAvailable(map);
        if(map1==null){
            // 为空表示无重复
            return 1;
        }else{
            // 空 表示有重复
            return 0;
        }
    }

    @Override
    public List srcDeviceName() {
        return deviceMapper.srcDeviceName();
    }

    /**
     * 删除我的设备
     * @param id
     */
    @Override
    public void deleteDeviceById(Integer id) {
        deviceMapper.deleteDeviceById(id);
    }

    /**
     * 批量删除我的设备
     * @param idsStr
     */
    @Override
    public void deleteDeviceByIds(String idsStr) {
        if (!Assert.isEmpty(idsStr)) {
            String[] ids = idsStr.split(SysConstant.COMMA);
            deviceMapper.deleteDeviceByIds(ids);
        }
    }

    /**
     * 设备的启动和停止
     * @param state
     * @param id
     */
    @Override
    public void updateDeviceState(String state, String id) {
        deviceMapper.updateDeviceState(state, id);
    }

    @Override
    public Device selectEntityById(Integer id) {
        return deviceMapper.selectEntityById(id);
    }

    /**
     * 获取所有的设备类型
     * @return
     */
    @Override
    public List<Map> selectByDevType() {
        return deviceMapper.selectByDevType();
    }

    @Override
    public List<Device> selectByIds(Integer[] ids) {
        return deviceMapper.selectByIds(ids);
    }

    @Override
    public List<Map> selectByDeviceIds(String[] deviceIds) {
        return deviceMapper.selectByDeviceIds(deviceIds);
    }

    @Override
    public List<Map> selectDeviceList() {
        return deviceMapper.selectDeviceList();
    }

    /**
     * 根据设备类型和品牌选择码库
     * @return
     */
    @Override
    public IPage selectCodeBank(Map para) {
        Query query = new Query(para);
        Page page = query.getPage();
        PageHelper.startPage(page);
        List list = deviceMapper.selectCodeBank(para);
        page.setRecords(list);
        return page;
    }

    /**
     * 根据品牌id 查询品牌名称
     * @param id
     * @return
     */
    @Override
    public String selectBrandById(Integer id) {
        return null;
    }

    @Override
    public List<Device> listDevices() {
        return baseMapper.listDevices();
    }

    @Override
    public List<Device> selectDeviceByProductId(Integer id) {
        return baseMapper.selectDeviceByProductId(id);
    }

}