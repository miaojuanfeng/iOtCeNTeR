package com.krt.access.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.access.service.ITAppService;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.access.entity.TCallback;
import com.krt.access.service.ITCallbackService;
import org.apache.ibatis.annotations.Param;
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
 * 回调列表控制层
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Controller
public class TCallbackController extends BaseController {

    @Autowired
    private ITCallbackService tCallbackService;

    @Autowired
    private ITAppService itAppService;

    /**
     * 回调列表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("TCallback:tCallback:list")
    @GetMapping("access/tCallback/list")
    public String list() {
        List list = itAppService.selectList();
        request.setAttribute("appList", list);

        return "access/tCallback/list";
    }

    /**
     * 回调列表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("TCallback:tCallback:list")
    @PostMapping("access/tCallback/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = tCallbackService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增回调列表页
     *
     * @return {@link String}
     */
    @RequiresPermissions("TCallback:tCallback:insert")
    @GetMapping("access/tCallback/insert")
    public String insert() {
        List list = itAppService.selectList();
        request.setAttribute("appList", list);

        return "access/tCallback/insert";
    }

    /**
     * 添加回调列表
     *
     * @param tCallback 回调列表
     * @return {@link ReturnBean}
     */
    @KrtLog("添加回调列表")
    @RequiresPermissions("TCallback:tCallback:insert")
    @PostMapping("access/tCallback/insert")
    @ResponseBody
    public ReturnBean insert(TCallback tCallback) {
//        tCallback.setStatus(0);
        tCallbackService.insert(tCallback);
        return ReturnBean.ok();
    }

    /**
     * 修改回调列表页
     *
     * @param id 回调列表id
     * @return {@link String}
     */
    @RequiresPermissions("TCallback:tCallback:update")
    @GetMapping("access/tCallback/update")
    public String update(Integer id) {
        TCallback tCallback = tCallbackService.selectById(id);
        List list = itAppService.selectList();
        request.setAttribute("appList", list);
        request.setAttribute("tCallback", tCallback);

        return "access/tCallback/update";
    }

    /**
     * 修改回调列表
     *
     * @param tCallback 回调列表
     * @return {@link ReturnBean}
     */
    @KrtLog("修改回调列表")
    @RequiresPermissions("TCallback:tCallback:update")
    @PostMapping("access/tCallback/update")
    @ResponseBody
    public ReturnBean update(TCallback tCallback) {
        tCallbackService.updateById(tCallback);
        return ReturnBean.ok();
    }

//    /**
//     * 回调地址测试
//     */
//    @KrtLog("测试回调地址")
//    @RequiresPermissions("TCallback:tCallback:test")
//    @PostMapping("access/tCallback/test")
//    @ResponseBody
//    public ReturnBean test(@Param("id") Integer id, @Param("url") String url) {
//        Boolean flag = tCallbackService.test(id, url);
//        if(flag){
//            return ReturnBean.ok("回调URL正常");
//
//        }else{
//            return ReturnBean.ok("回调URL异常");
//        }
//    }

    /**
     * 删除回调列表
     *
     * @param id 回调列表id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除回调列表")
    @RequiresPermissions("TCallback:tCallback:delete")
    @PostMapping("access/tCallback/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        tCallbackService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除回调列表
     *
     * @param ids 回调列表ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除回调列表")
    @RequiresPermissions("TCallback:tCallback:delete")
    @PostMapping("access/tCallback/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        tCallbackService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }

}
