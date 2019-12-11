<#include "/common/layoutList.ftl">
<@header>

</@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <!-- Main content -->
        <section class="content">
            <!-- 搜索条件区 -->
            <div class="box-search">
                <div class="row row-search">
                    <div class="col-xs-12">
                        <form class="form-inline" action="">
                            <div class="form-group" style="margin:5px">
                                <label for="productId" class="control-label" style="padding:0 5px">产品编号：</label>
                                <input type="text" class="form-control" placeholder="准确查询" id="productId">
                            </div>
                            <div class="form-group" style="margin:5px">
                                <label for="productName" class="control-label" style="padding:0 5px">产品名称：</label>
                                <input type="text" class="form-control" placeholder="模糊搜索" id="productName">
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
                    <div class="table-toolbar" id="table-toolbar">
                        <@shiro.hasPermission name="product_data:testProduct:insert">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip" class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="product_data:testProduct:delete">
                            <button class="btn btn-sm btn-danger" id="deleteBatchBtn">
                                <i class="fa fa-trash fa-btn"></i>批量删除
                            </button>
                        </@shiro.hasPermission>
                    </div>
                    <#--列表区-->
                    <table id="datatable" class="table table-bordered table-hover"></table>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
<script type="text/javascript">
        var datatable;

        function initDatatable() {
            datatable = $('#datatable').DataTable({
                aaSorting: [7, "desc"], // 默认排序[行数, 规则]
                aoColumnDefs: [ { "bSortable": false, "aTargets": [2] }] ,// 设置不可排序列
                ajax: {
                    url: "${basePath}/product/list",
                    type: "post",
                    data: function (d) {
                        d.id = $("#productId").val();
                        d.name = $("#productName").val();
                        d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                        d.orderType = d.order[0].dir;
                    }
                },
                columns: [
                    {title: 'id', data: "id", visible: false},
                    {
                        title: '<input type="checkbox" id="checkAll" class="icheck">',
                        data: "id", class: "td-center", width: "40", orderable: false,
                        render: function (data) {
                            return '<input type="checkbox" class="icheck check" value="' + data + '">';
                        }
                    },
                    {
                        title: "#", data: null,
                        className: 'text-center whiteSpace',
                        render: function(data,type,row,meta) {
                            return meta.row + 1 + meta.settings._iDisplayStart;
                        }
                    },
                    {title: "产品名称", data: "name"},
                    {title: "产品编号", data: "productId"},
                    {title: "产品描述", data: "detail"},
                    {title: "修改时间", data: "updateTime"},
                    {title: "添加时间", data: "insertTime"},
                    {
                        title: "操作", orderable: false,
                        render: function (data, type, row) {
                            return '<@shiro.hasPermission  name="product_data:testProduct:check">'
                                + '<button class="btn btn-xs btn-info checkBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-eye fa-btn"></i>查看'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                +'<@shiro.hasPermission  name="product_data:testProduct:update">'
                                + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-edit fa-btn"></i>修改'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="product_data:testProduct:delete">'
                                + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-trash fa-btn"></i>删除'
                                + '</button>'
                                + '</@shiro.hasPermission>';
                        }
                    }
                ]
            });
        }

        $(function () {

            //初始化datatable
            initDatatable();

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });

            //新增
            $("#insertBtn").click(function () {
                top.krt.layer.openDialog("新增产品", "${basePath}/product/insert", "800px", "350px");
            });

            //查看
            $(document).on("click", ".checkBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialogView("查看产品", "${basePath}/product/see?id=" + id, "800px", "350px", false);
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("修改产品", "${basePath}/product/update?id=" + id, "800px", "350px", false);
            });

            //删除
            $(document).on("click", ".deleteBtn", function () {
                var id = $(this).attr("rid");
                krt.layer.confirm("你确定删除吗？", function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/product/delete",
                        data: {"id": id},
                        success: function (rb) {
                            top.layer.msg(rb.msg);
                            if (rb.code == 200) {
                                krt.table.reloadTable();
                            }
                        }
                    });
                });
            });

            //批量删除
            $("#deleteBatchBtn").click(function () {
                var ids = getIds();
                if (ids == "") {
                    top.layer.msg("请选择要删除的数据!");
                    return false;
                } else {
                    krt.layer.confirm("你确定删除吗？", function () {
                        krt.ajax({
                            type: "POST",
                            url: "${basePath}/product/deleteByIds",
                            data: {"ids": ids},
                            success: function (rb) {
                                krt.layer.msg(rb.msg);
                                if (rb.code == 200) {
                                    krt.table.reloadTable(ids);
                                }
                            }
                        });
                    });
                }
            });
        });
    </script>
</@footer>