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
                                            <input type="text" name="name" class="form-control" value="${product.name!}" required>
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
                                            <input type="text" name="detail" class="form-control" value="${product.detail!}" required>
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
                                            <input type="radio" name="ssl" class="icheck" required value="1" <#if (product.ssl==true)!false
                                            >checked</#if> >是
                                            <input type="radio" name="ssl" class="icheck" required value="0"
                                                   <#if (product.ssl==false)!false >checked</#if> >否
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="id" value="${product.id!}">
                    </form>
                </div>
            </div>
        </section>
    </div>

</@body>
<@footer>
    <script type="text/javascript">
        var validateForm;

        //提交表单
        function doSubmit() {//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            $.ajax({
                type: "POST",
                url: "${basePath}/product/update",
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
            //表单验证
            validateForm = $("#krtForm").validate({
                rules: {
                    clientId: {
                        remote: {
                            url: "${basePath}/product/checkProductName",
                            type: "post",
                            dataType: "json",
                            data: {
                                clientId: function () {
                                    return $("#name").val();
                                }
                            }
                        }
                    }
                },
                messages: {
                    username: {remote: "产品名已存在"}
                }
            });
        });

    </script>
</@footer>
