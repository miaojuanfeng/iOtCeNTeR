<#include "/common/layoutList.ftl">
<@header></@header>
<@body>
    <div class="wrapper">
        <section class="content">
            <!-- 搜索条件区 -->
            <div class="row row-search">
                <div class="col-xs-12">
                    <form class="form-inline" action="">
                        <div class="form-group">
                            <label class="control-label ">码库名称:</label>
                            <input type="text" name="remoteMap" placeholder="码库名称" class="form-control">
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <button type="button" id="searchBtn" class="btn btn-primary btn-sm">
                                    <i class="fa fa-search fa-btn"></i>搜索
                                </button>
                            </div>
                        </div>
                        <input type="hidden" id="brandName" name="brandName" value="${brandName!}"/>
                    </form>
                </div>
            </div>
            <!-- 列表数据区 -->
            <div class="box" style="margin-top:8px;">
                <table id="datatable" class="table table-bordered table-hover"></table>
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
            aaSorting: [[4, "asc"]], // 设置排序方式
            columnDefs: [{
                orderable:false,//禁用排序
                targets:[0] //指定的列
            }],
            ajax: {
                url: "${basePath}/device/device/insertCodeBank",
                type: "post",
                data: function (d) {
                    d.brandName = $("#brandName").val();
                    d.remoteMap = $("#remoteMap").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {
                    title: '选择', data: null, class: "td-center", width: "40", orderable: false,
                    render: function (data, type, row) {
                        return '<input type="radio" name="remote" class="icheck check" id="'+ row.remote +'" value="'+row.remoteMap+'">';
                    }
                },
                {title: "品牌", data: "brandName"},
                {title: "协议", data: "protocol"},
                {title: "码库", data: "remoteMap"},
                {title: "优先级", data: "priority"}
            ]
        });

        //搜索
        $("#searchBtn").on('click', function () {
            datatable.ajax.reload();
        });

    });
</script>
</@footer>
