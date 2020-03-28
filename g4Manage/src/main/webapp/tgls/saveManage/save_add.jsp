<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/layui-v2.5.6/layui/css/layui.css">
    <%--引入layUI--%>
    <script type="text/javascript" src="/js/layui-v2.5.6/layui/layui.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form-label {
            width: 100px;
        }

        .layui-input-block {
            margin-left: 130px;
        }

        .layui-form {
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="addSave" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">仓库地址</label>
            <div class="layui-input-block">
                <input type="text" name="sAddr" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">仓库现容量</label>
            <div class="layui-input-block">
                <input type="text" name="sNsave" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">仓库总容量</label>
            <div class="layui-input-block">
                <input type="text" name="sTsave" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea name="sExplain" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="sStatus" value="0" title="启用" checked>
                <input type="radio" name="sStatus" value="1" title="禁用">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>


    <script>
        function addSave() {
            $.ajax({
                url: "/addUser",//仓库表添加数据接口
                type: "POST",
                dataType: "json",
                data: $('#addSave').serialize(),
                success: function (data) {
                    if (data.status == 200) {
                        //接收到成功的提示
                        alert("添加成功");
                        location.reload();
                    } else {
                        alert(data.msg);
                    }
                }

            })
        }

        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function (data) {
                //提交结果
                addSave();
                return false;
            });
        })
    </script>

</div>
</body>

</html>