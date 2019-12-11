package com.krt.access.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.access.entity.TApp;
import com.krt.access.service.ITAppService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Arrays;
import java.util.Map;

/**
 * 应用列表控制层
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Controller
public class TAppController extends BaseController {

    @Autowired
    private ITAppService tAppService;

    /**
     * 应用列表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("access:tApp:list")
    @GetMapping("access/tApp/list")
    public String list() {
        return "access/tApp/list";
    }

    /**
     * 应用列表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("access:tApp:list")
    @PostMapping("access/tApp/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = tAppService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增应用列表页
     *
     * @return {@link String}
     */
    @RequiresPermissions("access:tApp:insert")
    @GetMapping("access/tApp/insert")
    public String insert() {
        return "access/tApp/insert";
    }

    /**
     * 添加应用列表
     *
     * @param tApp 应用列表
     * @return {@link ReturnBean}
     */
    @KrtLog("添加应用列表")
    @RequiresPermissions("access:tApp:insert")
    @PostMapping("access/tApp/insert")
    @ResponseBody
    public ReturnBean insert(TApp tApp) {
        tAppService.insert(tApp);
        return ReturnBean.ok();
    }

    /**
     * 修改应用列表页
     *
     * @param id 应用列表id
     * @return {@link String}
     */
    @RequiresPermissions("access:tApp:update")
    @GetMapping("access/tApp/update")
    public String update(Integer id) {
        TApp tApp = tAppService.selectById(id);
        request.setAttribute("tApp", tApp);
        return "access/tApp/update";
    }

    /**
     * 修改应用列表
     *
     * @param tApp 应用列表
     * @return {@link ReturnBean}
     */
    @KrtLog("修改应用列表")
    @RequiresPermissions("access:tApp:update")
    @PostMapping("access/tApp/update")
    @ResponseBody
    public ReturnBean update(TApp tApp) {
        tAppService.updateById(tApp);
        return ReturnBean.ok();
    }

    /**
     * 删除应用列表
     *
     * @param id 应用列表id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除应用列表")
    @RequiresPermissions("access:tApp:delete")
    @PostMapping("access/tApp/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        tAppService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除应用列表
     *
     * @param ids 应用列表ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除应用列表")
    @RequiresPermissions("access:tApp:delete")
    @PostMapping("access/tApp/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        tAppService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }


}
