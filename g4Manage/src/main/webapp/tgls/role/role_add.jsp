<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/16
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/layui-v2.5.6/layui/css/layui.css">
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <%--引入layUI--%>
    <script type="text/javascript" src="/js/layui-v2.5.6/layui/layui.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form {
            margin-right: 30%;
        }
    </style>

</head>

<body class="cBody">
<div>
    <form id="addRole" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="rName" required lay-verify="required|ZHCheck" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色说明</label>
            <div class="layui-input-inline shortInput">
                <textarea name="rExplain" autocomplete="off" class="layui-textarea">
                </textarea>
            </div>
        </div>
        <label class="layui-form-label">角色状态</label>
        <div class="layui-input-block">
            <input type="radio" name="rStatus" value="1" title="启用" checked>
            <input type="radio" name="rStatus" value="0" title="禁用">
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
    function addRole() {
        $.ajax({
            url: "/addRole",
            type: "POST",
            dataType: "json",
            data: $('#addRole').serialize(),
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
            addRole();
            return false;
        });
        form.verify({
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ZHCheck: [
                /^[\u0391-\uFFE5]+$/
                ,'只允许输入中文'
            ]
        });
    })

</script>

</html>