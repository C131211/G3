<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/4/7
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>仓库管理系统</title>

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

</head>

<body class="cBody">
<div>
    <div class="outWaitList">
        <table class="layui-hide" id="outWait" lay-filter="outWaitTools"></table>
    </div>
</div>
<%--出货单的--%>

<script id="outbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="outtoDetails">查看库单详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="comfirm">确认</a>
    <a class="layui-btn layui-btn-xs" lay-event="reject">取消</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#outWait'
            , url: '/getNotDealOutList'
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , where: {olComfirm: '${sessionScope.result.data.uName}'}
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#outtoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'olId', title: '出货单号', width: 380}
                , {field: 'olBy', title: '经手人'}
                , {field: 'olComfirm', title: '确认人'}
                , {
                    field: 'olStatus', title: '出货单状态', templet: function (d) {
                        if (d.olStatus == 1) {
                            return d.olStatus = "完成"
                        } else {
                            return d.olStatus = "未完成"
                        }
                    }

                }
                , {field: 'right', title: '操作', toolbar: '#outbarDemo', width: 250}
            ]]
        });
        //监听行工具事件
        table.on('tool(outWaitTools)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'comfirm') {
                $.ajax({
                    url: "/dealOutListById",//
                    type: "POST",
                    dataType: "json",
                    data: {olId: data.olId,orderOinion:1,olComfirm:'${sessionScope.result.data.uName}'},
                    success: function (data) {
                        if (data.status == 200) {
                            //接收到成功的提示
                            window.location.reload();
                        } else {
                            alert(data.msg);
                        }
                    }
                })
            } else if (obj.event === 'outtoDetails') {
                layer.open({
                    title: "订单详细信息",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id=' + data.olId + '&pageType=outlistDetail',

                });
            } else if (obj.event === 'reject') {
                $.ajax({
                    url: "/dealOutListById",//
                    type: "POST",
                    dataType: "json",
                    data: {olId: data.olId, orderOinion:0,olComfirm:'${sessionScope.result.data.uName}'},
                    success: function (data) {
                        if (data.status == 200) {
                            //接收到成功的提示
                            window.location.reload();
                        } else {
                            alert(data.msg);
                        }
                    }

                })
            }
        })
    })
</script>


</body>


</html>
