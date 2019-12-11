package com.krt.ir.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.ir.service.IIrProtocolService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 红外协议控制层
 *
 * @author zsl
 * @version 1.0
 * @date 2019年08月05日
 */
@Controller
public class IrProtocolController extends BaseController {

    @Resource
    private IIrProtocolService irProtocolService;

    /**
     * 红外协议管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("IrProtocol:irProtocol:list")
    @GetMapping("ir/irProtocol/list")
    public String list() {
        return "ir/irProtocol/list";
    }

    /**
     * 红外协议管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("IrProtocol:irProtocol:list")
    @PostMapping("ir/irProtocol/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = irProtocolService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 查看红外协议页
     *
     * @param id 红外协议id
     * @return {@link String}
     */
    @RequiresPermissions("IrProtocol:irProtocol:look")
    @GetMapping("ir/irProtocol/look")
    public String look(Integer id) {
        Map map = irProtocolService.selectIrProtocolById(id);
        request.setAttribute("irProtocol", map);
        return "ir/irProtocol/look";
    }


}
