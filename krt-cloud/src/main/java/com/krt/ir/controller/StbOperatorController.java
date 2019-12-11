package com.krt.ir.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.ir.entity.StbOperator;
import com.krt.ir.service.IStbOperatorService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 机顶盒运营商控制层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Controller
public class StbOperatorController extends BaseController {

    @Resource
    private IStbOperatorService stbOperatorService;

    /**
     * 机顶盒运营商管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("StbOperator:stbOperator:list")
    @GetMapping("ir/stbOperator/list")
    public String list() {
        return "ir/stbOperator/list";
    }

    /**
     * 机顶盒运营商管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("StbOperator:stbOperator:list")
    @PostMapping("ir/stbOperator/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = stbOperatorService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增机顶盒运营商页
     *
     * @return {@link String}
     */
    @RequiresPermissions("StbOperator:stbOperator:insert")
    @GetMapping("ir/stbOperator/insert")
    public String insert() {
        return "ir/stbOperator/insert";
    }

    /**
     * 添加机顶盒运营商
     *
     * @param stbOperator 机顶盒运营商
     * @return {@link ReturnBean}
     */
    @KrtLog("添加机顶盒运营商")
    @RequiresPermissions("StbOperator:stbOperator:insert")
    @PostMapping("ir/stbOperator/insert")
    @ResponseBody
    public ReturnBean insert(StbOperator stbOperator) {
        stbOperatorService.insert(stbOperator);
        return ReturnBean.ok();
    }

    /**
     * 查看机顶盒运营商页
     *
     * @param id 机顶盒运营商id
     * @return {@link String}
     */
    @RequiresPermissions("StbOperator:stbOperator:look")
    @GetMapping("ir/stbOperator/look")
    public String look(Integer id) {
        Map map = stbOperatorService.selectStbOperatorById(id);
        request.setAttribute("stbOperator", map);
        return "ir/stbOperator/look";
    }




}
