<#include "/common/layoutList.ftl">
<@header></@header>
<@body class="body-bg-default">
<div class="wrapper">
    <section class="content">
        <!-- 搜索条件区 -->
        <div class="box-search">
            <div class="row row-search">
                <div class="col-xs-12">
                    <form class="form-inline" action="">
                        <div class="form-group">
                            <label for="categoryName" class="control-label ">类别名称:</label>
                            <select name="categoryName" class="form-control" id="categoryName">
                                <option value="">===请选择===</option>
                                <#list categories as category >
                                    <option value="${category.name}">${category.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="brandName" class="control-label ">品牌名称:</label>
                            <input type="text" id="brandName" name="brandName" placeholder="品牌名称" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="cityName" class="control-label ">城市名称:</label>
                            <input type="text" id="cityName" name="cityName" placeholder="城市名称" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="operatorName" class="control-label ">服务商名称:</label>
                        </div>
                        <div class="form-group">
                            <label for="status" class="control-label ">状态:</label>
                            <input type="text" id="status" name="status" placeholder="状态" class="form-control">
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <button type="button" id="searchBtn" class="btn btn-primary btn-sm">
                                    <i class="fa fa-search fa-btn"></i>搜索
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- 列表数据区 -->
        <div class="box">
            <div class="box-body">
                <table id="datatable" class="table table-bordered table-hover"></table>
            </div>
        </div>
    </section>
</div>
</@body>
<@footer>
<script type="text/javascript">
    var datatable;
    $(function () {
        //初始化datatable
        datatable = $('#datatable').DataTable({
            aaSorting: [[0,"asc"],[1,"asc"],[2,"asc"]],//设置排序方式
            ajax: {
                url: "${basePath}/ir/remoteIndex/list",
                type: "post",
                data: function (d) {
                    d.categoryName = $("#categoryName").val();
                    d.brandName = $("#brandName").val();
                    d.cityName = $("#cityName").val();
                    d.operatorName = $("#operatorName").val();
                    d.status = $("#status").val();
                    d.updateTime = $("#updateTime").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {title: 'id', data: "id", visible: false},
                {title: 'categoryId', data: "categoryId", visible: false},
                {title: 'brandId', data: "brandId", visible: false},
                {
                    title: "#", data: null,
                    className: 'text-center whiteSpace', orderable: false,
                    render: function(data,type,row,meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {title: "类别名称", data: "categoryName"},
                {
                    title: "品牌名称", data: "brandName",
                    render: function (brandName) {
                        if (brandName == "" || brandName == null) {
                            return "暂无信息";
                        } else {
                            return brandName
                        }
                    }
                },
                {
                    title: "城市名称", data: "cityName",
                    render: function (cityName) {
                        if (cityName == "" || cityName == null) {
                            return "暂无信息";
                        } else {
                            return cityName
                        }
                    }
                },
                {
                    title: "服务商名称", data: "operatorName",
                    render: function (operatorName) {
                        if (operatorName == "" || operatorName == null) {
                            return "暂无信息";
                        } else {
                            return operatorName
                        }
                    }
                },
                {title: "状态", data: "status"},
                {title: "最后更新时间", data: "updateTime"},
                {
                    title: "操作", data: "id", orderable: false,
                    "render": function (data, type, row) {
                        return ' <@shiro.hasPermission name="RemoteIndex:remoteIndex:look">'
                            + '<button class="btn btn-xs btn-info seeBtn" rid="' + row.id + '">'
                            + '<i class="fa fa-eye fa-btn"></i>查看'
                            + '</button>'
                            + '</@shiro.hasPermission>';
                    }
                }
            ]
        });

        //搜索
        $("#searchBtn").on('click', function () {
            datatable.ajax.reload();
        });

        //查看
        $(document).on("click", ".seeBtn", function () {
            var id = $(this).attr("rid");
            top.krt.layer.openDialogView("查看遥控指示", "${basePath}/ir/remoteIndex/look?id=" + id, "1000px", "500px");
        });

    });
</script>
</@footer>
