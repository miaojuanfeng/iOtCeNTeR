<#include "/common/layoutForm.ftl">
<@header></@header>
<@body>
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="name" class="control-label col-sm-2">
                                        <span class="form-required">*</span>产品名称
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="detail" class="control-label col-sm-2">
                                        <span class="form-required">*</span>产品描述
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" name="detail" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="detail" class="control-label col-sm-2">
                                        <span class="form-required">*</span>是否开启ssl
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="radio" name="ssl" class="icheck" required value="1">是
                                        <input type="radio" name="ssl" class="icheck" required value="0">否
                                    </div>
                                </div>
                            </div>
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
            //表单验证
            validateForm = $("#krtForm").validate({
                rules: {
                    name: {
                        remote: {
                            url: "${basePath}/product/checkProductName",
                            type: "get",
                            dataType: "json",
                            data: {
                                name: function () {
                                    return $("#name").val();
                                }
                            }
                        }
                    }
                },
                messages: {
                    name: {remote: "产品名已存在"}
                }
            });

        });

        //提交表单
        function doSubmit() {
            krt.ajax({
                url: "${basePath}/product/insert",
                type: "post",
                data: $('#krtForm').serialize(),
                validateForm: validateForm,
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        krt.table.reloadTable();
                        krt.layer.close(index);
                    }
                },
                error: function (rb) {
                    krt.layer.msg("程序错误"+rb);
                }
            });
        }

    </script>
</@footer>