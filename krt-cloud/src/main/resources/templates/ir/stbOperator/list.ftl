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
                            <label for="operatorName" class="control-label ">运营商名称:</label>
                            <input type="text" id="operatorName" name="operatorName" placeholder="运营商名称"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="cityCode" class="control-label ">城市代号:</label>
                            <input type="text" id="cityCode" name="cityCode" placeholder="城市代号" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="cityName" class="control-label ">城市名称:</label>
                            <input type="text" id="cityName" name="cityName" placeholder="城市名称" class="form-control">
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
            aaSorting: [[0, "asc"]],//设置排序方式
            ajax: {
                url: "${basePath}/ir/stbOperator/list",
                type: "post",
                data: function (d) {
                    d.operatorName = $("#operatorName").val();
                    d.cityCode = $("#cityCode").val();
                    d.cityName = $("#cityName").val();
                    d.status = $("#status").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {title: 'id', data: "id", visible: false},
                {
                    title: "#", data: null,
                    className: 'text-center whiteSpace', orderable: false,
                    render: function(data,type,row,meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {title: "运营商名称", data: "operatorName"},
                {title: "城市代号", data: "cityCode"},
                {title: "城市名称", data: "cityName"},
                {title: "状态", data: "status"},
                {
                    title: "操作", data: "id", orderable: false,
                    "render": function (data, type, row) {
                        return ' <@shiro.hasPermission name="StbOperator:stbOperator:look">'
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
            top.krt.layer.openDialogView("查看机顶盒运营商", "${basePath}/ir/stbOperator/look?id=" + id, "1000px", "500px");
        });


    });
</script>
</@footer>
