/**
 * dataTable全局默认配置
 */
$.extend( $.fn.dataTable.defaults, {
    "dom": 'rt<"dataTables_page"<"col-sm-6 col-xs-12"il><"col-sm-6 col-xs-12"p>>',
    "lengthChange": true,//选择lenth
    "autoWidth": false,//自动宽度
    "searching": false,//搜索
    "processing": false,//loding
    "serverSide": true,//服务器模式
    "ordering": false,//排序
    "aLengthMenu": [ 10, 25, 50, 100 ], //可以切换的每页显示条数
    "pageLength": 10,//初始化lenth
    "deferRender": true,//延迟加载
    "oLanguage": {
        "sProcessing":   "处理中...",
        "sLengthMenu":   "每页显示 _MENU_ 条结果",
        "sZeroRecords":  "没有匹配结果",
        "sInfo":         "显示第 _START_ 至 _END_ 条结果，共 _TOTAL_ 条,",
        "sInfoEmpty":    "显示第 0 至 0 结果,共 0 条,",
        "sInfoFiltered": "",
        "sInfoPostFix":  "",
        "sSearch":       "搜索:",
        "sUrl":          "",
        "sEmptyTable":     "表中数据为空",
        "sLoadingRecords": "加载中...",
        "sInfoThousands":  ",",
        "oPaginate": {
            "sFirst":    "首页",
            "sPrevious": "上一页",
            "sNext":     "下一页",
            "sLast":     "末页"
        },
        "oAria": {
            "sSortAscending":  ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
        }
    },
    "fnDrawCallback": function () {
        if($("#checkAll").length > 0) {
            checkAll();//复选框渲染
        }
    }
} );

/**
 * 选择页面多选
 */
function cCheck(){
    $(".iCheck").unbind();
    $('.iCheck').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });

    $("#checkAll").on('ifChecked', function (event) {
        $(".cCheck").iCheck('check');
    }).on('ifUnchecked', function (event) {
        $(".cCheck").iCheck('uncheck');
    });

    var names = "";
    var ids = "";
    $('.cCheck').on('ifChecked', function (event) {
        names = $("#names").val();
        ids = $("#ids").val();
        if (names != '') {
            names = $("#names").val() + "," + $(this).attr("rname");
            ids = $("#ids").val() + "," + $(this).attr("rid");
            $("#names").val(names);
            $("#ids").val(ids);
        } else {
            names = $(this).attr("rname");
            ids = $(this).attr("rid");
            $("#names").val(names);
            $("#ids").val(ids);
        }

    });
    $('.cCheck').on('ifUnchecked', function (event) {
        names = "," + $("#name").val() + ",";
        ids = "," + $("#id").val() + ",";
        var name = "," + $(this).attr("rname") + ",";
        var id = "," + $(this).attr("rid") + ",";
        if (names.indexOf(name) > -1) {
            names = names.replace(name, ",");
            ids = ids.replace(id, ",");
        }
        if (names != ",") {
            $("#name").val(names.substring(1, names.length - 1));
            $("#names").val(ids.substring(1, ids.length - 1));
        } else {
            $("#names").val("");
            $("#ids").val("");
        }
    });
}

/**
 * 单选
 */
function rCheck() {
    //单选
    $('.iCheck').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });

    $('.rCheck').on('ifChecked', function (event) {
        $("#id").val($(this).attr("rid"));
        $("#name").val($(this).attr("rname"));
    });
}

/**
 * dataTable全选
 */
function checkAll() {
    $("#checkAll").iCheck('uncheck');
    $(".iCheck").unbind();
    $('.iCheck').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });
    $("#checkAll").on('ifChecked', function (event) {
        $(".check").iCheck('check');
    }).on('ifUnchecked', function (event) {
        $(".check").iCheck('uncheck');
    });
}

/**
 * 获取复选的ids
 * @returns {string}
 */
function getIds(){
    var ids= '';
    $(".check").each(function () {
        if ($(this).prop("checked")) {
            ids = ids + ($(this).val()) + ","
        }
    });
    return ids;
}

/**
 * 获取点击的属性
 */
function getCheckAttrs(){
    $(".check").each(function () {
        if ($(this).prop("checked")) {
            ids = ids + ($(this).val()) + ","
        }
    });
}
