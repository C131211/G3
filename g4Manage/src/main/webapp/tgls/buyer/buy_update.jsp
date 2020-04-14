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
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <!-- 公共样式 结束 -->
</head>

<body class="cBody">
<div>
    <form id="updateBuyer" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="buyId" id="buyId" />
        <div class="layui-form-item">
            <label class="layui-form-label">经销商名字</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="buyName" id="buyName" required lay-verify="required|ZHCheck"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经销商负责人</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="buyIncharge" id="buyIncharge" required lay-verify="required|ZHCheck"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经销商联系方式</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="buyTel" id="buyTel" lay-verify="required|phone" autocomplete="off" class="layui-input">
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
                    url: "/editBuyer",
                    dataType: "json",
                    type: "POST",
                    data: $('#updateBuyer').serialize(),
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
            form.verify({
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                ZHCheck: [
                    /^[\u0391-\uFFE5]+$/
                    ,'只允许输入中文'
                ]
            });
        });
    </script>

    <script type="application/javascript">
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
            //请求该id的用户数据
            $.ajax({
                url: "/getBuyerById",
                dataType: "json",
                type: "POST",
                data: {buyId:"${requestScope.buyId}"},
                success: function (data) {
                    if (data.status == 200) {
                        layui.use('form', function () {
                            var form = layui.form;
                            $("#buyId").val(data.data.buyId);
                            $("#buyName").val(data.data.buyName);
                            $("#buyIncharge").val(data.data.buyIncharge);
                            $("#buyTel").val(data.data.buyTel);
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