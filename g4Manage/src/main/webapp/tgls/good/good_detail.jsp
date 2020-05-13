<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <table class="layui-hide" id="gDetailList" lay-filter="gDetailTools"></table>

    <script>
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function (data) {
                return false;
            });
        });
    </script>

</div>
<script>
    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#gDetailList'   //表格ID
            , url: '/getGoods' //数据接口
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , where:{sID:'${sID}'}
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-100'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'gName', title: '货物名', width: 120}
                , {field: 'gNum', title: '货物数量', width: 120}
                , {field: 'gInprice', title: '入货价',}
                , {field: 'gExplain', title: '货物描述', width: 120}
                , {field: 'gSatime', title: '入仓日期', width: 120,sort: true,
                    templet:'<div>{{ Format(d.gSatime,"yyyy-MM-dd")}}</div>'}
                , {field: 'supName', title: '供应商',}
            ]]
        });
    })
</script>


</body>


</html>