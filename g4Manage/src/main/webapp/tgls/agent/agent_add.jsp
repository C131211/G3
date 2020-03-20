<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="RL"/>
    <!-- 作者 -->
    <meta name="revised" content=""/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="../../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../../framework/jquery.mousewheel.min.js"></script>
    <script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        .layui-form {
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="addForm" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">工号（登录账号）</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAccount" required lay-verify="required|identity" autocomplete="off"
                       class="layui-input">
            </div><i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工名字</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uName" required lay-verify="required|ZHCheck" placeholder="例:张三(只允许输入中文)"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-inline shortInput">
                <input type="password" name="uPwd" autocomplete="off" class="layui-input">
            </div><i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uTel" required lay-verify="required|phone" placeholder="例：13000000000"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uHiredate" autocomplete="off" class="layui-input">
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户角色</label>
                <div class="layui-input-inline shortInput">
                    <select name="rID" id="rID">
						<option value="0">
						</option>
                        <option value="1">
                            超级管理员
                        </option>
                        <option value="2">
                            仓管员
                        </option>
                        <option value="3">
                            运输员
                        </option>
                    </select><span id="roleSpan"></span>
                </div><i class="iconfont icon-huaban bt"></i>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户状态</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="nan" title="启用" checked>
                    <input type="radio" name="sex" value="nv" title="禁用">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
    </form>
</div>
</body>

</html>