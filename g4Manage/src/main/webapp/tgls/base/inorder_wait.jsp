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
    <div class="inWaitList">
        <table class="layui-hide" id="inWait" lay-filter="inWaitTools"></table>
    </div>
</div>
<%--入货单的--%>
<script id="inbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="intoDetails">查看库单详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="submit">确认</a>
    <a class="layui-btn layui-btn-xs" lay-event="reject">取消</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#inWait'
            , url: '/getNotDealInList'
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#intoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , where: {ILComfirm: '${sessionScope.result.data.uName}'}
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'ilid', title: '入货单号', width: 380}
                , {field: 'ilby', title: '经手人'}
                , {field: 'ilcomfirm', title: '确认人'}
                , {
                    field: 'ilstatus', title: '入货单状态', templet: function (d) {
                        if (d.ilstatus == 1) {
                            return d.ilstatus = "完成"
                        } else {
                            return d.ilstatus = "未完成"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#inbarDemo', width: 250}
            ]]
        });
        //监听行工具事件
        table.on('tool(inWaitTools)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'submit') {
                $.ajax({
                    url: "/dealInListById",//
                    type: "POST",
                    dataType: "json",
                    data: {ILID: data.ilid, orderOinion:1,ILComfirm:'${sessionScope.result.data.uName}'},
                    success: function (data) {
                        if (data.status == 200) {
                            //接收到成功的提示
                            window.location.reload();
                        } else {
                            alert(data.msg);
                        }
                    }

                })
            } else if (obj.event === 'intoDetails') {
                layer.open({
                    title: "订单详细信息",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id=' + data.ilid + '&pageType=inlistDetail',

                });
            } else if (obj.event === 'reject') {
                $.ajax({
                    url: "/dealInListById",//
                    type: "POST",
                    dataType: "json",
                    data: {ILID: data.ilid,orderOinion:0,ILComfirm:'${sessionScope.result.data.uName}'},
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
