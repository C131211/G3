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
    <div class="goodList">
        <form class="layui-form" action="">
            <div class="layui-inline">
                <label class="layui-form-label">搜索关键字</label>
                <div class="layui-input-inline">
                    <select name="sID" id="sID" class="layui-form-select">
                        <option value="">请选择仓库</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="gName" id="gName" class="layui-form-select">
                        <option value="">请选择货物</option>
                        <c:forEach items="${GoodListResult.data}" var="item">
                            <option>${item.goodName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="supName" id="supName" class="layui-form-select">
                        <option value="">请选择供应商</option>
                        <c:forEach items="${SupplyResult.data}" var="sup">
                            <option>${sup.supName}</option>
                        </c:forEach>
                    </select>
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="select">检索</button>
            </div>
        </form>
    </div>
</div>

</body>

    <table class="layui-hide" id="goodList" lay-filter="goodTools"></table>

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
            })
        })
    </script>
    <script>
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function (data) {
                return false;
            });
        });
    </script>
<script>
    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#goodList'   //表格ID
            , url: '/getGoods' //数据接口
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
                , {field: 'gName', title: '货物名', width: 120}
                , {field: 'gNum', title: '货物数量', width: 120}
                , {field: 'gInprice', title: '入货价',}
                , {field: 'sID', title: '存放仓库', width: 130}
                , {field: 'supName', title: '供应商',}
            ]]
        });
    //查询作用
    $("#select").click(function () {
        table.reload("goodList", {
            where: { //设定异步数据接口的额外参数，任意设
                sID: $("#sID").val(),
                gName: $("#gName").val(),
                supName: $("#supName").val(),
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    })
    })
</script>
</html>