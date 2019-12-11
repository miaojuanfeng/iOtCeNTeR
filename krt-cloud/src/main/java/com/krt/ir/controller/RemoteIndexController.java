package com.krt.ir.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.ir.service.ICategoryService;
import com.krt.ir.service.IRemoteIndexService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 遥控指示控制层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Controller
public class RemoteIndexController extends BaseController {

    @Resource
    private IRemoteIndexService remoteIndexService;
    @Resource
    private ICategoryService iCategoryService;

    /**
     * 遥控指示管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("RemoteIndex:remoteIndex:list")
    @GetMapping("ir/remoteIndex/list")
    public String list() {
        List<Map> categories = iCategoryService.selectAllCategoryNames();
        request.setAttribute("categories", categories);
        return "ir/remoteIndex/list";
    }

    /**
     * 遥控指示管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("RemoteIndex:remoteIndex:list")
    @PostMapping("ir/remoteIndex/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = remoteIndexService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 查看遥控指示页
     *
     * @param id 遥控指示id
     * @return {@link String}
     */
    @RequiresPermissions("RemoteIndex:remoteIndex:look")
    @GetMapping("ir/remoteIndex/look")
    public String look(Integer id) {
        Map map = remoteIndexService.selectRemoteIndexById(id);
        request.setAttribute("remoteIndex", map);
        return "ir/remoteIndex/look";
    }





}
