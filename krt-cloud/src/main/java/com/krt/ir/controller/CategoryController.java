package com.krt.ir.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.ir.entity.Category;
import com.krt.ir.service.ICategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 类别表控制层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Controller
public class CategoryController extends BaseController {

    @Resource
    private ICategoryService categoryService;

    /**
     * 类别表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("ir:category:list")
    @GetMapping("ir/category/list")
    public String list() {
        return "ir/category/list";
    }

    /**
     * 类别表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("ir:category:list")
    @PostMapping("ir/category/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = categoryService.selectPageList(para);
        return DataTable.ok(page);
    }


    /**
     * 查看类别表页
     *
     * @param id 类别表id
     * @return {@link String}
     */
    @RequiresPermissions("ir:category:see")
    @GetMapping("ir/category/see")
    public String see(Integer id) {
        Category category = categoryService.selectById(id);
        request.setAttribute("category", category);
        return "ir/category/see";
    }



}
