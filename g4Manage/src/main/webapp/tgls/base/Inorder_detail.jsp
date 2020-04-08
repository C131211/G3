<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/23
  Time: 23:35
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
    <meta name="author" content="RL"/>
    <!-- 作者 -->
    <meta name="revised" content=""/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="../../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../../framework/jquery.mousewheel.min.js"></script>
    <script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        .layui-form {
            margin-right: 30%;
        }
    </style>
</head>
<body>
<div class="cBody">
    <form id="detInOrder" action="">
        <div class="layui-row">
            <table class="layui-table printTable" id=""
                   data-options="toolbar:funListToolbar,url:'数据库入库单',fitColumns:true,singleSelect:true,pagination:true,collapsible:true, showFooter:false">
                <%--               <input type="hidden" name="ILID" value=${result.data.ILID}"/>--%>
                <tbody>
                <tr>
                    <td class="printName" colspan="7">入库单</td>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                        <span>订单状态：
                            <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILStatus" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                        <span> 单据日期：
                            <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILDate" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                        </span>
                        <span class="right">单据编号：
                            <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILID" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div></span>
                    </td>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                        <span>入库类型：采购入库</span>
                        <span class="right">入库库号：
                            <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="sID" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div></span>
                    </td>
                </tr>
                <tr>
                    <th data-options="field:gID" width="10%" class="textCenter">商品号</th>
                    <th data-options="field:gName" width="10%" class="textCenter">商品名称</th>
                    <th data-options="field:ILNum" width="10%" class="textCenter">入库数量</th>
                    <th data-options="field:ILprice" width="10%" class="textCenter">入库单价</th>
                    <th data-options="field:ILTotal" width="10%" class="textCenter">入库金额</th>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                    <span> 供货商：
                        <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILFrom" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                    </span>
                    </td>
                </tr>
                <td class="printOperator" colspan="7">
                    <span> 经手人：
                        <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILBy" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                    </span>
                    <span class="right">确认人：
                        <div class="layui-input-inline">
                             <input type="text" readonly="readonly" name="ILComfirm" value="${result.data.uAccount}"
                                    readonly="readonly" required lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                    </span>
                </td>
                </tr>
                </tbody>
            </table>
        </div>
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

</body>
</html>
