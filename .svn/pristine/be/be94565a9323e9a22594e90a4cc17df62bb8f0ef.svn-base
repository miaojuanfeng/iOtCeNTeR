package com.krt.cloud.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.cloud.entity.DeviceData;
import com.krt.cloud.service.DeviceDataService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author LiXiang
 * @version 1.0
 * @Description: 设备数据控制层
 * @date 2019-04-10 15:19:53
 */
@Controller
public class DeviceDataController extends BaseController {

    @Autowired
    private DeviceDataService deviceDataService;

    /**
     * 设备数据管理页
     *
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:list")
    @GetMapping("device/deviceData/list")
    public String list() {
        return "device/deviceData/list";
    }

    /**
     * 设备数据管理
     *
     * @param para 搜索参数
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:list")
    @PostMapping("device/deviceData/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        if("product_name".equals(para.get("orderName"))){
            para.put("orderName", "s3.name");
        }
        if("device_name".equals(para.get("orderName"))){
            para.put("orderName", "s2.name");
        }
        IPage page = deviceDataService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增设备数据页
     *
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:insert")
    @GetMapping("device/deviceData/insert")
    public String insert() {
        return "device/deviceData/insert";
    }

    /**
     * 添加设备数据
     *
     * @param deviceData 设备数据
     * @return
     */
    @KrtLog( "添加设备数据")
    @RequiresPermissions("deviceData:deviceData:insert")
    @PostMapping("device/deviceData/insert")
    @ResponseBody
    public ReturnBean insert(DeviceData deviceData) {
        deviceDataService.insert(deviceData);
        return ReturnBean.ok();
    }

    /**
     * 修改设备数据页
     *
     * @param id 设备数据 id
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:update")
    @GetMapping("device/deviceData/update")
    public String update(Integer id) {
        DeviceData deviceData = deviceDataService.selectById(id);
        request.setAttribute("deviceData", deviceData);
        return "device/deviceData/update";
    }

    /**
     * 修改设备数据
     *
     * @param deviceData 设备数据
     * @return
     */
    @KrtLog( "修改设备数据")
    @RequiresPermissions("deviceData:deviceData:update")
    @PostMapping("device/deviceData/update")
    @ResponseBody
    public ReturnBean update(DeviceData deviceData) {
        deviceDataService.updateById(deviceData);
        return ReturnBean.ok();
    }

    /**
     * 删除设备数据
     *
     * @param id 设备数据 id
     * @return
     */
    @KrtLog( "删除设备数据")
    @RequiresPermissions("deviceData:deviceData:delete")
    @PostMapping("device/deviceData/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        deviceDataService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除设备数据
     *
     * @param ids 设备数据 ids
     * @return
     */
    @KrtLog( "批量删除设备数据")
    @RequiresPermissions("deviceData:deviceData:delete")
    @PostMapping("device/deviceData/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(String ids) {
        List list = Arrays.asList(ids);
        deviceDataService.deleteByIds(list);
        return ReturnBean.ok();
    }

}
