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
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="/framework/jquery.mousewheel.min.js"></script>
    <script src="/framework/jquery.mCustomScrollbar.min.js"></script>
    <!-- 公共样式 结束 -->

    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>

    <style>
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body class="cBody">
<div class="saveList">
    <form>
        <table class="layui-hide" id="saList" lay-filter="sTools"></table>
    </form>
</div>
<script id="LookbarDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看仓库货物</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#saList'   //表格ID
            , url: '/getAllSave' //仓库表数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , height: 'full-200'  //高度最大化自适应
            , method: 'post'//传输方式
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'sName', title: '仓库名字', width: 100,}
                , {field: 'sNsave', title: '现存量', width: 80}
                , {field: 'sTsave', title: '仓库存量上限', width: 120}
                , {field: 'sAddr', title: '仓库地址', width: 200}
                , {field: 'sExplain', title: '仓库说明',}
                , {
                    field: 'sStatus', title: '仓库状态', width: 90, templet: function (d) {
                        if (d.sStatus == 0) {
                            return d.sStatus = "正常"
                        } else {
                            return d.sStatus = "锁定"
                        }
                    }
                }
            ]]
        });
    })
</script>
</body>
</html>