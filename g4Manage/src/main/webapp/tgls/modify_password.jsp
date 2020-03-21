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
		<!-- 公共样式 结束 -->

	</head>

	<body>
		<div class="cBody">
			<form id="editForm" class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">原始密码</label>
					<div class="layui-input-inline shortInput">
						<input type="text" value="${result.data.uPwd}" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline shortInput">
						<input id="uPwd" type="password" name="uPwd" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
					<img id="pass_new" src="../images/invisible.png" onclick="hideShowPsw2()" style="display: inline-block;width: 35px;height: 35px;vertical-align: middle">
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认新密码</label>
					<div class="layui-input-inline shortInput">
						<input id="comPwd" type="password"  required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
					<img id="pass_com" src="../images/invisible.png" onclick="hideShowPsw3()" style="display: inline-block;width: 35px;height: 35px;vertical-align: middle">
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
						//提交结果
						checkSame();
						return false;
					});
				});
				//密码显示操作
				var passImg2 = document.getElementById("pass_new");
				var passImg3= document.getElementById("pass_com");
				var passInput2 = document.getElementById("newPwd");
				var passInput3 = document.getElementById("comfirmPwd");
				function hideShowPsw2(){
					if (passInput2.type == "password") {
						passInput2.type = "text";
						passImg2.src = "../images/visible.png";
					}else {
						passInput2.type = "password";
						passImg2.src = "../images/invisible.png";
					}
				}
				function hideShowPsw3(){
					if (passInput3.type == "password") {
						passInput3.type = "text";
						passImg3.src = "../images/visible.png";
					}else {
						passInput3.type = "password";
						passImg3.src = "../images/invisible.png";
					}
				}
			//检查提交
				function checkSame(){
					var Pwd = $("#uPwd").val();
					//判断是否有更改过内容
					if(Pwd == "${result.data.uPwd}"){
						alert("未做任何修改");
						return false;
					}

						//提交并查看结果
						$.ajax({
							url: "/userEdit",
							type: "POST",
							dataType: "json",
							data: $('#editForm').serialize(),
							success: function (data) {
								if (data.status == 200) {
									//接收到成功的提示
									alert("修改成功");
									window.location.href = "modify_password";
								} else {
									alert(data.msg);
									window.location.href = "modify_password";
								}
							}

						})
				}
			</script>

		</div>
	</body>

</html>