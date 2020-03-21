<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/admin.css">
    <link rel="stylesheet" type="text/css" href="css/pintuer.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css">
    <title>Login</title>
</head>

<body>
<div class="bg"></div>
<div class="container">
    <span>测试2</span>
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:80px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="/login" method="post" class="login-form">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top">
                        <h1>仓库管理系统</h1>
                        <div class="form-top-left">
                            <%--拿到服务器返回的提示--%>
                            <p id="mes" style="color: red;">${result.msg}</p>
                        </div>
                    </div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">工号：
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="uAccount" placeholder="登录账号" data-validate="required:请填写账号" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">密码：
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="uPwd" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span class="icon icon-key margin-small"></span>
                                <input hidden name="role" value="0" id="role">
                            </div>
                        </div>
                    </div>
                    <div style="padding:30px;"><button type="submit" class="button button-block bg-main text-big input-big">登录</button></div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="<%=basePath%>js/pintuer.js"></script>
</body>

</html>