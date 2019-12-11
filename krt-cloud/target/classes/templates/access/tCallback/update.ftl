<#include "/common/layoutForm.ftl">
<@header></@header>
<@body >
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form role="form" class="form-horizontal krt-form" id="krtForm">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        应用名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control select2" style="width: 100%" id="appId" name="appId">
                                            <#list appList as item >
                                                <option value="${item.id}" ${((tCallback.appId==item.code)?string("selected",""))!}>${item.name}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        回调类型：
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control select2" id="type" name="type">
                                            <option value="1" ${tCallback.type?contains("1")?string("checked", "")}>设备数据回调</option>
                                            <option value="2" ${tCallback.type?contains("2")?string("checked", "")}>设备状态回调</option>
                                            <option value="3" ${tCallback.type?contains("3")?string("checked", "")}>设备终止回调</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-2">
                                        回调URL：
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" id="url" name="url" value="${tCallback.url!}" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" id="id" value="${tCallback.id!}">
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</@body>
<@footer>
<script type="text/javascript">
    var validateForm;
    $(function () {
        //验证表单
        validateForm = $("#krtForm").validate({});

    });

    //提交
    function doSubmit() {
        krt.ajax({
            type: "POST",
            url: "${basePath}/access/tCallback/update",
            data: $('#krtForm').serialize(),
            validateForm: validateForm,
            success: function (rb) {
                krt.layer.msg(rb.msg);
                if (rb.code === 200) {
                    var index = krt.layer.getFrameIndex(); //获取窗口索引
                    krt.table.reloadTable();
                    krt.layer.close(index);
                }
            }
        });
    }
</script>
</@footer>

