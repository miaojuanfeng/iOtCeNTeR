<#include "/common/layoutList.ftl">
<@header>
    <style type="text/css">
        #TextArea {
            float: left;
        }

        #TextData {
            float: left;
            margin-left: 40px;
            width: 1200px;
        }

        #clear {
            clear: both;
        }
    </style>
</@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <!-- Main content -->
        <section class="content">
            <!-- 列表数据区 -->
            <div class="box-krt">
                <div class="box-body">
                    <div class="table-responsive">
                        <!-- 工具按钮区 -->
                        <div style="margin-top:20px;">
                            <label for="AnalogueData" class="control-label " style="padding:0 5px">模拟发送数据：</label>
                            <label for="HistoryData" class="control-label " style="padding:0 5px; margin-left:300px;">历史发送数据：</label>
                        </div>
                        <div id="datatable" class="table table-striped table-bordered table-hover table-krt">
                            <div id="TextArea">
                                <textarea name="AnalogueData" id="AnalogueData" cols="50" rows="23"></textarea>
                            </div>
                            <div id="TextData">
                                <table id="HistoryData" class="table table-striped table-bordered table-hover table-krt">
                                    <thead>
                                        <tr>
                                            <th>命令</th>
                                            <th>状态</th>
                                            <th>时间</th>
                                        </tr>
                                    </thead>
                                    <tbody id="HistoryDataColumns">
                                        <#list analogues as analogue>
                                        <tr>
                                            <td>${analogue.command}</td>
                                            <#if analogue.status == "1"><td><span class='badge bg-green'>发送成功</span></td></#if>
                                            <#if analogue.status == "2"><td><span class='badge bg-blue'>解析成功</span></td></#if>
                                            <#if analogue.status == "3"><td><span class='badge bg-yellow'>解析失败</span></td></#if>
                                            <#if analogue.status == "4"><td><span class='badge bg-red'>格式错误</span></td></#if>
                                            <td>${analogue.time}</td>
                                        </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                            <div id="clear"></div>
                        </div>

                        <div class="table-button">
                            <button title="提交" type="button" id="submitBtn" data-placement="left" data-toggle="tooltip"
                                    class="btn btn-success btn-sm">
                                <i class="glyphicon glyphicon-ok"></i> 提交
                            </button>
                            <button class="btn btn-sm btn-danger" id="deleteBatchBtn">
                                <i class="fa fa-trash fa-btn"></i> 清空
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
<script type="text/javascript">

    $("#deleteBatchBtn").click(function () {  //清空文本域
        $("#AnalogueData").val(" ");
        top.layer.msg("已清除");
    });

    $("#submitBtn").click(function () {
        var data = $("#AnalogueData").val(); //获取模拟设备发送的数据
        //data = JSON.stringify(data);  //将字符串转换成json字符串

        $.ajax({
            url: "${basePath}/analogueDevice/AnalogueData",
            type: "get",
            data: {"data": data},
            dataType: "json",
            success: function(res){
                if (res.status == "1"){
                    top.layer.msg("发送成功");

                } else if (res.status == "2"){
                    top.layer.msg("解析成功");

                } else if (res.status == "3"){
                    top.layer.msg("解析失败");

                }else{
                    top.layer.msg("格式错误");
                }
               location.href = "${basePath}/analogueEquipment/list";
            },
            error: function () {
                top.layer.msg("程序错误！");
            }
        });
    });

</script>
</@footer>