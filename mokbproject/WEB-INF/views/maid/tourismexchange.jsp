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
		<title>旅游积分兑换</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		
		<style type="text/css">
			input[type=text], input[type=number],select{line-height: 1.5;width: 100%; height: 40px; margin-bottom: 0px; padding: 5px 10px;-webkit-user-select: text;border: none;border-radius:none !important;outline: 0;background-color: #F0F2F1;-webkit-appearance: none;}
			.tourismexchange-box{position: relative;clear: all;overflow: hidden;width: 80%;left: 10%;text-align: center;}
			.newaddress-single{position: relative;clear: all;overflow: hidden;border-radius: 5px;width: 80%;background: #F0F2F1;display: block;left: 10%;line-height: 1.5;margin-top: 10px;}
			.newaddress-left{position: relative;clear: all;overflow: hidden;width: 20%;float: left;height: 40px;padding: 5px;}
			.newaddress-left i{vertical-align: middle;}
			.newaddress-right{position: relative;clear: all;overflow: hidden;width: 80%;float: left;}
			.newaddress-right select{width: 33%;float: left;}
			/*提交数据*/
			.tourismsocre-btn-box{margin-top: 50px;text-align: center;margin-bottom: 50px;}
			input[type=button]{background: #62bca3;color: white;border: none;}
		</style>
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
				
			</div>
			
			<div class="mdfd-content">
				<div class="tourismexchange-box">
					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-person shade"></i>
						</div>
						<div class="newaddress-right">
							<input type="text" id="name" placeholder="请输入姓名" />
						</div>
					</div>

					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-sex shade"></i>
						</div>
						<div class="newaddress-right">
							<input type="text" id="sex" placeholder="请输入性别" />
						</div>
					</div>

					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-shouji shade"></i>
						</div>
						<div class="newaddress-right">
							<input type="number" id="tel" placeholder="请输入电话" />
						</div>
					</div>
				</div>

				<!--提交按钮-->
				<div class="tourismsocre-btn-box">
					<input type="button" value="兑换"/>
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				
				// 获取输入框信息事件
				$('.tourismsocre-btn-box').on('tap','input[type=button]',function(){
					var name = doc.getElementById('name').value;
					var sex = doc.getElementById('sex').value;
					var tel = doc.getElementById('tel').value;
					alert("name:"+name+"sex:"+sex+"tel:"+tel);
				});
	
			})(mui,document);
		</script>
	</body>

</html>