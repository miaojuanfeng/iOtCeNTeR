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
                            <label for="name" class="control-label ">名称:</label>
                            <input type="text" id="name" name="name" placeholder="名称" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="status" class="control-label ">状态:</label>
                            <input type="text" id="status" name="status" placeholder="状态" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="type" class="control-label ">类型:</label>
                            <input type="text" id="type" name="type" placeholder="类型" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="updateTime" class="control-label ">修改时间:</label>
                            <input type="text" id="updateTime" name="updateTime" placeholder="修改时间"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="contributor" class="control-label ">投稿人:</label>
                            <input type="text" id="contributor" name="contributor" placeholder="投稿人"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="bootCode" class="control-label ">启动代码:</label>
                            <input type="text" id="bootCode" name="bootCode" placeholder="启动代码" class="form-control">
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
                url: "${basePath}/ir/irProtocol/list",
                type: "post",
                aaSorting: [[1, "asc"]],
                data: function (d) {
                    d.name = $("#name").val();
                    d.status = $("#status").val();
                    d.type = $("#type").val();
                    d.updateTime = $("#updateTime").val();
                    d.contributor = $("#contributor").val();
                    d.bootCode = $("#bootCode").val();
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
                {title: "名称", data: "name"},
                {title: "状态", data: "status"},
                {title: "类型", data: "type"},
                {title: "投稿人", data: "contributor"},
                {title: "启动代码", data: "bootCode"},
                {title: "最后更新时间", data: "updateTime"},
                {
                    title: "操作", data: "id", orderable: false,
                    "render": function (data, type, row) {
                        return ' <@shiro.hasPermission name="IrProtocol:irProtocol:look">'
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
            top.krt.layer.openDialogView("修改红外协议", "${basePath}/ir/irProtocol/look?id=" + id, "1000px", "500px");
        });

    });
</script>
</@footer>
