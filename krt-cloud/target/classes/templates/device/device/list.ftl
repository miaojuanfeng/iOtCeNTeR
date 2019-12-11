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
                                <label for="name" class="control-label " style="padding:0 5px">网关名称</label>
                                <input type="text" id="name" name="name" class="form-control">
                            </div>
                            <div class="form-group" style="margin:5px">
                                <label for="deviceId" class="control-label " style="padding:0 5px">网关编号</label>
                                <input type="text" id="deviceId" name="deviceId" class="form-control">
                            </div>
                            <div class="form-group" style="margin:5px">
                                <label for="productId" class="control-label " style="padding:0 5px">产品名称</label>
                                <select class="form-control" id="productId" name="productId" required>
                                    <option value="">==请选择==</option>
                                    <#list products as product>
                                        <option value="${product.id}">${product.name}</option>
                                    </#list>
                                </select>
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
                        <@shiro.hasPermission name="device:device:insert">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip" class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="device:device:delete">
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
            aaSorting: [8, "desc"], // 默认排序[行数, 规则]
            aoColumnDefs: [ { "bSortable": false, "aTargets": [2] }] ,// 设置不可排序列
            ajax: {
                url: "${basePath}/device/device/list",
                type: "post",
                data: function (d) {
                    d.name = $("#name").val();
                    d.deviceId = $("#deviceId").val();
                    d.productId = $("#productId").val();
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
                {title: "网关名称", data: "name"},
                {title: "网关编号", data: "deviceId"},
                {title: "网关地址", data: "deviceAddress"},
                {title: "产品名称", data: "productName"},
                {
                    title: "网关状态", data: "state",
                    render: function (data, type, row) {
                        <#--0离线 1停用 2在线-->
                        if (data == '0') {
                            return '<span class="badge bg-yellow">离线</span>';
                        }else if (data == '1') {
                            return '<span class="badge">停用</span>';
                        }else if (data == '2') {
                            return '<span class="badge bg-blue">在线</span>';
                        }
                    }
                },
                {title: "添加时间", data: "insertTime"},
                {
                    title: "操作", orderable: false,
                    render: function (data, type, row) {
                        var button = "";
                        return '<@shiro.hasPermission name="device:device:see">'
                                + '<button class="btn btn-xs btn-info seeBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-eye fa-btn"></i>查看'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="device:device:update">'
                                + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-edit fa-btn"></i>修改'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + button
                                + '<@shiro.hasPermission name="device:device:delete">'
                                + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-trash fa-btn"></i>删除'
                                + '</button>'
                                + '</@shiro.hasPermission>';
                    }
                }
            ]
        });
    };

    //搜索
    $("#searchBtn").on('click', function () {
        datatable.ajax.reload();
    });

    //新增
    $("#insertBtn").click(function () {
        top.krt.layer.openDialog("新增网关", "${basePath}/device/device/insert", "800px", "450px");
    });

    //修改
    $(document).on("click", ".updateBtn", function () {
        var id = $(this).attr("rid");
        top.krt.layer.openDialog("修改网关", "${basePath}/device/device/update?id="+id, "800px", "450px");
    });

    //查看
    $(document).on("click", ".seeBtn", function () {
        var id = $(this).attr("rid");
        top.krt.layer.openDialogView("查看网关", "${basePath}/device/device/see?id="+id, "800px", "450px");
    });

    //修改网关状态
    $(document).on("click", ".stateBtn", function () {
        var id = $(this).attr("rid");
        var state = $(this).attr("state");
        krt.ajax({
            type: "POST",
            url: "${basePath}/device/device/state",
            data: {"state":state,"id":id},
            success: function (rb) {
                top.layer.msg(rb.msg);
                if (rb.code == 200) {
                    krt.table.reloadTable();
                }
            }
        });
    });

    //删除
    $(document).on("click", ".deleteBtn", function () {
        var id = $(this).attr("rid");
        krt.layer.confirm("你确定删除吗？", function () {
            krt.ajax({
                type: "POST",
                url: "${basePath}/device/device/delete",
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
                    url: "${basePath}/device/device/deleteByIds",
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

    $(function () {
        //初始化datatable
        initDatatable();
    });
</script>
</@footer>