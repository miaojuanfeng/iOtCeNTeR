package com.krt.cloud.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.cloud.entity.DeviceCmd;
import com.krt.cloud.service.DeviceCmdService;
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
 * @Description: 云回复命令控制层
 * @date 2019-04-12 10:53:00
 */
@Controller
public class DeviceCommandController extends BaseController {

    @Autowired
    private DeviceCmdService deviceCommandService;

    /**
     * 云回复命令管理页
     *
     * @return
     */
    @RequiresPermissions("deviceCommand:deviceCommand:list")
    @GetMapping("device/deviceCommand/list")
    public String list() {
        return "device/deviceCommand/list";
    }

    /**
     * 云回复命令管理
     *
     * @param para 搜索参数
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:list")
    @PostMapping("device/deviceCommand/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        if("product_name".equals(para.get("orderName"))){
            para.put("orderName", "s2.name");
        }
        if("device_name".equals(para.get("orderName"))){
            para.put("orderName", "s3.name");
        }
        IPage pageList = deviceCommandService.selectPageList(para);
        return DataTable.ok(pageList);
    }

    /**
     * 新增云回复命令页
     *
     * @return
     */
    @RequiresPermissions("deviceCommand:deviceCommand:insert")
    @GetMapping("device/deviceCommand/insert")
    public String insert() {
        return "device/deviceCommand/insert";
    }

    /**
     * 添加云回复命令
     *
     * @param deviceCommand 云回复命令
     * @return
     */
    @KrtLog( "添加云回复命令")
    @RequiresPermissions("deviceCommand:deviceCommand:insert")
    @PostMapping("device/deviceCommand/insert")
    @ResponseBody
    public ReturnBean insert(DeviceCmd deviceCommand) {
        deviceCommandService.insert(deviceCommand);
        return ReturnBean.ok();
    }

    /**
     * 修改云回复命令页
     *
     * @param id 云回复命令 id
     * @return
     */
    @RequiresPermissions("deviceCommand:deviceCommand:update")
    @GetMapping("device/deviceCommand/update")
    public String update(Integer id) {
        DeviceCmd deviceCommand = deviceCommandService.selectById(id);
        request.setAttribute("deviceCommand", deviceCommand);
        return "device/deviceCommand/update";
    }

    /**
     * 修改云回复命令
     *
     * @param deviceCommand 云回复命令
     * @return
     */
    @KrtLog( "修改云回复命令")
    @RequiresPermissions("deviceCommand:deviceCommand:update")
    @PostMapping("device/deviceCommand/update")
    @ResponseBody
    public ReturnBean update(DeviceCmd deviceCommand) {
        deviceCommandService.updateById(deviceCommand);
        return ReturnBean.ok();
    }

    /**
     * 删除云回复命令
     *
     * @param id 云回复命令 id
     * @return
     */
    @KrtLog("删除云回复命令")
    @RequiresPermissions("deviceCommand:deviceCommand:delete")
    @PostMapping("device/deviceCommand/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        deviceCommandService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除云回复命令
     *
     * @param ids 云回复命令 ids
     * @return
     */
    @KrtLog( "批量删除云回复命令")
    @RequiresPermissions("deviceCommand:deviceCommand:delete")
    @PostMapping("device/deviceCommand/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(String ids) {
        List list = Arrays.asList(ids);
        deviceCommandService.deleteByIds(list);
        return ReturnBean.ok();
    }

}
