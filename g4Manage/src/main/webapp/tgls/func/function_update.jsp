<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/26
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script src="/js/checkLogin.js"></script>
    <!-- 公共样式 结束 -->
</head>

<body>
<div class="cBody">
    <form id="updateFunction" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="fID" id="fID">
        <div class="layui-form-item">
            <label class="layui-form-label">功能名</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fName" id="fName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能地址</label>
            <div class="layui-input-inline shortInput">
                <input type="text" name="fUrl" id="fUrl"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能说明</label>
            <div class="layui-input-inline shortInput">
                <textarea type="text" name="fExplain" id="fExplain"
                       autocomplete="off" class="layui-textarea">
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">功能状态</label>
            <div class="layui-input-inline shortInput">
                <select name="fStatus" id="fStatus">
                    <option value="0">
                        启用
                    </option>
                    <option value="1">
                        禁用
                    </option>
                </select>
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
        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function (data) {
                console.log($('#updateFunction').serialize());
                $.ajax({
                    url: "/updateUser",
                    dataType: "json",
                    type: "POST",
                    data: $('#updateFunction').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            alert("更改成功");
                            window.location.reload();
                        } else {
                            layer.msg("更改失败");
                        }

                    }
                });
                return false;
            });
        });
    </script>

    <script type="application/javascript">
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.fID});
            //请求该id的用户数据
            $.ajax({
                url: "/selUserById",  //地址
                dataType: "json",
                type: "POST",
                data: {rID:"${requestScope.fID}"},
                success: function (data) {
                    if (data.status == 200) {
                        $("#fID").val(data.data.fID);
                        $("#fName").val(data.data.fName);
                        $("#fExplain").val(data.data.fExplain);
                        $("#fStatus").val(data.data.fStatus);
                    } else {
                        layer.msg("获取失败");
                    }

                }
            });

        })
    </script>


</div>
</body>

</html>
