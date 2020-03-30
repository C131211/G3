<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/25
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/layui-v2.5.6/layui/css/layui.css">
    <%--引入layUI--%>
    <script type="text/javascript" src="/js/layui-v2.5.6/layui/layui.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form {
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="addPower" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">权限名称</label>
            <div class="layui-input-inline shortInput">
                <input name="pName" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色ID</label>
            <div class="layui-input-inline shortInput">
                <input type="text" lay-verify="required" name="rID" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能ID</label>
            <div class="layui-input-inline shortInput">
                <input name="fID" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限说明</label>
            <div class="layui-input-inline shortInput">
                <textarea name="pExplain" autocomplete="off" class="layui-textarea">
                </textarea>
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
<script>
    function addPow() {
        $.ajax({
            url: "/addUser",//添加用户
            type: "POST",
            dataType: "json",
            data: $('#addPower').serialize(),
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    layer.msg("添加成功");
                    window.setTimeout('parent.layer.closeAll()',500);
                } else {
                    alert(data.msg);
                }
            }

        })
    }

    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(submitBut)', function (data) {
            //提交结果
            addPow();
            return false;
        });
    })

</script>

</html>