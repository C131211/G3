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

<body class="cBody">
<div>
    <form id="addAgent" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">工号（登录账号）</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAccount" id="Account" required lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工名字</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uName" required lay-verify="required|ZHCheck" autocomplete="off"
                       class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-inline shortInput">
                <input type="password" name="uPwd" autocomplete="off" lay-verify="required" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uTel" autocomplete="off" required lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">住址</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAddr" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户角色</label>
            <div class="layui-input-inline shortInput">
                <select name="rID" id="rID" required lay-verify="required" class="layui-form-select" autocomplete="off">
                    <option value="0">超级管理员</option>
                    <option value="1">仓管员</option>
                    <option value="2">运输员</option>
                </select>
            </div>
            <i class="iconfont icon-huaban bt"></i>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户状态</label>
            <div class="layui-input-block">
                <input type="radio" name="uStatus" value="1" title="启用" checked>
                <input type="radio" name="uStatus" value="0" title="禁用">
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
        //入职时间
        var today = new Date();
        var submitTime = today.getFullYear() + '年' + (today.getMonth() + 1) + '月' + today.getDate() + '日';
        $("#date").attr('value', submitTime);

        function addUser() {
            $.ajax({
                url: "/addUser",//添加用户
                type: "POST",
                dataType: "json",
                data: $('#addAgent').serialize(),
                success: function (data) {
                    if (data.status == 200) {
                        //接收到成功的提示
                        layer.msg("添加成功");
                        window.setTimeout('parent.layer.closeAll()', 500);
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
                addUser();
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
</div>
</body>

</html>