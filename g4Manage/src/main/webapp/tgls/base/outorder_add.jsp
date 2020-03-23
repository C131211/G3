<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:07
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
    <div class="addOutOrder">
        <div class="layui-row">
            <label class="layui-form-label" style="text-align: center ; ">表单操作</label>
            <div style="display: inline-block;font-size: xx-large">
                <button class="layui-btn layui-btn-xs">新增一行</button>
                <button class="layui-btn layui-btn-xs">提交表单</button>
            </div>
            <table class="layui-table printTable id="
                   data-options="toolbar:funListToolbar,url:'数据库用户表',fitColumns:true,singleSelect:true,pagination:true,collapsible:true, showFooter:false">
                <tbody>
                <tr>
                    <td class="printName" colspan="7">出库单</td>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                        <span>单据日期：<div class="layui-input-inline">
                            <input type="text" name="OLDate" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div></span>
                        <span class="right">单据编号:
                            <div class="layui-input-inline">
                            <input type="text" name="OLID" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div></span>
                        <span>入库类型：送货出库</span>
                    </td>
                </tr>
                <tr>
                    <th width="8%" class="textCenter">出库信息
                    </th>
                    <th width="10%" class="textCenter">出库库号
                        <div class="layui-input-inline">
                            <input type="text" name="sID" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">经手人
                        <div class="layui-input-inline">
                            <input type="text" name="OLBy" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">确认人
                        <div class="layui-input-inline">
                            <input type="text" name="OLFrom" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">收货人
                        <div class="layui-input-inline">
                            <input type="text" name="OLDestin" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                </tr>
                <tr>
                    <th width="8%" class="textCenter" data-options="field:uID">货物号</th>
                    <th width="10%" class="textCenter">商品名称</th>
                    <th width="10%" class="textCenter">出库数量</th>
                    <th width="10%" class="textCenter">出库单价</th>
                    <th width="10%" class="textCenter">出库总金额</th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID">
                            <option value="0">
                            </option>
                            <option value="1">
                                超级管理员
                            </option>
                            <option value="2">
                                仓管员
                            </option>
                            <option value="3">
                                运输员
                            </option>
                        </select><span id="roleSpan"></span>
                    </th>
                    <th>
                        //返回商品名称
                    </th>
                    <th><input class="layui-input" type="text" name="OLNum" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="OLprice" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="OLTotal" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
