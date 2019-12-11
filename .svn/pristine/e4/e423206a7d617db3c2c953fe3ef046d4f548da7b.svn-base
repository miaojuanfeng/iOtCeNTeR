//package com.krt.api.controller.cloud;
//
//
//import com.alibaba.fastjson.JSONObject;
//import com.krt.common.annotation.KrtIgnoreAuth;
//import com.krt.common.base.BaseController;
//import com.krt.mqtt.client.netty.NettyClient;
//import com.krt.mqtt.client.utils.MessageIdUtil;
//import io.netty.handler.codec.mqtt.MqttQoS;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiImplicitParam;
//import io.swagger.annotations.ApiImplicitParams;
//import io.swagger.annotations.ApiOperation;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * @Author 郭明德
// * @Description 任务下单控制层api
// * @Date 2019年5月16日11:05:40
// *
// **/
//@RequestMapping("api")
//@Api(tags = "3、任务下单API")
//@RestController
//public class ApiOrderController extends BaseController {
//
//    @Autowired
//    private NettyClient nettyClient;
//
//    /**
//     * 接收下单数据 post
//     */
//    @KrtIgnoreAuth
//    @PostMapping("apiOrder")
//    @ApiOperation(value = "接收下单任务数据", notes = "Post方法接收下单任务数据")
//    @ApiImplicitParams({
//            @ApiImplicitParam(paramType = "query", dataType = "string", name = "data", value = "下单数据", required = true)
//    })
//    public String analogueDataPost(String data) {
//        response.setContentType("text/html;charset=UTF-8");
//
//        //处理接收到的数据
//        data = data.replace(" ", "");
//        data = data.replace("\\n", "");
//        data = data.replace("&quot;", "\"");
//
//        //状态码 0表失败 1表成功 2表程序错误
//        String sign = "2";
//
//        try {
//            JSONObject json = JSONObject.parseObject(data);
//
//            int cmd = Integer.parseInt(json.getString("CMD"));
//            String deviceId = json.getString("deviceId");
//            String content = json.getString("content");
//            if(cmd == 0){
//                //调用客户端方法,给设备发送命令 接收返回值判断发送状态
//                String topicName = "/sys/productId/"+deviceId+"/thing/cmd/set";
//                if( nettyClient.sendMsg(MessageIdUtil.messageId(), topicName, content.getBytes(), MqttQoS.AT_LEAST_ONCE, false) ) {
//                    sign = "1";
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // 程序错误
//            return "2";
//        }
//
//        return sign;
//    }
//
//}
