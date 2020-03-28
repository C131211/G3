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
    <form id="addGood" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="gName" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input type="text" name="gNum" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">进货价</label>
            <div class="layui-input-block">
                <input type="text" name="gInprice" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出货价</label>
            <div class="layui-input-block">
                <input type="text" name="gOutprice" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div c lass="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea name="gExplain" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">存放时间</label>
            <div class="layui-input-block">
                <input type="date" name="gSatime" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">存放仓库</label>
            <div class="layui-input-block">
                <input type="text" name="sID" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="gStatus" value="0" title="正常">
                <input type="radio" name="gStatus" value="1" title="缺货" checked>
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
        layui.use(['upload', 'form'], function () {
            var form = layui.form;
            //监听提交
            form.on('submit(submitBut)', function (data) {
                $.ajax({
                    url: "/updateUser", //添加商品
                    type: "POST",
                    dataType: "json",
                    data: $('#addGood').serialize(),
                    success: function (data) {
                        if (data.status == 200) {
                            //接收到成功的提示
                            alert("修改成功");
                            location.reload();
                        } else {
                            alert(data.msg);
                        }
                    }

                });
                return false;
            })
        })
    </script>

</div>
</body>

</html>