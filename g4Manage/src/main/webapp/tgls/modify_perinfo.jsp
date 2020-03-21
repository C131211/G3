<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="" />
    <!-- 作者 -->
    <meta name="revised" content="" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <script src="/js/checkLogin.js"></script>
    <!-- 公共样式 结束 -->

</head>

<body>
<div class="cBody">
    <form id="addForm" class="layui-form" >
        <input type="hidden" name="uID" value="${result.data.uID}"/>
        <div class="layui-form-item">
        <label class="layui-form-label">头像</label>
        <img value="${result.data.uPhoto}" width="200" height="200" )/>
            <button style="margin-left: 10px;" class="layui-btn layui-btn-primary">选择图片</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工号(登录名)</label>
            <div class="layui-input-inline shortInput">
                <input type="text" readonly="readonly" name="uAccount" value="${result.data.uAccount}"  readonly="readonly" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uName"  value="${result.data.uName}" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uTel" value="${result.data.uTel}"required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">住址</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="uAddr"  value="${result.data.uAddr}" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-inline shortInput">
                <input type="text"  readonly="readonly" value="<fmt:formatDate value="${result.data.uHiredate}" pattern="yyyy年MM月dd日HH点mm分ss秒" />"  required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">确认修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <script>
        layui.use('form', function() {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function(data) {
                $.ajax({
                    url :"/updateUser",
                    dataType :"json",
                    type : "POST",
                    data :  $('#addForm').serialize(),
                    success:function(data){
                        if(data.status==200){
                            alert("更改成功");
                            window.location.reload();
                        }else{
                            layer.msg("更改失败");
                        }

                    }
                });
                return false;
            });
        });
    </script>

    <script type="application/javascript">
        $(function(){
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
        })
    </script>



</div>
</body>

</html>
