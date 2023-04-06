<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
   <meta charset="UTF-8">
		<title>卡巴公益</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/fund.css"/>
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css" />
		<script src="js/pop/custom-pop.js"></script>
		
	</head>
		
	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left" onclick="toBack();">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-right">
					<span class="iconfont icon-tishishuoming float-r"></span>
				</div>
			</div>
	
			<!-- 公益头部 -->
			<div class="fund-box">
				<img src="file/jointly/images/icon/icon-fund-logo.png"/>
				<div class="fund-money-box">
					<span class="fund-money-tip">摩尔卡巴公益基金可使用金额:</span>
					<div class="fund-money">
						<span id="money">--</span>
					</div>
				</div>
				<div class="fund-tip">
					热心公益，让世界更加和谐和美好
				</div>
			</div>
			
			<!--列表-->
			<div class="fun-list" id="jijin"></div>
		</div>
		
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//返回上级
			function toBack(){
				window.location="<%=basePath%>HomeController/home";
			}
			
			// 动态加载
			$(function(){
				
				// 获取基金总额
        		var news_type=3;
         		var paramData={news_type:news_type};                               
	      		var object = JSON.stringify(paramData);
	      		ajaxPost("<%=basePath%>weixin_news/findNews",object,"json","json",getFundMoney);
			
        		// 基金明细
        		var news_type1=5;
         		var paramData1={news_type:news_type1};                               
	      		var object1 = JSON.stringify(paramData1);
	      		ajaxPost("<%=basePath%>weixin_news/findNews",object1,"json","json",getFundDetail);
       		});
       		
       		// 简介点击事件
			mui('.search-right').on('tap', '.iconfont', function() {
				var paramData={protocol_id:3};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_protocol/findProtocolById",object,"json","json",showFundProtocol);
			});
       		
       		
       		function showFundProtocol(data){
       			if(data.state == 0){
       				var fundPtotocolData = data.protocolEntityData.protocolEntity;
       				var popInfo = {
						title: fundPtotocolData.protocol_title,
						content: fundPtotocolData.protocol_content
					};
					popShowAndHidden(popInfo);
       			}else{
       				mui.alert('获取数据异常,请稍后重试...');
       			}
       		}
       		//获取url中的参数
       		function getUrlParam(name) {
	            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	            if (r != null) return unescape(r[2]); return null; //返回参数值
	        }
			
			// 基金总额数据处理
			function getFundMoney(data){
           		var listGoods=data.newsDate.listNews;
           		document.getElementById('money').innerHTML = listGoods[0].fund_money.toFixed(2);
			}
			
			// 基金明细数据处理
			function getFundDetail(data){
   				var Ahtml="";
           		var listGoods=data.newsDate.listNews;
           		if(listGoods.length != 0){
           			for(var i=0;i<listGoods.length;i++){
		           		var pictures=listGoods[i]["news_picture"];
						pictures=pictures.split(";");
						var picture1=pictures[0];
	          			//下面有个一数组图片listGoods[i]["store_picture"].split(";")[0]
	          			Ahtml += '<div class="default-text-color list-box" onclick=javascript:{window.location="HomeController/fund_detail?news_id=' + listGoods[i]["news_id"] + '"}>'+
								 '	<h4>' + listGoods[i]["news_title"] + '</h4>'+
								 '	<img src="file/news/img/' + picture1 + '" onerror="javascript:this.src=\'http://via.placeholder.com/360X150\'"/>'+
								 '	<div class="position-relative intro-box">'+
								 '		<label class="intro-data">' + timestampToTime(listGoods[i]["update_date"]) + '</label>'+
								 '		<label class="intro-options">'+
								 '			<span class="intro"><i class="iconfont shade icon-yueduliang"></i>&nbsp;&nbsp;<span>' + listGoods[i]["read_num"] + '</span></span>'+
								 '			<span class="intro"><i class="iconfont shade icon-zan"></i>&nbsp;&nbsp;<span>' + listGoods[i]["thumbs_up"] + '</span></span>'+
								 '		</label>'+
								 '	</div>'+
								 '</div>';
	           		}
	           		$("#jijin").append(Ahtml);
           		}else{
           			mui.toast('暂无数据');
           			return;
           		}
			}
		</script>
	</body>

</html>
