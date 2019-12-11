<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>旅游集散中心及景区设备融合管理后台</title>
    <link rel="shortcut icon" href="${basePath}/dist/img/favicon.ico">
    <link rel="stylesheet" href="${basePath}/plugin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}/plugin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basePath}/plugin/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${basePath}/plugin/jigsaw/jigsaw.css">
    <link rel="stylesheet" href="${basePath}/dist/css/krt.css">
    <link rel="stylesheet" href="${basePath}/cloud/skin/css/base_style.css"/>
    <link rel="stylesheet" href="${basePath}/cloud/skin/css/login.css"/>
    <style type="text/css">
        #loginBtn{
            width:70%;
            margin-left:50px;
        }
        #form_lay_div3 label{
            float:left; margin:10px 0 10px 30px;
        }
        #form_lay_div3 input{
            float:left; width:100px; margin:6px 10px;
        }
        #form_lay_div3 img{
            float:left; width:100px; height:40px;
        }
    </style>
    <!--[if lt IE 9]>
    <script language="javascript" type="text/javascript">
        top.location.href='${basePath}/html/browser.html';
    </script>
    <![endif]-->
    <script type="text/javascript">
        if (self.location != top.location) {
            top.location.href = self.location.href;
        }
    </script>
</head>

<body>
<div class="login_titbg1">
    <div class="login_titbg2">
        <div class="content_layout">
            <a href="javascript:void(0)">
                <h1 class="fyh tit_text">旅游集散中心及景区设备融合管理后台</h1>
            </a>
            <!--em class="tit_em">KERUITE&nbsp;IOT&nbsp;YUNPINGTAI&nbsp;&nbsp;V1.0</em-->
            <em class="tit_em">V1.0</em>
            <div class="fyh time_layout">
                <div class="welcome">欢迎您！&nbsp;请登录旅游集散中心及景区设备融合管理后台</div>
                <div class="time">今天是：<span id="time"></span></div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<div class="form_layout">
    <div class="form_lay">
        <div class="form_tit">
            <img src="${basePath}/cloud/skin/images/form_icon_03.png" class="dq"/>
            <span class="form_tittext fyh">用户登录&nbsp;&nbsp;LOGIN</span>
        </div>
        <div class="hr-20"></div>
        <div class="text_layout">
            <label class="text_lab fyh right_4" for="username">用户名：</label>
            <input type="text" class="form_text fyh" id="username" name="username"/>
            <div class="ts_text fyh">输入您的用户名</div>
        </div>
        <div class="text_layout">
            <label class="text_lab fyh right_6" for="password">密&nbsp;&nbsp;&nbsp;码：</label>
            <input type="password" class="form_text fyh" name="password" id="password"/>
            <div class="ts_text fyh">输入您的密码</div>
        </div>
        <div class="text_layout" id="form_lay_div3">
            <label class="text_lab fyh right_4" for="verifyCode">验证码：</label>
            <input type="text" class="form_text1 fyh" id="verifyCode" name="verifyCode" />
            <img alt="验证码" id="verifyCodeUrl" src="${basePath}/captcha.jpg" onclick="changeImg();">
        </div>
        <div class="hr-30"></div>
        <button type="submit" id="loginBtn" class="btn btn-primary btn-block btn-flat">登&nbsp;&nbsp;&nbsp;录</button>
    </div>
    <div class="clear"></div>
</div>
<div class="floor fyh">软件开发：&nbsp;赣州科睿特软件技术有限公司(技术支持)&nbsp;&nbsp;&nbsp;&nbsp;客服电话：&nbsp;0797-8356742</div>

<script src="${basePath}/plugin/jquery/jquery-2.1.4.min.js"></script>
<script src="${basePath}/plugin/layer/layer.js"></script>
<script src="${basePath}/dist/js/krt.js"></script>
<script src="${basePath}/plugin/jigsaw/jigsaw.js"></script>
<script src="${basePath}/cloud/skin/js/login.js"></script>

<script type="text/javascript">

    $("#loginBtn").click(function () {
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();
        var verifyCode = $("#verifyCode").val().trim();
        if (username == '') {
            krt.layer.msg("用户账号不可为空");
            return false;
        }
        if (password == '') {
            krt.layer.msg("密码不可为空");
            return false;
        }
        if (verifyCode == '') {
            krt.layer.msg("验证码不可为空");
            return false;
        }
        krt.ajax({
            url: "${basePath}/login",
            type: "POST",
            data: { // 要提交的表单
                "username": username,
                "password": password,
                "ticket": verifyCode
            },
            beforeSend: function () {
                krt.layer.loading();
            },
            success: function (rb) {
                krt.layer.closeloading();
                if (rb.code == 200) {
                    location.href = "${basePath}/index";
                } else {
                    krt.layer.msg(rb.msg);
                    changeImg();
                }
            },
            error: function () {
                krt.layer.msg('程序错误!');
            }
        });
    });

    //刷新验证码
    function changeImg() {
        var imgSrc = $("#verifyCodeUrl");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        var urls = url.split("?");
        url = urls[0] + "?timestamp=" + timestamp;
        return url;
    }
</script>
</body>
</html>