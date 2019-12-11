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
                                        应用ID：
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control select2" style="width: 100%" id="appId" name="appId">
                                            <option value="">===请选择===</option>
                                            <#list appList as item >
                                                <option value="${item.id}">${item.name}</option>
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
                                            <option value="1">设备数据回调</option>
                                            <option value="2">设备状态回调</option>
                                            <option value="3">设备终止回调</option>
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
                                        <input type="text" id="url" name="url" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <!-- 隐藏域 -->
                        </div>
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
            url: "${basePath}/access/tCallback/insert",
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

