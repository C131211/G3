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
    <p style="text-align: center;font-size: xx-large;">出库单</p>
    <div style=" position: relative;float:left;display: inline-block">
        <div class="layui-form-item">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>
                        <p style="display: inline-block;float: left;text-align: center;font-size: x-large">出库单信息</p>
                    </th>
                    <th><label class="layui-form-label" style="text-align: center ">供货商</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uAccount" required lay-verify="required|identity"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th><label class="layui-form-label" style="text-align: center ">请填写单号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uAccount" required lay-verify="required|identity"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th><label class="layui-form-label" style="text-align: center ">请填写仓库</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uAccount" required lay-verify="required|identity"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th>
                        <label class="layui-form-label" style="text-align: center ;; ">表单操作</label>
                        <div style="display: inline-block;font-size: xx-large">
                            <button class="layui-btn layui-btn-xs">新增一行</button>
                            <button class="layui-btn layui-btn-xs">提交表单</button>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th width="7%" class="textCenter">货物号</th>
                    <th width="7%">商品名称</th>
                    <th width="7%" class="textCenter">出库数量</th>
                    <th width="7%" class="textCenter">出库单价</th>
                    <th width="7%" class="textCenter">出库总金额</th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                <tr>
                    <th>
                        <select name="rID" id="rID" style="width: auto;height:auto">
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

                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required|identity"
                               autocomplete="off" width="auto"></th>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
