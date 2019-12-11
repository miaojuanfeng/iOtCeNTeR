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
                                            类别名：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" value="${category.name!}"
                                                   class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            状态：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="status" name="status" value="${category.status!}"
                                                   class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            更新时间：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="updateTime" id="updateTime"
                                                   value="${(category.updateTime?string("yyyy-MM-dd HH:mm:ss"))!}"
                                                   readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            类别名_英文：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="nameEn" name="nameEn" value="${category.nameEn!}"
                                                   class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            类别名_繁体：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="nameTw" name="nameTw" value="${category.nameTw!}"
                                                   class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            贡献者：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="contributor" name="contributor"
                                                   value="${category.contributor!}" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 隐藏域 -->
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>

</@footer>

