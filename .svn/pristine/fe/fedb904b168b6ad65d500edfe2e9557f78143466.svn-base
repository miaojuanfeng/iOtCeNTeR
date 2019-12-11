//package com.krt.cloud.controller;
//
//import com.alibaba.fastjson.JSONException;
//import com.alibaba.fastjson.JSONObject;
//import com.krt.mqtt.client.netty.NettyClient;
//import com.krt.mqtt.client.utils.MessageIdUtil;
//import com.krt.cloud.service.AnalogueService;
//import com.krt.common.base.BaseController;
//import io.netty.handler.codec.mqtt.MqttQoS;
//import org.apache.shiro.authz.annotation.RequiresPermissions;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.text.DateFormat;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Locale;
//import java.util.Map;
//
///**
// * @Author 郭明德
// * @Description 模拟设备控制层
// * @Date 2019/4/11 11:13
// *
// **/
//@Controller
//public class AnalogueController extends BaseController {
//
//    @Autowired
//    private AnalogueService analogueService;
//
//    @Autowired
//    private NettyClient nettyClient;
//
//    /**
//     *  模拟设备管理首页
//     */
//    @RequiresPermissions("analogue:analogue:list")
//    @GetMapping("analogueEquipment/list")
//    public String list(Map map) {
//        List<Map> analogue = analogueService.SelectAnalogue();
//        map.put("analogues", analogue);
//
//        return "analogue/list";
//    }
//
//    /**
//     * 接收模拟数据
//     */
//    @GetMapping("analogueDevice/AnalogueData")
//    @ResponseBody
//    public String analogueData(@RequestParam String data){
//        response.setContentType("application/json;charset=UTF-8");
//
//        //处理接收到的数据
//        data = data.replace("\\&quot;","\"");
//        data = data.replace(" ","");
//        data = data.replace("\\n","");
//        data = data.replace("&quot;","");
//
//        // 格式错误
//        String status = "4";
//        int cmd = -1;
//        JSONObject json = new JSONObject();
//        try{
//            json = JSONObject.parseObject(data);
//            cmd = Integer.parseInt(json.getString("CMD"));
//            if(cmd == 0){
//                //判断是否有channelID 和 content 字段
//                String deviceId = json.getString("deviceId");
//                String content = json.getString("content");
//                if(deviceId !=null && content !=null){
//                    //调用客户端方法,给设备发送命令
//                    String topicName = "/sys/productId/"+deviceId+"/thing/cmd/set";
//                    if( nettyClient.sendMsg(MessageIdUtil.messageId(), topicName, content.getBytes(), MqttQoS.AT_LEAST_ONCE, false) ) {
//                        //发送成功
//                        status = "1";
//                    }
//                }
//            }else{
//                if(cmd>-1 && cmd<100 && json.getString("ID")!=null && json.getString("SIM")!=null && json.getString("KEY")!=null){
//                    //解析成功
//                    status = "2";
//                }else{
//                    //解析失败
//                    status = "3";
//                }
//            }
//        }catch(JSONException e){
//            json.clear();
//            json.put("String", data);
//            //格式错误
//            status = "4";
//        }
//
//        //获取当前时间
//        String time = DateFormat.getDateTimeInstance(2, 2, Locale.CHINESE).format(new java.util.Date());
//
//        Map map = new HashMap(3);
//        map.put("command", json.toString());
//        map.put("status", status);
//        map.put("time", time);
//        analogueService.InsertData(map);
//
//       return status;
//    }
//
//}
