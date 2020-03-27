<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script src="/js/checkLogin.js"></script>
    <!-- 公共样式 结束 -->

</head>

<body>
<div class="cBody">
    <form id="updateAgent" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="uID" id="uID" />
        <div class="layui-form-item">
            <label class="layui-form-label">工号(登录名)</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAccount" id="uAccount"
                       readonly="readonly" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uName" id="uName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uPwd" id="uPwd"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uTel" id="uTel" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">住址</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAddr" id="uAddr" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户角色</label>
            <div class="layui-input-inline shortInput">
                <select name="rID" id="rID">
                    <option value="0">
                        超级管理员
                    </option>
                    <option value="1">
                        仓管员
                    </option>
                    <option value="2">
                        运输员
                    </option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户状态</label>
            <div class="layui-input-inline shortInput">
                <select name="uStatus" id="uStatus">
                    <option value="0">
                        正常
                    </option>
                    <option value="1">
                       锁定
                    </option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">确认修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <script>
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function (data) {
                console.log($('#updateAgent').serialize());
                $.ajax({
                    url: "/updateUser",
                    dataType: "json",
                    type: "POST",
                    data: $('#updateAgent').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            alert("更改成功");
                            window.location.reload();
                        } else {
                            layer.msg("更改失败");
                        }

                    }
                });
                return false;
            });
        });
    </script>

    <script type="application/javascript">
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
            //请求该id的用户数据
            $.ajax({
                url: "/selUserById",
                dataType: "json",
                type: "POST",
                data: {uID:"${requestScope.uID}"},
                success: function (data) {
                    if (data.status == 200) {
                        $("#uID").val(data.data.uID);
                        $("#uAccount").val(data.data.uAccount);
                        $("#uName").val(data.data.uName);
                        $("#uPwd").val(data.data.uPwd);
                        $("#uTel").val(data.data.uTel);
                        $("#uAddr").val(data.data.uAddr);
                        $("#rID").val(data.data.rID);
                        $("#uStatus").val(data.data.uStatus);
                    } else {
                        layer.msg("获取失败");
                    }

                }
            });

        })
    </script>


</div>
</body>

</html>
