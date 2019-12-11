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
                                            主题前缀：
                                        </label>
                                        <div class="col-sm-8">
                                            <input class="form-control" id="themeFirstPart" readonly value="/sys/{productId}/{deviceId}/">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            主题后缀:
                                        </label>
                                        <div class="col-sm-8">
                                            <input class="form-control" id="themeSecondPart">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            设备：
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control select2" style="width: 100%" id="productId" name="productId"
                                                    onchange="setTheme(this)">
                                                <option value="">==请选择产品==</option>
                                                <#list productList as product>
                                                    <option value="${product.id!}" min="${product.productId!}" >${product
                                                        .name!}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            操作权限：
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control select2" name="operationAuthority">
                                                <option value="1">发布</option>
                                                <option value="2">订阅</option>
                                                <option value="3">发布和订阅</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="theme" id="theme">
                        <input type="hidden" name="state" value="1">
                        <input type="hidden" name="productName" id="productName">
                    </form>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        var code = 500;

        function setTheme(a) {
            var productName = $(a).find("option:selected").text();
            $('#productName').val(productName);

            var productId = $(a).find("option:selected").attr("min");
            if (productId == undefined) {
                $('#themeFirstPart').val("/sys/{productId}/{deviceId}/");
            } else {
                $('#themeFirstPart').val("/sys/" + productId + "/{deviceId}/");
            }
        }

        //主题校验
        function themeCheck(theme) {
            krt.ajax({
                type: "get",
                url: "${basePath}/theme/theme/check",
                data: {"theme": theme},
                async: false,
                success: function (rb) {
                    if (rb.code === 200) {
                        code = 200;
                    } else {
                        code = 500;
                    }
                }
            });
        }

        //提交
        function doSubmit() {
            if ($('#productId').val() == "") {
                krt.layer.msg("请选择品牌");
                return false;
            }

            var theme = $('#themeFirstPart').val() + $('#themeSecondPart').val();
            themeCheck(theme);
            if (code == 200) {
                $('#theme').val(theme);
            } else {
                krt.layer.msg("主题已存在");
                return false;
            }

            krt.ajax({
                type: "POST",
                url: "${basePath}/theme/theme/insert",
                data: $('#krtForm').serialize(),
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

