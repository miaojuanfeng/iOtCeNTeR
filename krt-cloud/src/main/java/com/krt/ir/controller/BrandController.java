package com.krt.ir.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.ir.entity.Brand;
import com.krt.ir.service.IBrandService;
import com.krt.ir.service.ICategoryService;
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
 * 品牌表控制层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月05日
 */
@Controller
public class BrandController extends BaseController {

    @Resource
    private IBrandService brandService;

    @Resource
    private ICategoryService categoryService;

    /**
     * 品牌表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("ir:brand:list")
    @GetMapping("ir/brand/list")
    public String list() {
        List<Map> categories = categoryService.selectAllCategoryNames();
        request.setAttribute("categories", categories);
        return "ir/brand/list";
    }

    /**
     * 品牌表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("ir:brand:list")
    @PostMapping("ir/brand/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = brandService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 查看品牌表页
     *
     * @param id 品牌表id
     * @return {@link String}
     */
    @RequiresPermissions("ir:brand:see")
    @GetMapping("ir/brand/see")
    public String see(Integer id) {
        Brand brand = brandService.selectById(id);
        request.setAttribute("brand", brand);
        return "ir/brand/see";
    }


}
