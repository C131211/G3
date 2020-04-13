<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
	<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
	<meta name="renderer" content="webkit">
	<!--国产浏览器高速模式-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="RL" />
	<!-- 作者 -->
	<meta name="revised" content=""/>
	<!-- 定义页面的最新版本 -->
	<meta name="description" content="网站简介" />
	<!-- 网站简介 -->
	<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
	<title>仓库管理系统</title>

	<!-- 公共样式 开始 -->
	<link rel="shortcut icon" href="images/favicon.ico"/>
	<link rel="bookmark" href="images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<script type="text/javascript" src="framework/jquery-1.11.3.min.js" ></script>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<!--[if lt IE 9]>
	<script src="framework/html5shiv.min.js"></script>
	<script src="framework/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="layui/layui.js"></script>
	<!-- 滚动条插件 -->
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
	<script src="framework/jquery-ui-1.10.4.min.js"></script>
	<script src="framework/jquery.mousewheel.min.js"></script>
	<script src="framework/jquery.mCustomScrollbar.min.js"></script>
	<script src="framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
	<!-- 公共样式 结束 -->

	<link rel="stylesheet" type="text/css" href="css/frameStyle.css">
	<script type="text/javascript" src="framework/frame.js" ></script>

	<script src="/js/checkLogin.js"></script>
	<script type="application/javascript">
		$(function(){
			//检查是否拥有标识
			checkLogin(${sessionScope.result.data.uID});
		})
	</script>

</head>

<body>
<!-- 左侧菜单 - 开始 -->
<div class="frameMenu">
	<div class="logo">
		<img src="images/logo.jpg" width="auto" height="70px"/>
		<div class="logoText">
			<h1>欢迎回来</h1>
			<p>Welcome back</p>
		</div>
	</div>
	<div class="menu">
		<ul>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('tgls/Fir.jsp',this)"><i class="iconfont icon-shouye left"></i>系统首页</i></a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('tgls/announce.jsp',this)"><i class="iconfont icon-tongzhi left"></i>发布通知</i></a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-yonghu left"></i>个人信息管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_perinfo.jsp',this)">个人信息</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_password.jsp',this)">密码修改</a></dt>
				</dl>
			</li>

			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-wodeyewuyuan left"></i>用户与角色管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/agent_list.jsp',this)">用户列表</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/role/role_list.jsp',this)">角色列表</a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-gongyingshang left"></i>经销和供应管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/buyer/buy_list.jsp',this)">经销商信息</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/supply/supply_list.jsp',this)">供应商信息</a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>权限与功能管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/pow/power_list.jsp',this)">权限列表</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/func/function_list.jsp',this)">功能列表</a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-yunying left"></i>仓库和商品管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/saveManage/save_list.jsp',this)">仓库信息</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/goodsManage/goods_list.jsp',this)">商品信息</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/goodlist/gl_list.jsp',this)">货物类别</i></a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-dingdan left"></i>订单管理<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/inorder_add.jsp',this)">新增入货单</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/outorder_add.jsp',this)">新增出货单</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/order_wait.jsp',this)">待处理货单</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/Outorder_detail.jsp',this)">出货单详细查询</i></a>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/outorder.jsp',this)">出货单统计</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/inorder.jsp',this)">入货单统计</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/base/maintain.jsp',this)">维护中页面</a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>报表模块<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/reportForm/reportForm1.jsp',this)">出货单统计报表</a></dt>
				</dl>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('tgls/qdAPI.jsp',this)"><i class="iconfont icon-zhishi left"></i>前端API</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('tgls/iconfont.html',this)"><i class="iconfont icon-huojian left"></i>iconfont字体库</a>
			</li>
			<li>
				<a class="menuFA" href="login.html"> <i class="iconfont icon-084tuichu left"></i>注销</i></a>
			</li>
		</ul>

	</div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main" >
	<!-- 核心区域 - 开始 -->
	<div class="frameMain" >
		<div class="title" id="frameMainTitle">
			<span><i class="iconfont icon-xianshiqi"></i>系统首页</span>
		</div>
		<div class="con">
			<iframe id="mainIframe" src="tgls/Fir.jsp" scrolling="no"></iframe>
		</div>
	</div>
	<!-- 核心区域 - 结束 -->
</div>
</body>

</html>