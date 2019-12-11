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
                            <label for="name" class="control-label ">类别名:</label>
                            <input type="text" id="name" name="name" placeholder="类别名" class="form-control">
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
                <!-- 工具按钮区 -->

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
            aaSorting:[[0,"asc"]],
            columnDefs:[{
                orderable:false,//禁用排序
                targets:[1,8] //指定的列
            }],
            ajax: {
                url: "${basePath}/ir/category/list",
                type: "post",
                data: function (d) {
                    d.name = $("#name").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {data:"id","visible": false},
                {
                    title: "", data: "index",
                    className: 'text-center whiteSpace',
                    render: function (data, type, row, meta) {
                        var startIndex = meta.settings._iDisplayStart;
                        return startIndex + meta.row + 1;
                    }
                },
                {title: "类别名", data: "name"},
                {title: "状态", data: "status"},
                {title: "类别名_英文", data: "nameEn"},
                {title: "类别名_繁体", data: "nameTw"},
                {title: "投稿人", data: "contributor"},
                {title: "更新时间", data: "updateTime"},
                {
                    title: "操作", data: "id", orderable: false,
                    "render": function (data, type, row) {
                        return ' <@shiro.hasPermission name="ir:category:see">'
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
            top.krt.layer.openDialogView("查看类别表", "${basePath}/ir/category/see?id=" + id, "1000px", "500px");
        });


    });
</script>
</@footer>
