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
                            <label for="name" class="control-label ">品牌名:</label>
                            <input type="text" id="name" name="name" placeholder="品牌名" class="form-control">
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
            <!-- 列表数据区 -->
            <div class="box" style="margin-top:8px;">
                <!-- 工具按钮区 -->
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
                aaSorting: [[4,"asc"]],
                columnDefs: [{
                    orderable:false,//禁用排序
                    targets:[0] //指定的列
                }],
                ajax: {
                    url: "${basePath}/device/device/insertBrand",
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
                        title: '选择', data: null, class: "td-center", width: "40", orderable: false,
                        render: function (data, type, row) {
                            return '<input type="radio" name="brand" class="icheck check" id="'+ row.id +'" value="'+row.name+'">';
                        }
                    },
                    {title: "分类", data: "categoryName"},
                    {title: "品牌", data: "name"},
                    {title: "优先权", data: "priority"}
                ]
            });

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });

        });
    </script>
</@footer>
