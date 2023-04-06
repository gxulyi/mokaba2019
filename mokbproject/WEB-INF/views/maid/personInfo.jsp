<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    	<meta charset="UTF-8">
		<title>个人信息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<style type="text/css">
			/*自定义TableView*/
			.mui-table-view{background-color: #fff !important;border: none;}
			/*自定义tableview样式*/
			.mui-content > .mui-table-view:first-child {margin-top: 0px !important;}
			/*自定义cell样式*/
			.custom-table-view-cell{border-bottom: 1px solid #f0f0f0;padding: 11px 15px;position: relative;color: #46385A;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #46385A;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: #f0f0f0 !important;}
			.mui-table-view::after{background-color: #f0f0f0 !important;}
		</style>
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div class="mdfd-content">
				
				<ul class="mui-table-view">
		            <li class="custom-table-view-cell" style="display: none;">
		                <a class="mui-navigate-right">
		              		个人资料
		                </a>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <a class="mui-navigate-right">
		              		身份证信息
		                </a>
		            </li>
		            <li class="custom-table-view-cell">
		                <a class="mui-navigate-right">
		              		我的银行卡
		                </a>
		            </li>
		        </ul>
				
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				// 列表点击事件
				var cells = $('.custom-table-view-cell');
				cells.each(function(i,btn){
					btn.addEventListener('tap',function(){
						switch (i){
							case 0:
								var page_url = './maid/personData';
								window.location.href = page_url;
								break;
							case 1:
								var page_url = './maid/personIdentityCard';
								window.location.href = page_url;
								break;
							case 2:
								var page_url = './maid/personBankCard';
								window.location.href = page_url;
								break;
						}
					},false);
				});
			})(mui,document);
		</script>
	</body>

</html>