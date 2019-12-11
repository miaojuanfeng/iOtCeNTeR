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
                                        类别名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="categoryName" name="categoryName"
                                               value="${remoteIndex.categoryName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        品牌名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="brandName" name="brandName"
                                               value="${remoteIndex.brandName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        城市名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="categoryName" name="categoryName"
                                               value="${remoteIndex.cityName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        运营商名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="brandName" name="brandName"
                                               value="${remoteIndex.operatorName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        协议名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="categoryName" name="categoryName"
                                               value="${remoteIndex.protocol!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        远程地图：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="brandName" name="brandName"
                                               value="${remoteIndex.remoteMap!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        状态：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="categoryName" name="categoryName"
                                               value="${remoteIndex.status!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        优先级：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="brandName" name="brandName"
                                               value="${remoteIndex.priority!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        运营商名称繁体：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="categoryName" name="categoryName"
                                               value="${remoteIndex.operatorNameTw!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        类别名称繁体：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="brandName" name="brandName"
                                               value="${remoteIndex.categoryNameTw!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        品牌名称繁体：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cityName" name="cityName"
                                               value="${remoteIndex.brandNameTw!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        城市名称繁体：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cityName" name="cityName"
                                               value="${remoteIndex.cityNameTw!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        最后修改时间：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="status" name="status" value="${remoteIndex.updateTime!}"
                                               readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <!-- 隐藏域 -->
                            <input type="hidden" name="id" id="id" value="${remoteIndex.id!}">
                        </div>
                </form>
            </div>
        </div>
    </section>
</div>
</@body>


