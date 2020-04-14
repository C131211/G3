<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/9
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
</head>
<body class="cBody">
<form id="addOutList" class="layui-form">
    <input type="hidden" name="olBy" value="${sessionScope.result.data.uName}">
    <blockquote>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-normal layui-btn-radius" type="button" onclick="add_tab_line()">添加
            </button>
            <input class="layui-btn layui-btn-radius" type="submit" style="float: right" lay-submit
                   lay-filter="submitBut" value="立即提交"/>
        </div>
        <fieldset class="layui-elem-field">
            <div class="layui-form-item" style="padding-top: 25px">
                <div class="layui-inline">
                    <label class="layui-form-label">出库库名</label>
                    <div class="layui-input-inline" style="width: 25%">
                        <select name="sID" id="sID" class="layui-form-select" lay-verify="required">
                            <option value="">未选择</option>
                        </select>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">确认人</label>
                        <div class="layui-input-inline">
                            <select type="text" id="olComfirm" name="olComfirm" placeholder="请输入" autocomplete="off"
                                    class="layui-form-select">
                                <option value="">未选择</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div id="test">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">货物名称</label>
                        <div class="layui-input-inline" style="width: 13%">
                            <select name="goodName" lay-filter="OLSelect" class="layui-form-select" lay-verify="required">
                                <option value="">未选择</option>
                                <c:forEach items="${GoodListResult.data}" var="item">
                                    <option>${item.goodName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">出货价</label>
                            <div class="layui-input-inline">
                                <input type="text" name="olPrice" required lay-verify="required|number" autocomplete="off" class="layui-input" lay-verify="required" value="${item.gOutprice}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">数量</label>
                            <div class="layui-input-inline">
                                <input type="text" name="olNum" required lay-verify="required|number" placeholder="请输入" autocomplete="off"
                                       class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-inline">
                        <label class="layui-form-label">经销商</label>
                        <div class="layui-input-inline">
                            <select name="olDestin" lay-filter="ILSelect" class="layui-form-select" lay-verify="required">
                                <option value="">未选择</option>
                                <c:forEach items="${BuyerResult.data}" var="buy">
                                    <option>${buy.buyName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </blockquote>
</form>

<script>
    //刷新表单
    function reloadForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }


    //增加行
    function add_tab_line() {
        var div = $("<div class='layui-form-item'>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>货物名称</label>" +
            "<div class='layui-input-inline' style='width: 13%'>" +
            "<select name='goodName' lay-filter='OLSelect' class='layui-form-select' lay-verify='required'>" +
            "<option value=''>未选择</option>" +
            "<c:forEach items='${GoodListResult.data}' var='item'>" +
            "<option>${item.goodName}</option>" +
            "</c:forEach>" +
            "</select>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>出货价</label>" +
            "<div class='layui-input-inline'>" +
            "<input type='text' name='olPrice' placeholder='请输入' required lay-verify='required|number' autocomplete='off' class='layui-input' lay-verify='required'>" +
            "</div>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'> 数量</label>" +
            "<div class='layui-input-inline'>" +
            "<input type='text' name='olNum' placeholder='请输入' required lay-verify='required|number' autocomplete='off' class='layui-input' lay-verify='required'>" +
            "</div>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>经销商</label>" +
            "<div class='layui-input-inline'>" +
            "<select name='olDestin' lay-filter='OLSelect' class='layui-form-select' lay-verify='required'>" +
            "<option value=''>未选择</option>" +
            "<c:forEach items='${BuyerResult.data}' var='buy'>" +
            "<option>${buy.buyName}</option>" +
            "</c:forEach>" +
            "</select>" +
            "</div>" +
            "</div>" +
            "</div>"
        );
        $("#test").append(div);
        reloadForm();
    }

    //提交
    function addOutorder() {
        $.ajax({
            url: "/addOutList",
            type: "POST",
            dataType: "json",
            data: $('#addOutList').serialize(),
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    layer.msg("添加成功");
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            }

        })
    }

    //监听提交
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        <%--form.on('select(OLSelect)', function(data) {--%>
        <%--    <c:forEach items="${GoodListResult.data}" var="money">--%>

        <%--    </c:forEach>--%>
        <%--});--%>
        form.on('submit(submitBut)', function (data) {
            //提交结果
            addOutorder();
            return false;
        });
    });

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

</body>
</html>
