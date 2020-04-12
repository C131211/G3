<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/28
  Time: 17:47
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
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

</head>

<body class="cBody">
<div>
    <form id="updateGoodList" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="glId" id="glId">
        <div class="layui-form-item">
            <label class="layui-form-label">货物类别名字</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="goodName" id="goodName" required lay-verify="required|ZHCheck"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出货价</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="gOutprice" id="gOutprice" required lay-verify="required"
                       autocomplete="off" class="layui-input">
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
                    url: "/setGoodList",//商品表更新数据接口
                    dataType: "json",
                    type: "POST",
                    data: $('#updateGoodList').serialize(),
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
            $.ajax({
                url: "/getGoodListById",//商品表更新数据接口
                dataType: "json",
                type: "POST",
                data: {glId:"${requestScope.glId}"},
                success: function (data) {
                    if (data.status == 200) {
                        layui.use('form', function () {
                            var form = layui.form;
                            $("#glId").val(data.data.glId);
                            $("#goodName").val(data.data.goodName);
                            $("#gOutprice").val(data.data.gOutprice);
                            form.render();
                        });

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

