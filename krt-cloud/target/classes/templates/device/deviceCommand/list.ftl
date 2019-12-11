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
                                <label for="deviceName" class="control-label " style="padding:0 5px">网关名称</label>
                                <input type="text" id="deviceName" name="deviceName" class="form-control">
                            </div>
                            <div class="form-group" style="margin:5px">
                                <label for="deviceId" class="control-label " style="padding:0 5px">网关编号</label>
                                <input type="text" id="deviceId" name="deviceId" class="form-control">
                            </div>
                            <div class="form-group" style="margin:5px">
                                <label for="beginTime" class="control-label " style="padding:0 5px">开始时间</label>
                                <input type="date" id="beginTime" name="beginTime" class="form-control">
                                <label for="endTime" class="control-label " style="padding:0 5px">结束时间</label>
                                <input type="date" id="endTime" name="endTime" class="form-control">
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

    function initDatatable() {
        datatable = $('#datatable').DataTable({
            destroy: true,//销毁
            scrollX: true,
            autoWidth: true,
            aaSorting: [3, "desc"], // 默认排序[行数, 规则]
            aoColumnDefs: [ { "bSortable": false, "aTargets": [0] }] ,// 设置不可排序列
            ajax: {
                "url": "${basePath}/device/deviceCommand/list",
                "type": "post",
                "data": function (d) {
                    d.deviceName = $("#deviceName").val();
                    d.deviceId = $("#deviceId").val();
                    d.beginTime = $("#beginTime").val();
                    d.endTime = $("#endTime").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {
                    title: "#", data: null,
                    className: 'text-center whiteSpace',
                    render: function(data,type,row,meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {title: "网关名称", data: "deviceName"},
                {title: "网关编号", data: "deviceId"},
                {title: "时间", data: "insertTime"},
                {title: "主题", data: "topicName"},
                {title: "内容", data: "topicContent"},
                {title: "状态", data: "status"}
            ]
        });
    }

    // 搜索
    $("#searchBtn").on('click', function () {
        datatable.ajax.reload();
    });

    $(function () {
        //初始化datatable
        initDatatable();
    });

</script>
</@footer>
