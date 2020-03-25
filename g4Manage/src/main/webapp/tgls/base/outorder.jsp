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
		<meta name="revised" content="" />
		<!-- 定义页面的最新版本 -->
		<meta name="description" content="网站简介" />
		<!-- 网站简介 -->
		<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
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
		<script src="../../framework/cframe.js"></script>
		<!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->

		<script src="../../js/out_intoData.js"></script>

	</head>

	<body>
		<div class="cBody">
			<div class="layui-tab" lay-filter="myPage">
				<ul class="layui-tab-title">
					<li class="layui-this" lay-id="historyList">历史列表</li>
					<li lay-id="todayList">今日列表</li>
				</ul>
				<table class="layui-hide" id="outList"></table>

		</div>
		</div>
	</body>
	<script>
		layui.use('element', function() {
			var element = layui.element;

			//获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
			var layid = location.hash.replace(/^#test1=/, '');
			element.tabChange('myPage', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

			//监听Tab切换，以改变地址hash值
			element.on('tab(myPage)', function() {
				location.hash = 'test1=' + this.getAttribute('lay-id');
				console.log(this.getAttribute('lay-id'));
			});
		});

		//初始化表格
		layui.use('table', function () {
			var table = layui.table;
			table.render({
				elem: '#outList'   //表格ID
				, url: '/userList' //数据接口
				, cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
				, page: true     //开启分页
				, cols: [[

					, {field: 'OLID', title: '出货单号', width: 80,}
					, {field: 'OLDate', title: '出货日期', width: 80}
					, {field: 'sID', title: '出货仓库', width: 80}
					, {field: 'gInprice', title: '入货价', width: 80}
					, {field: 'gOutprice', title: '市场价', width: 80}
					, {field: 'gExplain', title: '商品说明', width: 300}
					, {field: 'gSatime', title: '存放时间', width: 90}
					, {field: 'sID', title: '存放仓库', width: 90}
					, {field: 'gStatus', title: '商品状态', width: 90}
				]]
			});
		});
	</script>
</html>