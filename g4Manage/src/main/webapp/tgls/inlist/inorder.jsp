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

<body>
<div class="cBody">
    <form>
        <div class="layui-form-inline">
            <label class="layui-form-label">订单时间</label>
            <div class="layui-input-inline">
                <input type="text" id="startTime" name="startTime" autocomplete="off" placeholder="请输入开始时间"
                       class="layui-input">
            </div>
            至
            <div class="layui-input-inline">
                <input type="text" id="endTime" name="endTime" autocomplete="off" placeholder="请输入结束时间"
                       class="layui-input">
            </div>
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="select">检索</button>
        </div>
            <div>
                <table class="layui-hide" id="all_inList" lay-filter="allILTools"></table>
            </div>
    </form>
</div>
</body>
            <%--搜索--%>
            <script>
                layui.use('form', function () {
                    var form = layui.form;
                    //监听提交
                    form.on('submit(formDemo)', function (data) {
                        layer.msg(JSON.stringify(data.field));
                        return false;
                    });
                });
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
                , {field: 'ILID', title: '入货单号', sort: true}
                , {field: 'ILDate', title: '入货日期', sort: true}
                , {field: 'sID', title: '入货仓库', sort: true}
                , {field: 'ILFrom', title: '合作商', sort: true}
                , {field: 'ILBy', title: '经手人', sort: true}
                , {field: 'ILComfirm', title: '确认人', sort: true}
                , {
                    field: 'ILStatus', title: '入货单状态', templet: function (d) {
                        if (d.ILStatus == 0) {
                            return d.ILStatus = "完成"
                        } else {
                            return d.ILStatus = "未完成"
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
        $("#select").click(function (){
            table.reload("all_inList",{
                where: { //设定异步数据接口的额外参数，任意设
                    startTime: $("#startTime").val(),endTime: $("#endTime").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })
    })
</script>
</html>
