<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/28
  Time: 17:39
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
    <!-- 滚动条插件 -->
    <!-- 公共样式 结束 -->

    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
</head>

<body class="cBody">
<div>
        <table class="layui-hide" id="inListDetails" lay-filter="inDetailTools"></table>
</div>
</body>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#inListDetails'   //表格ID
            , url: '/getInListById' //数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , where:{ILID:'${ILID}'}
            , height: 'full-100'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cols: [[
                {type:'checkbox',fixed:'left'}
                , {field: 'goodName', title: '货物类名',}
                , {field: 'ilprice', title: '入货价',}
                , {field: 'ilnum', title: '入货量',}
                , {field: 'iltotal', title: '货物小计',}
                , {field: 'ilfrom', title: '供应商',}
                , {field: 'sID', title: '仓库号',}
            ]]
        });
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
            //请求该id的用户数据
        });
    });
</script>
</html>
