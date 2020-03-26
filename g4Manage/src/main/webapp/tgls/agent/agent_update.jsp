<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/16
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
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
            .layui-form-label {
                width: 100px;
            }

            .layui-input-block {
                margin-left: 130px;
            }
        </style>
    </head>
    </head>
<body>
<div class="cBody">
    <form id="addForm" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">员工号</label>
            <div class="layui-input-block">
                <input type="text" name="uAccount" id="uAccount" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工名称</label>
            <div class="layui-input-block">
                <input type="text" name="uName" id="uName" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-block">
                <input type="text" name="uPwd" id="uPwd" required lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input type="text" name="uTel" id="uTel" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-block">
                <input type="text" name="uHiredate" id="uHiredate" autocomplete="off" class="layui-input">
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
                <input type="radio" name="sex" value="nan" title="启用">
                <input type="radio" name="sex" value="nv" title="禁用" checked>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <script>
        layui.use(['upload','form'], function() {
            var form = layui.form;
            var upload = layui.upload;
            var layer = layui.layer;
            //监听提交
            //解决了layui.open弹窗从内部关闭这个弹窗的问题
            form.on('submit(submitBut)', function (data) {
                var updateFrame = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(updateFrame);  //再改变当前层的标题
            })
        })
    </script>

</div>
</body>
</html>

