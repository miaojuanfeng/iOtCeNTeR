package com.krt.theme.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.cloud.entity.Device;
import com.krt.cloud.entity.Product;
import com.krt.cloud.service.DeviceService;
import com.krt.cloud.service.ProductService;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.mqtt.client.constant.CommonConst;
import com.krt.mqtt.client.netty.NettyCommon;
import com.krt.theme.entity.Theme;
import com.krt.theme.service.IThemeService;
import io.netty.handler.codec.mqtt.MqttQoS;
import io.netty.handler.codec.mqtt.MqttTopicSubscription;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 主题表控制层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
@Controller
public class ThemeController extends BaseController {

    @Autowired
    private IThemeService themeService;

    @Autowired
    private ProductService productService;

    @Autowired
    private DeviceService deviceService;

    /**
     * 主题表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("Theme:theme:list")
    @GetMapping("theme/theme/list")
    public String list() {
        List<Product> productList = productService.selectList();
        request.setAttribute("productList",productList);
        return "theme/theme/list";
    }

    /**
     * 主题表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("Theme:theme:list")
    @PostMapping("theme/theme/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = themeService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增主题表页
     *
     * @return {@link String}
     */
    @RequiresPermissions("Theme:theme:insert")
    @GetMapping("theme/theme/insert")
    public String insert() {
        List<Product> productList = productService.selectList();
        request.setAttribute("productList",productList);
        return "theme/theme/insert";
    }

    /**
     * 添加主题表
     *
     * @param theme 主题表
     * @return {@link ReturnBean}
     */
    @KrtLog("添加主题表")
    @RequiresPermissions("Theme:theme:insert")
    @PostMapping("theme/theme/insert")
    @ResponseBody
    public ReturnBean insert(Theme theme) {
        Product product = productService.selectById(theme.getProductId());
        List<Device> devices = deviceService.selectDeviceByProductId(theme.getProductId());
        List<Long> exclude = new ArrayList<>();
        exclude.add(CommonConst.DEVICE_ID);
        List<MqttTopicSubscription> subscriptions = new ArrayList<>();
        for( Device device : devices ){
            String deviceId = String.valueOf(device.getDeviceId());
            if( !exclude.contains(deviceId) ) {
                String t = theme.getTheme();
                String topic = t.replace("{deviceId}", deviceId);
                subscriptions.add(new MqttTopicSubscription(topic, MqttQoS.AT_LEAST_ONCE));
            }
        }
        if( subscriptions.size() > 0 ){
            NettyCommon.subscribeTopic(product.getSsl(), subscriptions);
        }
        themeService.insert(theme);
        return ReturnBean.ok();
    }

    /**
     * 修改主题表页
     *
     * @param id 主题表id
     * @return {@link String}
     */
    @RequiresPermissions("Theme:theme:update")
    @GetMapping("theme/theme/update")
    public String update(Integer id) {
        List<Product> productList = productService.selectList();
        request.setAttribute("productList",productList);
        Theme theme = themeService.selectById(id);
        request.setAttribute("theme", theme);
        return "theme/theme/update";
    }

    /**
     * 修改主题表
     *
     * @param theme 主题表
     * @return {@link ReturnBean}
     */
    @KrtLog("修改主题表")
    @RequiresPermissions("Theme:theme:update")
    @PostMapping("theme/theme/update")
    @ResponseBody
    public ReturnBean update(Theme theme) {
        themeService.updateById(theme);
        return ReturnBean.ok();
    }

    /**
     * 删除主题表
     *
     * @param id 主题表id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除主题表")
    @RequiresPermissions("Theme:theme:delete")
    @PostMapping("theme/theme/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        Theme theme = themeService.selectById(id);
        Product product = productService.selectById(theme.getProductId());
        List<Device> devices = deviceService.selectDeviceByProductId(theme.getProductId());
        List<Long> exclude = new ArrayList<>();
        exclude.add(CommonConst.DEVICE_ID);
        List<String> unsubscriptions = new ArrayList<>();
        for( Device device : devices ){
            String deviceId = String.valueOf(device.getDeviceId());
            if( !exclude.contains(deviceId) ) {
                String t = theme.getTheme();
                String topic = t.replace("{deviceId}", deviceId);
                unsubscriptions.add(topic);
            }
        }
        if( unsubscriptions.size() > 0 ){
            NettyCommon.unsubscribeTopic(product.getSsl(), unsubscriptions);
        }
        themeService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除主题表
     *
     * @param ids 主题表ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除主题表")
    @RequiresPermissions("Theme:theme:delete")
    @PostMapping("theme/theme/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        themeService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }

    /**
     * 主题校验
     *
     * @param theme 主题
     * @return {@link ReturnBean}
     */
    @GetMapping("theme/theme/check")
    @ResponseBody
    public ReturnBean check(Theme theme) {
        boolean exist = themeService.checkByTheme(theme);
        if (exist) {
            return ReturnBean.ok();
        } else {
            return ReturnBean.error();
        }
    }
}

