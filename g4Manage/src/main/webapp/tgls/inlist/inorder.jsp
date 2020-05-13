<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <select type="text" id="ILComfirm" name="ILComfirm" autocomplete="off"
                        class="layui-form-select">
                    <option value="">请选择确认人</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="ILFrom" id="ILFrom" class="layui-form-select">
                    <option value="">请选择供应商</option>
                    <c:forEach items="${SupplyResult.data}" var="sup">
                        <option>${sup.supName}</option>
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
    <table class="layui-hide" id="all_inList" lay-filter="allILTools"></table>

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
<%--下拉框--%>
<script type="text/javascript">
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
        //供应商选择
        $.ajax({
            url: "/getSupply",
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
                        $("#ILComfirm").append(option);
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


<%--历史列表--%>
<script id="allinbarDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="allinDetails">查看详情</a>
</script>
<script>
    //初始化表格
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#all_inList'   //表格ID
            , url: '/getInListByILBy' //数据接口
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , where: {ILBy: '${sessionScope.result.data.uName}'}
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#allintoolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print']
            , method: 'post'//传输方式
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'ilid', title: '入货单号', width: 300}
                , {
                    field: 'ildate', title: '入货日期', sort: true,
                    templet: '<div>{{ Format(d.ildate,"yyyy-MM-dd")}}</div>'
                }
                , {field: 'sID', title: '入货仓库', sort: true}
                , {field: 'ilfrom', title: '供应商', sort: true}
                , {field: 'ilby', title: '经手人', sort: true}
                , {field: 'ilcomfirm', title: '确认人', sort: true}
                , {
                    field: 'orderOinion', title: '审核意见', templet: function (d) {
                        if (d.orderOinion == 1) {
                            return d.olStatus = "同意"
                        } else {
                            return d.olStatus = "拒绝"
                        }
                    }
                }
                , {
                    field: 'ilstatus', title: '入货单状态', templet: function (d) {
                        if (d.ilstatus == 1) {
                            return d.ilstatus = "完成"
                        } else {
                            return d.ilstatus = "未完成"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#allinbarDemo', width: 144}
            ]]
        });
        //监听行工具事件
        table.on('tool(allILTools)', function (obj) {
            var data = obj.data;
            if (obj.event === 'allinDetails') {
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
            }
        })
        //查询作用
        $("#select").click(function () {
            table.reload("all_inList", {
                where: { //设定异步数据接口的额外参数，任意设
                    sID: $("#sID").val(),
                    goodName: $("#goodName").val(),
                    ILComfirm: $("#ILComfirm").val(),
                    ILFrom: $("#ILFrom").val(),
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
