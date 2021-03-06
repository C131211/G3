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
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
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

<body class="cBody">
<div>
    <form id="addSave" class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-form-item">
                <label class="layui-form-label">仓库名称</label>
                <div class="layui-input-block">
                    <input type="text" name="sName" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <label class="layui-form-label">仓库地址</label>
            <div class="layui-input-block">
                <input type="text" name="sAddr" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <input type="hidden" name="sNsave" class="layui-input" value="0">
        <div class="layui-form-item">
            <label class="layui-form-label">仓库存量上限</label>
            <div class="layui-input-block">
                <input type="text" name="sTsave" required lay-verify="required|number" autocomplete="off" class="layui-input">
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
                <input type="radio" name="sStatus" value="0" title="正常" checked>
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
                    url: "/addSave",//添加用户
                    type: "POST",
                    dataType: "json",
                    data: $('#addSave').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            //接收到成功的提示
                            layer.msg("添加成功");
                            window.setTimeout('parent.layer.closeAll()',500);
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