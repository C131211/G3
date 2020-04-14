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

    <script type="text/javascript">
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

</head>
<body class="cBody">
<form id="addInList" class="layui-form">
    <input type="hidden" name="ILBy" value="${sessionScope.result.data.uName}">
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
                    <label class="layui-form-label">入库库名</label>
                    <div class="layui-input-inline" style="width: 25%">
                        <select name="sID" id="sID" class="layui-form-select" lay-verify="required">
                            <option value="">未选择</option>
                        </select>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">确认人</label>
                        <div class="layui-input-inline">
                            <select type="text" id="ILComfirm" name="ILComfirm" placeholder="请输入" autocomplete="off"
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
                            <select name="goodName" lay-filter="ILSelect" class="layui-form-select" lay-verify="required">
                                <option value="">未选择</option>
                                <c:forEach items="${GoodListResult.data}" var="item">
                                    <option>${item.goodName}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">入货价</label>
                            <div class="layui-input-inline">
                                <input type="text" name="ILprice" placeholder="请输入" required lay-verify="required|number" autocomplete="off"
                                       class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">数量</label>
                            <div class="layui-input-inline">
                                <input type="text" name="ILNum" placeholder="请输入" required lay-verify="required|number" autocomplete="off"
                                       class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">供应商</label>
                            <div class="layui-input-inline">
                            <select name="ILFrom" lay-filter="ILSelect" class="layui-form-select" lay-verify="required">
                                <option value="">未选择</option>
                                <c:forEach items="${SupplyResult.data}" var="sup">
                                    <option>${sup.supName}</option>
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
            "<select name='goodName' lay-filter='ILSelect' class='layui-form-select' lay-verify='required'>" +
            "<option value=''>未选择</option>" +
            "<c:forEach items='${GoodListResult.data}' var='item'>" +
            "<option>${item.goodName}</option>" +
            "</c:forEach>" +
            "</select>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>入货价</label>" +
            "<div class='layui-input-inline'>" +
            "<input type='text' name='ILprice' placeholder='请输入' required lay-verify='required|number' autocomplete='off' class='layui-input' lay-verify='required'>" +
            "</div>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>数量</label>" +
            "<div class='layui-input-inline'>" +
            "<input type='text' name='ILNum' placeholder='请输入' required lay-verify='required|number' autocomplete='off' class='layui-input' lay-verify='required'>" +
            "</div>" +
            "</div>" +
            "<div class='layui-inline'>" +
            "<label class='layui-form-label'>供应商</label>" +
            "<div class='layui-input-inline'>" +
            "<select name='ILFrom' lay-filter='ILSelect' class='layui-form-select' lay-verify='required'>" +
            "<option value=''>未选择</option>" +
            "<c:forEach items='${SupplyResult.data}' var='sup'>" +
            "<option>${sup.supName}</option>" +
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
    function addInorder() {
        $.ajax({
            url: "/addInList",
            type: "POST",
            dataType: "json",
            data: $('#addInList').serialize(),
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
        form.on('submit(submitBut)', function (data) {
            //提交结果
            addInorder();
            return false;
        });
    });




</script>

</body>
</html>
