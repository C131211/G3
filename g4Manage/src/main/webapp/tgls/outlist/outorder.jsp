<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="/js/TimeFormat.js" charset="utf-8"></script>

</head>

<body>
<div class="cBody">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <select name="sID" id="sID" class="layui-form-select">
                    <option value="">请选择仓库</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="goodName" id="goodName" class="layui-form-select">
                    <option value="">请选择货物</option>
                    <c:forEach items="${GoodListResult.data}" var="item">
                        <option>${item.goodName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select type="text" id="olComfirm" name="olComfirm" autocomplete="off"
                        class="layui-form-select">
                    <option value="">请选择确认人</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="olDestin" id="olDestin" class="layui-form-select">
                    <option value="">请选择经销商</option>
                    <c:forEach items="${BuyerResult.data}" var="buy">
                        <option>${buy.buyName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <input type="text" id="startTime" name="startTime" autocomplete="off" placeholder="请输入开始时间"
                       class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" id="endTime" name="endTime" autocomplete="off" placeholder="请输入结束时间"
                       class="layui-input">
            </div>
            <div class="layui-form-inline">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="select">检索</button>
            </div>
        </div>
    </form>
    <table class="layui-hide" id="all_outList" lay-filter="alloutOLTools"></table>
</div>
</div>
</body>
<%--搜索--%>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            return false;
        });
    });
</script>
<%--选择框--%>
<script>
    //刷新表单
    function reloadForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    $(function () {
        //获取下拉框数据
        $.ajax({
            url: "/getAllGoodList",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    reloadForm();
                } else {
                    alert(data.msg);
                }
            }
        });
        //经销商选择
        $.ajax({
            url: "/getBuyer",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    reloadForm();
                } else {
                    alert(data.msg);
                }
            }
        });
        //仓库选择
        $.ajax({
            url: "/getSaveName",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    for (var i = 0; i < data.data.length; i++) {
                        var option = $("<option />");
                        option.html(data.data[i].sName);
                        option.val(data.data[i].sID);
                        $("#sID").append(option);
                    }
                    reloadForm();

                } else {
                    alert(data.msg);
                }
            }
        });
        //确认人选择
        $.ajax({
            url: "/getRoleUser",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    for (var i = 0; i < data.data.length; i++) {
                        var option = $("<option />");
                        option.html(data.data[i].uName);
                        option.val(data.data[i].uName);
                        $("#olComfirm").append(option);
                    }
                    reloadForm();
                } else {
                    alert(data.msg);
                }
            }
        })

    })
</script>
<%--时间--%>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        var endDate = laydate.render({
            elem: '#endTime',//选择器结束时间
            type: 'datetime',
            min: "1970-1-1",//设置min默认最小值
            done: function (value, date) {
                startDate.config.max = {
                    year: date.year,
                    month: date.month - 1,//关键
                    date: date.date,
                    hours: 0,
                    minutes: 0,
                    seconds: 0
                }
            }
        });

        //日期范围
        var startDate = laydate.render({
            elem: '#startTime',
            type: 'datetime',
            max: "2099-12-31",//设置一个默认最大值
            done: function (value, date) {
                endDate.config.min = {
                    year: date.year,
                    month: date.month - 1, //关键
                    date: date.date,
                    hours: 0,
                    minutes: 0,
                    seconds: 0
                };
            }
        });
    });
</script>

<script id="alloutbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="alloutDetails">查看详情</a>
</script>
<script>
    //初始化表格
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#all_outList'   //表格ID
            , url: '/getOutListByILBy' //数据接口
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , where: {olBy: '${sessionScope.result.data.uName}'}
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#allouttoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'olId', title: '出货单号', width: 300}
                , {field: 'olDate', title: '出货日期', sort: true,
                    templet: '<div>{{ Format(d.olDate,"yyyy-MM-dd")}}</div>'}
                , {field: 'sID', title: '出货仓库', sort: true}
                , {field: 'olDestin', title: '经销商', sort: true}
                , {field: 'olBy', title: '经手人', sort: true}
                , {field: 'olComfirm', title: '确认人', sort: true}
                , {
                    field: 'olStatus', title: '出货单状态', templet: function (d) {
                        if (d.olStatus == 1) {
                            return d.olStatus = "完成"
                        } else {
                            return d.olStatus = "未完成"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#alloutbarDemo', width: 144}
            ]]
        });

        //监听行工具事件
        table.on('tool(alloutOLTools)', function (obj) {
            var data = obj.data;
            if (obj.event === 'alloutDetails') {
                layer.open({
                    title: "详细信息",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id=' + data.olId + '&pageType=outlistDetail',

                })
            }
        });
        //查询作用
        $("#select").click(function () {
            table.reload("all_outList", {
                where: { //设定异步数据接口的额外参数，任意设
                    sID: $("#sID").val(),
                    goodName: $("#goodName").val(),
                    olComfirm: $("#olComfirm").val(),
                    olDestin: $("#olDestin").val(),
                    startTime: $("#startTime").val(),
                    endTime: $("#endTime").val()
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })
    })
</script>
</html>