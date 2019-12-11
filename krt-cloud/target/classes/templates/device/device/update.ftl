<#include "/common/layoutForm.ftl">
<@header>

</@header>
<@body>
    <div class="wrapper">
        <div class="col-md-12">
            <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                <div class="box-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="name" class="control-label col-sm-4">
                                    <span class="form-required">*</span>网关名称
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" name="name" id="name" class="form-control" value="${device.name}">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="productId" class="control-label col-sm-4">
                                    <span class="form-required">*</span>网关状态
                                </label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="state" readonly>
                                        <option value="0" ${(device.state==0)?string('selected','')}>启用</option>
                                        <option value="1" ${(device.state==1)?string('selected','')}>停用</option>
                                        <option value="2" ${(device.state==2)?string('selected','')}>在线</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="deviceCode" class="control-label col-sm-2">
                                    <span class="form-required">*</span>网关地址
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" name="deviceAddress" class="form-control" value="${(device.deviceAddress)!}" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 隐藏域 -->
                <input type="hidden" name="id" value="${device.id}">
        </div>
        </form>
    </div>
    </div><!-- ./wrapper -->
</@body>
<@footer>
    <script type="text/javascript">
        var validateForm;

        function doSubmit() {//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            $.ajax({
                type: "POST",
                url: "${basePath}/device/device/update",
                data: $('#krtForm').serialize(),// 要提交的表单
                beforeSend: function () {
                    return validateForm.form() && krt.layer.loading();
                },
                success: function (rb) {
                    krt.layer.closeloading();
                    if (rb.code == 200) {
                        top.krt.layer.msg(rb.msg);
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        krt.table.reloadTable();
                        krt.layer.close(index);

                    } else {
                        top.krt.layer.msg(rb.msg);
                    }
                },
                error: function () {
                    krt.layer.closeloading();
                }
            });
        }

        $(function () {
            validateForm = $("#krtForm").validate({
                ignore: "",
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-group")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });



    </script>
</@footer>