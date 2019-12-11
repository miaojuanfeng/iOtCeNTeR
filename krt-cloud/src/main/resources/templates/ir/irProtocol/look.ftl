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
                                        协议名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="name" name="name" value="${irProtocol.name!}" readonly
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        状态：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="status" name="status" value="${irProtocol.status!}"
                                               readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        类型：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="type" name="type" value="${irProtocol.type!}" readonly
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        启动代码：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="bootCode" name="bootCode" value="${irProtocol.bootCode!}"
                                               readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        投稿人：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="contributor" name="contributor"
                                               value="${irProtocol.contributor!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        最后修改时间：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="updateTime" name="updateTime"
                                               value="${irProtocol.updateTime!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" id="id" value="${irProtocol.id!}">
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</@body>


