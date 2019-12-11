package com.krt.cloud.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.cloud.entity.Product;
import com.krt.cloud.service.ProductService;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author 郭明德
 * @version 1.2
 * @Description: 产品表控制层
 * @date 2019-04-08 21:21:42
 */
@Controller
public class ProductController extends BaseController {

    private static final String PRODUCT_ID_PREFIX = "83";

    @Autowired
    private ProductService productService;

    /**
     * 产品表管理页
     * @return
     */
    @RequiresPermissions("product_data:testProduct:list")
    @GetMapping("product/list")
    public String list() {
        return "product/list";
    }

    /**
     * 产品表管理
     * @param para 搜索参数
     * @return
     */
    @RequiresPermissions("product_data:testProduct:list")
    @PostMapping("product/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage<Product> page = productService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增产品表页
     * @return
     */
    @RequiresPermissions("product_data:testProduct:insert")
    @GetMapping("product/insert")
    public String insert() {
        return "product/insert";
    }

    /**
     * 添加产品表
     * @param product 产品表
     * @return
     */
    @KrtLog( "添加产品表")
    @RequiresPermissions("product_data:testProduct:insert")
    @PostMapping("product/insert")
    @ResponseBody
    public ReturnBean insert(Product product) {
        product.setProductId(Long.valueOf(PRODUCT_ID_PREFIX+String.valueOf(System.currentTimeMillis())));
        productService.insert(product);
        return ReturnBean.ok();
    }

    /**
     * 查看产品表页
     * @param id 产品表 id
     * @return
     */
    @RequiresPermissions("product_data:testProduct:check")
    @GetMapping("product/see")
    public String see(Integer id) {
        Product product = productService.selectById(id);
        request.setAttribute("product", product);
        return "product/see";
    }

    /**
     * 插入产品时，判断产品名称是否存在
     * true 表示允许添加，false 表示不允许添加
     */
    @ResponseBody
    @GetMapping("product/checkProductName")
    public Boolean checkProductName(String name) {
        String productId = productService.checkProductName(name);
        if(productId != null && productId.length() != 0){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 修改产品表页
     * @param id 产品表 id
     * @return
     */
    @RequiresPermissions("product_data:testProduct:update")
    @GetMapping("product/update")
    public String update(Integer id) {
        Product product = productService.selectById(id);
        request.setAttribute("product", product);
        return "product/update";
    }

    /**
     * 修改产品表
     * @param product 产品表
     * @return
     */
    @KrtLog( "修改产品表")
    @RequiresPermissions("product_data:testProduct:update")
    @PostMapping("product/update")
    @ResponseBody
    public ReturnBean update(Product product) {
        productService.updateById(product);
        return ReturnBean.ok();
    }

    /**
     * 删除产品表
     * @param id 产品表 id
     * @return
     */
    @KrtLog( "删除产品表")
    @RequiresPermissions("product_data:testProduct:delete")
    @PostMapping("product/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        productService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除产品表
     * @param ids 产品表 ids
     * @return
     */
    @KrtLog( "批量删除产品表")
    @RequiresPermissions("product_data:testProduct:delete")
    @PostMapping("product/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        productService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }

}
