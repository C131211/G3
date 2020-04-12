<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/4/7
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <script src="/js/checkLogin.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <!-- 公共样式 结束 -->
</head>

<body class="cBody">
<div>
    <form id="updateSupplier" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="supId" id="supId"/>
        <div class="layui-form-item">
            <label class="layui-form-label">供应商名字</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="supName" id="supName" required lay-verify="required|ZHCheck" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">供应商负责人</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="supIncharge" id="supIncharge" required lay-verify="required|ZHCheck"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经销商联系方式</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="supTel" id="supTel" lay-verify="required|phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">确认修改</button>
            </div>
        </div>
    </form>

    <script>
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function (data) {
                $.ajax({
                    url: "/editSupply",
                    dataType: "json",
                    type: "POST",
                    data: $('#updateSupplier').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            layer.msg("更改成功");
                            window.setTimeout('parent.layer.closeAll()', 500);
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
                url: "/getSupplyById",
                dataType: "json",
                type: "POST",
                data: {supId: "${requestScope.supId}"},
                success: function (data) {
                    if (data.status == 200) {
                        layui.use('form', function () {
                            var form = layui.form;
                            $("#supId").val(data.data.supId);
                            $("#supName").val(data.data.supName);
                            $("#supIncharge").val(data.data.supIncharge);
                            $("#supTel").val(data.data.supTel);
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