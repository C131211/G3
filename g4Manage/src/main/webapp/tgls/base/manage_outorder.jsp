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
    <script src="/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>

</head>

<body>
<div class="cBody">
    <div class="layui-tab" lay-filter="myPage">
        <ul class="layui-tab-title">
            <li class="layui-this" lay-id="historyList">历史列表</li>
            <li lay-id="todayList">今日列表</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <table class="layui-hide" id="all_outList" lay-filter="alloutOLTools"></table>
            </div>
            <div class="layui-tab-item">
                <table class="layui-hide" id="today_outList" lay-filter="tooutOLTools"></table>
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

<%--历史列表--%>
<script id="alloutbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="alloutedit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="alloutdel">删除</a>
</script>
<script>
    //初始化表格
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#all_outList'   //表格ID
            , url: '/userList' //数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#allouttoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'olId', title: '出货单号', sort: true}
                , {field: 'olDate', title: '出货日期', sort: true}
                , {field: 'sID', title: '出货仓库', sort: true}
                , {field: 'olDestin', title: '合作商', sort: true}
                , {field: 'olBy', title: '经手人', sort: true}
                , {field: 'olComfirm', title: '确认人', sort: true}
                , {
                    field: 'OLStatus', title: '出货单状态', templet: function (d) {
                        if (d.OLStatus == 0) {
                            return d.OLStatus = "完成"
                        } else {
                            return d.OLStatus = "未完成"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#alloutbarDemo', width: 144}
            ]]
        });

        //监听行工具事件
        table.on('tool(alloutOLTools)', function (obj) {
            var data = obj.data;
            if (obj.event === 'alloutdel') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "/userDelById",//添加用户
                        type: "POST",
                        dataType: "json",
                        data: {olId: data.olId},
                        success: function (data) {
                            if (data.status == 200) {
                                //接收到成功的提示
                                window.location.reload();
                            } else {
                                alert(data.msg);
                            }
                        }

                    })
                });
            } else if (obj.event === 'alloutedit') {
                layer.open({
                    title: "出货单信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/userOperation?olId=' + data.olId + '&pageType=edit',

                })
            }
        })
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
            //请求该id的用户数据
            $.ajax({
                url: "/selUserById",
                dataType: "json",
                type: "POST",
                data: {olDate:"${requestScope.olDate}"},
                success: function (data) {
                    if (data.status == 200) {
                        layui.use('form', function () {
                            var form = layui.form;
                            $("#olID").val(data.data.olID);
                            $("#sID").val(data.data.sID);
                            $("#olDate").val(data.data.olDate);
                            $("#olBy").val(data.data.olBy);
                            $("#olComfirm").val(data.data.olComfirm);
                            $("#olDestin").val(data.data.olDestin);
                            $("#olStatus").val(data.data.olStatus);
                            form.render();
                        });
                    } else {
                        layer.msg("获取失败");
                    }
                }
            });
        });
    })
</script>

<%--今日列表--%>
<script id="tooutbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="tooutedit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="tooutdel">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#today_outList'   //表格ID
            , url: '/userList' //数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#toouttoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'olId', title: '出货单号', sort: true}
                , {field: 'olDate', title: '出货日期', sort: true}
                , {field: 'sID', title: '出货仓库', sort: true}
                , {field: 'olDestin', title: '合作商', sort: true}
                , {field: 'olBy', title: '经手人', sort: true}
                , {field: 'olComfirm', title: '确认人', sort: true}
                , {
                    field: 'OLStatus', title: '出货单状态', templet: function (d) {
                        if (d.OLStatus == 0) {
                            return d.OLStatus = "完成"
                        } else {
                            return d.OLStatus = "未完成"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#tooutbarDemo', width: 144}
            ]]
        });
        //监听行工具事件
        table.on('tool(tooutOLTools)', function (obj) {
            var data = obj.data;
            if (obj.event === 'tooutdel') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "/userDelById",//添加用户
                        type: "POST",
                        dataType: "json",
                        data: {olId: data.olId},
                        success: function (data) {
                            if (data.status == 200) {
                                //接收到成功的提示
                                window.location.reload();
                            } else {
                                alert(data.msg);
                            }
                        }

                    })
                });
            } else if (obj.event === 'tooutedit') {
                layer.open({
                    title: "出货单信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/userOperation?olId=' + data.olId + '&pageType=edit',

                })
            }
        })
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
            //请求该id的用户数据
            $.ajax({
                url: "/selUserById",
                dataType: "json",
                type: "POST",
                data: {olDate:"${requestScope.olDate}"},
                success: function (data) {
                    if (data.status == 200) {
                        layui.use('form', function () {
                            var form = layui.form;
                            $("#olID").val(data.data.olID);
                            $("#sID").val(data.data.sID);
                            $("#olDate").val(data.data.olDate);
                            $("#olBy").val(data.data.olBy);
                            $("#olComfirm").val(data.data.olComfirm);
                            $("#olDestin").val(data.data.olDestin);
                            $("#olStatus").val(data.data.olStatus);
                            form.render();
                        });
                    } else {
                        layer.msg("获取失败");
                    }
                }
            });
        });
    })
</script>
</html>