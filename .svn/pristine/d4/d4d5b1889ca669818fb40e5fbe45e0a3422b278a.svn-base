//package com.krt.api.controller.cloud;
//
//import com.alibaba.fastjson.JSONObject;
//import com.krt.mqtt.client.netty.NettyClient;
//import com.krt.mqtt.client.utils.MessageIdUtil;
//import com.krt.cloud.service.AnalogueService;
//import com.krt.common.annotation.KrtIgnoreAuth;
//import com.krt.common.base.BaseController;
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
//import java.text.DateFormat;
//import java.util.HashMap;
//import java.util.Locale;
//import java.util.Map;
//
///**
// * @Author 郭明德
// * @Description 模拟设备控制层api接口
// * @Date 2019/4/29 19:58:59
// *
// **/
//@RequestMapping("api")
//@Api(tags = "4、模拟设备API")
//@RestController
//public class ApiAnalogueController extends BaseController {
//
//    /**
//     * 保存数据
//     */
//    @Autowired
//    private AnalogueService analogueService;
//
//    @Autowired
//    private NettyClient nettyClient;
//
//    /**
//     * 接收模拟数据 post
//     */
//    @KrtIgnoreAuth
//    @PostMapping("analogueDevice/AnalogueDataApi")
//    @ApiOperation(value = "接收模拟数据", notes = "Post方法接收模拟数据")
//    @ApiImplicitParams({
//            @ApiImplicitParam(paramType = "query", dataType = "string", name = "data", value = "数据", required = true),
//            @ApiImplicitParam(paramType = "query", dataType = "string", name = "device", value = "设备id", required = true)
//    })
//    public String analogueDataPost(String data, String device) {
//        response.setContentType("text/html;charset=UTF-8");
//
//        //处理接收到的数据
//        data = data.replace(" ", "");
//        data = data.replace("\\n", "");
//        data = data.replace("&quot;", "\"");
//
//        //接收成功
//        String status = "1";
//        String sign = "2";
//        int cmd = -1;
//        JSONObject json = new JSONObject();
//        try {
//            json = JSONObject.parseObject(data);
//            cmd = Integer.parseInt(json.getString("CMD"));
//            //判断是否是否是转发至设备的命令
//            if (cmd == 0) {
//                String deviceId = json.getString("deviceId");
//                String content = json.getString("content");
//                //调用客户端方法,给设备发送命令 接收返回值判断发送状态
//                String topicName = "/sys/productId/"+deviceId+"/thing/cmd/set";
//                if( nettyClient.sendMsg(MessageIdUtil.messageId(), topicName, content.getBytes(), MqttQoS.AT_LEAST_ONCE, false) ){
//                    sign = "1";
//                }
//            } else{
//                if (cmd > -1 && cmd < 100 && json.getString("ID") != null && json.getString("SIM") != null && json.getString("KEY") != null) {
//                    //解析成功
//                    status = "2";
//                } else {
//                    //解析失败
//                    status = "3";
//                }
//            }
//        } catch (Exception e) {
//            json.clear();
//            json.put("String", data);
//            //格式错误
//            status = "4";
//            e.printStackTrace();
//        }
//
//        //获取当前时间
//        String time = DateFormat.getDateTimeInstance(2, 2, Locale.CHINESE).format(new java.util.Date());
//
//        Map map = new HashMap(8);
//        map.put("command", json.toString());
//        map.put("status", status);
//        map.put("time", time);
//        analogueService.InsertData(map);
//
//        //状态码 0表失败 1表成功 2表程序错误
//        return sign;
//    }
//
//}
