package com.krt.api.controller.cloud;

import com.krt.common.annotation.KrtIgnoreAuth;
import com.krt.common.base.BaseController;
import com.krt.common.bean.ReturnBean;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 郭明德
 * @description 应用连接，回调功能测试接口
 * @date 2019/8/9 19:40
 */
@RequestMapping("api")
@Api(tags = "6、回调功能测试API", description = "应用连接模块回调功能测试接口")
@RestController
public class ApiCallbackTest extends BaseController {

    /**
     * 回调功能测试 post
     */
    @KrtIgnoreAuth
    @PostMapping("callback/postTest")
    @ApiOperation(value = "接收回调测试数据", notes = "Post方法")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "string", name = "msg", value = "测试数据", required = false)
    })
    public ReturnBean callbackPost(String data) {
        response.setContentType("text/html;charset=UTF-8");
        if(data != null){
            return ReturnBean.ok(data);

        }else{
            return ReturnBean.error();
        }
    }

    /**
     * 回调功能测试 get
     */
    @KrtIgnoreAuth
    @GetMapping("callback/getTest")
    @ApiOperation(value = "接收回调测试数据", notes = "Get方法")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "string", name = "msg", value = "测试数据", required = false)
    })
    public ReturnBean callbackGet(String data) {
        response.setContentType("text/html;charset=UTF-8");
        if(data != null){
            return ReturnBean.ok(data);
        }else{
            return ReturnBean.error();
        }
    }

}
