<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/4/7
  Time: 10:41
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
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
    <!-- 公共样式 结束 -->
</head>

<body class="cBody">
<div>
    <div class="supplierList">
        <table class="layui-hide" id="lookSupList" lay-filter="supTools"></table>
    </div>
</div>
<script>
    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#lookSupList'   //表格ID
            , url: '/getAllSupplyPage' //数据接口
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'supName', title: '供应商名', width: 130}
                , {field: 'supIncharge', title: '供应商负责人', width: 130}
                , {field: 'supTel', title: '供应商联系方式'}
            ]]
        })
    });
</script>


</body>


</html>
