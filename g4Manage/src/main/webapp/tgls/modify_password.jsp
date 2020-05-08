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
    <meta name="author" content=""/>
    <!-- 作者 -->
    <meta name="revised" content=""/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
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
    <!-- 公共样式 结束 -->
    <%--引入js--%>
    <script src="/js/checkLogin.js"></script>

</head>

<body>
<div class="cBody">
    <form id="editForm" class="layui-form" action="">
        <input type="hidden" name="uID" value="${result.data.uID}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">原始密码</label>
            <div class="layui-input-inline shortInput">
                <input id="oldPwd" type="text" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline shortInput">
                <input id="uPwd" type="password" name="uPwd" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
            <img id="pass_new" src="../images/invisible.png" onclick="hideShowPsw2()"
                 style="display: inline-block;width: 35px;height: 35px;vertical-align: middle">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认新密码</label>
            <div class="layui-input-inline shortInput">
                <input id="comPwd" type="password" required lay-verify="required" autocomplete="off"
                       class="layui-input" onkeyup="validate()">
                <span id="comSpan"></span>
            </div>
            <img id="pass_com" src="../images/invisible.png" onclick="hideShowPsw3()"
                 style="display: inline-block;width: 35px;height: 35px;vertical-align: middle">
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
                //提交结果
                checkSame();
                return false;
            });
        });
        //密码显示操作
        var passImg2 = document.getElementById("pass_new");
        var passImg3 = document.getElementById("pass_com");
        var passInput2 = document.getElementById("uPwd");
        var passInput3 = document.getElementById("comPwd");

        function hideShowPsw2() {
            if (passInput2.type == "password") {
                passInput2.type = "text";
                passImg2.src = "../images/visible.png";
            } else {
                passInput2.type = "password";
                passImg2.src = "../images/invisible.png";
            }
        }

        function hideShowPsw3() {
            if (passInput3.type == "password") {
                passInput3.type = "text";
                passImg3.src = "../images/visible.png";
            } else {
                passInput3.type = "password";
                passImg3.src = "../images/invisible.png";
            }
        }

        //检查提交
        function checkSame() {
            //旧密码
            var uPwdOld = $("#oldPwd").val();
            //新密码
            var uPwd = $("#uPwd").val();
            //密码验证
            var uPwdCom = $("#comPwd").val();
            //检验输入旧密码
            if (uPwdOld == "${result.data.uPwd}") {
                //原密码通过
                //验证密码是否为空
                // if(uPwd==null || uPwd==""){
                //     //密码为空，做响应
                //     return  false;
                // }else {
                //验证新旧密码是否有更改
                if (uPwd == "${result.data.uPwd}") {
                    $("#comSpan").html("密码没有变更");
                    $("#comSpan").css("color", "red")
                    //无更新过旧密码
                    return false;
                } else {
                    //验证新密码验证是否一致
                    if (uPwd == uPwdCom) {
                        //通过 提交数据
                        //提交并查看结果
                        $.ajax({
                            url: "/updateUser",
                            type: "POST",
                            dataType: "json",
                            data: $('#editForm').serialize(),
                            success: function (data) {
                                if (data.status == 200) {
                                    //接收到成功的提示
                                    alert("修改成功");
                                    top.location.href = "/index.jsp"
                                } else {
                                    alert(data.msg);
                                }
                            }

                        })
                    } else {
                        //不一致，提醒 拦截
                        $("#comSpan").html("两次密码不相同");
                        $("#comSpan").css("color", "red");
                        return false;
                    }
                }
            } else {
                $("#comSpan").html("原密码错误");
                $("#comSpan").css("color", "red");
                return false;
            }
        }

    </script>
    <script type="application/javascript">
        $(function () {
            //检查是否拥有标识
            checkLogin(${sessionScope.result.data.uID});
        })
    </script>
</div>
</body>

</html>