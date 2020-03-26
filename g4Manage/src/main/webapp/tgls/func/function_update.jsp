<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/26
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content=""/>
    <!-- 作者 -->
    <meta name="revised" content=""/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <script src="/js/checkLogin.js"></script>
    <!-- 公共样式 结束 -->

</head>

<body>
<div class="cBody">
    <form id="updateFunction" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="fID" value="${result.data.fID}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">功能名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fName" value="${result.data.fName}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能地址</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fUrl" value="${result.data.fUrl}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能说明</label>
            <div class="layui-input-inline shortInput">
                <textarea type="text" name="fExplain" value="${result.data.fExplain}"
                       autocomplete="off" class="layui-textarea">
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能状态</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fStatus"
                       value="${result.data.fStatus}"
                       autocomplete="off" class="layui-input">
            </div>
            <span>tips:0启用,1禁用</span>
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
                    url: "/updateUser",
                    dataType: "json",
                    type: "POST",
                    data: $('#updateFunction').serialize(),
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
            checkLogin(${sessionScope.result.data.fID});
        })
    </script>


</div>
</body>

</html>
