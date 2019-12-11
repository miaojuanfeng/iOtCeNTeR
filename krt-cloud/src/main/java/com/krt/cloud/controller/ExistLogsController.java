package com.krt.cloud.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.cloud.service.ExistLogsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * @author chenwu
 * @version 1.0
 * @Description: 设备上下线日志控制层
 * @date 2019-04-22 09:14:56
 */
@Controller
public class ExistLogsController extends BaseController {

    @Autowired
    private ExistLogsService existLogsService;

    /**
     * 设备上下线日志管理页
     *
     * @return
     */
    @RequiresPermissions("ExistLogs:existLogs:list")
    @GetMapping("device/existLogs/list")
    public String list() {
        return "device/existLogs/list";
    }

    /**
     * 设备上下线日志管理
     *
     * @param para 搜索参数
     * @return
     */
    @RequiresPermissions("deviceData:deviceData:list")
    @PostMapping("device/existLogs/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        if("product_name".equals(para.get("orderName"))){
            para.put("orderName", "s2.name");
        }
        if("device_name".equals(para.get("orderName"))){
            para.put("orderName", "s3.name");
        }
        // 多字段排序
        para.put("orderName", para.get("orderName")+",s1.id");

        IPage page = existLogsService.selectPageList(para);
        return DataTable.ok(page);
    }

}
