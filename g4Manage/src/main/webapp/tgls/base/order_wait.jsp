<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <script src="../../js/out_intoData.js"></script>

<body>
<div class="cBody">
    <div class="layui-tab" lay-filter="myPage">
        <ul class="layui-tab-title">
            <li class="layui-this" lay-id="wait_Inlist">待处理入货单</li>
            <li lay-id="wait_Outlist">待处理出货单</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <table class="layui-hide" id="inWait" lay-filter="inWaitTools"></table>
            </div>
            <div class="layui-tab-item">
                <table class="layui-hide" id="outWait" lay-filter="outWaitTools"></table>
            </div>

        </div>
    </div>
</div>
</body>

<script>
    layui.use('element', function () {
        var element = layui.element;

        //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
        var layid = location.hash.replace(/^#test1=/, '');
        element.tabChange('myPage', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

        //监听Tab切换，以改变地址hash值
        element.on('tab(myPage)', function () {
            location.hash = 'test1=' + this.getAttribute('lay-id');
            console.log(this.getAttribute('lay-id'));
        });
    });
</script>

<%--入货单的--%>
<script id="inbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="submit">确认</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#inWait'
            , url: '/demo/table/user/'
            , toolbar: '#intoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'ILID', title: '出货单号', sort: true}
                , {field: 'ILby', title: '经手人'}
                , {field: 'ILComfirm', title: '确认人'}
                , {
                    field: 'ILStatus', title: '出货单状态', templet: function (d) {
                        if (d.ILStatus == 0) {
                            return d.ILStatus = "完成"
                        } else {
                            return d.ILStatus = "未完成"
                        }
                    }

                }
                , {field: 'right', title: '操作', toolbar: '#inbarDemo', width: 144}
            ]]
        });
        //监听行工具事件
        table.on('tool(inWaitTools)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'submit') {
                layer.prompt({
                    formType: 2
                    , value: data.email
                }, function (value, index) {
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>

<%--出货单的--%>

<script id="outbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="submit">确认</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#outWait'
            , url: '/demo/table/user/'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , toolbar: '#outtoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'olId', title: '出货单号', sort: true}
                , {field: 'olBy', title: '经手人'}
                , {field: 'olComfirm', title: '确认人'}
                , {
                    field: 'OLStatus', title: '出货单状态', templet: function (d) {
                        if (d.OLStatus == 0) {
                            return d.OLStatus = "完成"
                        } else {
                            return d.OLStatus = "未完成"
                        }
                    }

                }
                , {field: 'right', title: '操作', toolbar: '#outbarDemo', width: 144}
            ]]
        });
        //监听行工具事件
        table.on('tool(outWaitTools)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'submit') {
                layer.prompt({
                    formType: 2
                    , value: data.email
                }, function (value, index) {
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>


</html>
