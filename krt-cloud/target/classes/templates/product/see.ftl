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
                                            <input type="text" name="name" class="form-control" value="${product.name!}" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="name" class="control-label col-sm-2">
                                            <span class="form-required">*</span>产品编号
                                        </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" value="${product.productId!}" readonly>
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
                                            <input type="text" name="detail" class="form-control" value="${product.detail!}" readonly>
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
                    </form>
                </div>
            </div>
        </section>
    </div><!-- ./wrapper -->
</@body>
<@footer>
</@footer>