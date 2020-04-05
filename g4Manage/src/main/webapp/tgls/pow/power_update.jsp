<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/26
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<body class="cBody">
<div>
    <form id="updatePower" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="pID" id="pID">
        <div class="layui-form-item">
            <label class="layui-form-label">权限名称</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="pName" id="pName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色ID</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="rID" id="rID"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能ID</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fID" id="fID"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限说明</label>
            <div class="layui-input-inline shortInput">
                <textarea type="text" name="pExplain" id="pExplain"
                          autocomplete="off" class="layui-textarea">
                </textarea>
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
                $.ajax({
                    url: "/updateUser",//权限表更新数据接口
                    dataType: "json",
                    type: "POST",
                    data: $('#updatePower').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            layer.msg("更改成功");
                            window.setTimeout('parent.layer.closeAll()',500 );
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
                url: "/selUserById",//权限表更新数据接口
                dataType: "json",
                type: "POST",
                data: {pID:"${requestScope.pID}"},
                success: function (data) {
                    if (data.status == 200) {
                        $("#pID").val(data.data.pID);
                        $("#rID").val(data.data.rID);
                        $("#fID").val(data.data.fID);
                        $("#pExplain").val(data.data.pExplain);
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
