<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <title>健康咨询</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
	<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/mui.min.js"></script>
    <style>
    	*{margin:0;padding:0;}
    	ul{
    		list-style: none;
    	}
    	.content_div{
    		background: #fff;
    	}
    	.content_div_tit{
    		width:100%;height:30px;background: #62bca3;padding:10px 0;
    	}
    	.title_div{
    	 width:90%;height: 30px;font-size: 16px;float: right;
    	}
    	.title_div_li{
    		width:33%;line-height: 30px;float: left;color:#fff;text-align: center;
    	}
    	.center_div{
    		width:100%;height: 50px;margin:0 auto;
    	}
    	.center_div_img{
    		width:50px;height: 50px;border-radius:100%;background: #ccc;float: left;overflow: hidden;
    	}
    	.center_div_img img{
    		width:100%;height: 100%;	
    	}
    	.center_div_name{
    		float: left;line-height: 22px;margin-left:10px;
    	}
    	.center_div_allbtn{
    		position: fixed;bottom: 50px;right: 0;
    	}
    	.center_div_btn{
    		width:100px;height: auto;
    	}
    	.center_div_btn img{
    		width:100%;height: 100%;
    	}
    	.center_div_zjjs{
    		width:100%;height: auto;margin:0 auto;padding:10px 0;
    	}
    	.center_div_nr{
    		background: #f0f0f0;border-radius:5px;padding:0 0 10px 0;
    	}
    	.center_div_nr span{
    		font-size: 13px;color:#333;
    	}
    	.demo{
    		font-size: 13px;color:#666;margin-top:10px;line-height: 22px;padding:0 10px;
    	}
    	.center_div_nr_djzk{
    		font-size: 11px;color:#666;text-align: center;line-height: 30px;
    	}
    	/* 弹窗 */
		.bgdiv{
			width: 100%;
			height: 100%;
			background: rgba(240,240,240,0.6);
			position: fixed;	
			top: 0;
			left: 0;
			display: none;
		}
		.box{
			width: 100%;
			height: 210px;
			background: #FFFFFF;
			position: fixed;
		    left: 50%;
		    top: 50%;
		    transform: translate(-50%,-50%);
			z-index: 1;
			display: none;
			text-align: center;
			border-radius: 5px;
		}
		.guanbie{
			width: 15px;
			height: 15px;
			position: absolute;
			right: 10px;
			top:10px;
			cursor: pointer;
		}
		.box_tit{
			padding: 15px 0 10px 0;text-align: center;border-bottom:1px solid #f0f0f0;
		}
		.box_tit_nr{
			width:90%;height: 100px;background: #f5f5f5;border-radius: 5px;margin: 0 auto;margin-top:10px;
		}
		.box_tit_nr textarea {
			width:96%;height: 88%;background: none;border:none;padding:2%;outline: none;font-size: 13px;color: #999;resize:none;
		}
		.box_btn{
			width:60px;height: 30px;background: #62bca3;color: #fff;text-align: center;line-height: 30px;margin:10px auto;border-radius: 5px;
		}
		.center_div_nr_zj{
			width:100%;line-height: 30px;padding:0 10px;
		}
		.center_div_nr_zj span{
			color:#62bca3;font-size: 15px;border-bottom:2px solid #333;padding-bottom:3px;
		}
		.center_div_wt{
			font-size: 14px;color:#333;margin-top:10px;
		}
		.center_div_time{color:#999;font-size: 12px;padding-bottom: 10px;}
		.shaixuan_div{
			width:100%;height: 100%;background: #fff;position: fixed;top: 0;left: 0;display: none;z-index: 999;
		}
		.shaixuan_div_input{
			width:80%;height: 50px;line-height: 50px;margin: 0 auto;position: relative;
		}
		.shaixuan_div_input input{
			width:80%;height:25px;border-radius:20px;border:none;padding:2px 35px 2px 10px;background: #f5f5f5;
			color:#999;font-size: 13px;
		}
    </style>
    <script type="text/javascript">
	    function qk(object){
	    	object.innerHTML="";
	    }
	    function fz(object){
	    	object.innerHTML="请输入咨询问题......";
	    }
    </script>
</head>
<body>
	<div class="content_div">
		<div class="content_div_tit">
			<div class="search-left" style="line-height: 30px;" onclick="javascript:{window.location='HomeController/maid';}">
				<i class="iconfont icon-left"></i>
			</div>
			<div class="title_div">
				<div class="title_div_li" onclick="healthAssistant();">
					<span style="font-size: 18px;border-bottom:2px solid #fff;padding-bottom:3px;">健康咨询</span>
				</div>
				<div class="title_div_li" style="border-left:1px solid #fff;" onclick="healthAata();">
					<span>健康数据</span>
				</div>
				<div class="title_div_li" style="border-left:1px solid #fff;" onclick="javascript:{window.location='maid/suggest';}">
					<span>意见反馈</span>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		
		<div id="question_answer">
		<!-- 
		<div style="width:90%;margin:0 auto;margin-top:20px;">
			<div class="center_div">
				<div class="center_div_img">
					<img alt="" src="" id="weixin_portrait">

				</div>
				<div class="center_div_name">
					<p style="font-size: 14px;color: #333333;" id="user_name">用户2355</p>
					<p style="font-size: 12px;color: #666666;" id="add_date">2018-8-2</p>
				</div>
			</div>
			<div class="center_div_wt" id="user_message">咖啡馆和思考过打款发货了空间哈风凉话快递费啦胜多负少的胜多负少</div>
			<div class="center_div_zjjs">
				<div class="center_div_nr">
					<div class="center_div_nr_zj">
						<span>健康助理答复</span>
					</div>
					<p class='demo'>
						16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校。
					</p>
				</div>
			</div>
			<p class="center_div_time">
				<label class="intro-data" id="update_date">2018-06-30</label>
				<label style="float: right;">
					<span class="intro"><i class="iconfont shade icon-zan" style="color:#999;font-size: 14px;"></i>&nbsp;&nbsp;<span>0</span></span>
				</label>
			</p>
		</div>
		
		<div style="height: 5px;background: #f5f5f5;"></div>
		-->
		</div>
		 
	</div>
	<div class="box">
		<p class="box_tit">发起提问</p>
		<div class="box_tit_nr">
		    <textarea onfocus="qk(this)" onblur="fz(this)" rows="" cols="" id="textArea" >请输入咨询问题......</textarea>
		</div>
		<input id='expert_id' type="hidden"/>
		<div class="box_btn" onclick="tijiao();">提交</div>
		<img class="guanbie" src="images/gbss.png" />
	</div>
	<div class="bgdiv"></div>
	<div class="shaixuan_div">
		<div class="search-left" style="line-height: 50px;" id="closes">
				<i class="iconfont icon-left" style="color:#999;font-size: 16px;"></i>
			</div>
		<div class="shaixuan_div_input">
			<i class="iconfont icon-sousuo sechers" style="color:#999;position: absolute;top:0;right:25px;z-index:5;font-size: 14px;"></i>
			<input onchange="findMessage(this.value);" value="请输入关键字" type="text" onfocus="if (value =='请输入关键字'){value ='';}" onblur="if (value ==''){value='请输入关键字';}" />
<!-- 			<a id="icon-close" style="color:#999;position: absolute;top:2px;right:5px;z-index:5;"> -->
<!-- 				<span class="mui-icon mui-icon-close" style="font-size: 18px;"></span> -->
<!-- 			</a> -->
		</div>
	
	</div>
	
	
	<div class="center_div_allbtn">
		<div class="center_div_btn" style="margin-bottom: -30px;" onclick="shaixuan()">
			<img src="images/saixuan.png" />
		</div>
		<div class="center_div_btn" onclick="tc()">
			<img src="images/tiwen.png" />
		</div>
	</div>
	<script type="text/javascript">
	function findMessage(user_message){
		if(user_message==null||user_message==""||user_message=="null"){
			alert("请输入关键字");
			return;
		}
		$(".shaixuan_div").hide();
		var paramData={user_message:user_message};                               
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>weixin_expertConsult/findAllExpertConsult",object,"json","json",showQuestion);
	}
	
	function tijiao(){
		var user_message = document.getElementById("textArea").value;
		if(user_message==null||user_message==""||user_message=="请输入咨询问题......"){
			alert("请输入需要咨询的问题!");
			return;
		}
		var paramData={user_message:user_message,thumbs_up:1};                               
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>weixin_expertConsult/addExpertConsult",object,"json","json",ifAdd);
	}
	function ifAdd(data){
		if(data.state==0){
			alert("提问成功,请耐心等待专家回答!");
			$(".bgdiv,.box").hide();
		}else{
			alert("服务器繁忙,请稍后再试!");
			$(".bgdiv,.box").hide();
		}
	}
	
	function showQuestion(data){
		var object=data.object;
		var str="";
		if(object.length==0){
			alert("没有相关问题!");
			return;
		}
		for(var i=0;i<object.length;i++){
			var zan="zan";
			var zann=zan+i+"a";
			str+="<div style='width:90%;margin:0 auto;margin-top:20px;'>"+
			"<div class='center_div'>"+
				"<div class='center_div_img'>"+
					"<img alt='' src='"+object[i].weixin_portrait+"'>"+
				"</div>"+
				"<div class='center_div_name'>"+
					"<p style='font-size: 14px;color: #333333;' id='user_name'>"+object[i].weixin_nickname+"</p>"+
					"<p style='font-size: 12px;color: #666666;' id='add_date' >"+formatDateTimeStr(object[i].add_date)+"</p>"+
				"</div>"+
			"</div>"+
			"<div class='center_div_wt' id='user_message'>"+object[i].user_message+"</div>"+
			"<div class='center_div_zjjs'>"+
				"<div class='center_div_nr'>"+
					"<div class='center_div_nr_zj'>"+
						"<span>健康助理答复</span>"+
					"</div>"+
					"<div class='demo'>"+object[i].expert_message+"</div>"+
				"</div>"+
			"</div>"+
			"<p class='center_div_time'>"+
				"<label class='intro-data' id='update_date'>"+formatDateTimeStr(object[i].update_date)+"</label>"+
				"<label style='float: right;'>"+
					"<i onclick='thumbs_up("+object[i].consult_id+","+i+","+object[i].thumbs_up+")' class='iconfont shade icon-zan' style='color:#999;font-size: 14px;' ></i>&nbsp;&nbsp;<span id='zan"+i+"a'>"+object[i].thumbs_up+"</span>"+
				"</label>"+
			"</p>"+
		"</div>";// "+object[i].consult_id+",'zan_"+i+"'     document.getElementById("zannn").value
		if(i==object.length-1){
		//最后一行不需要下框
		str+="</div>";
		}else{
			str+="<div style='height: 5px;background: #f5f5f5;'></div>";
		}
		//str+="</div>";
		}
		document.getElementById("question_answer").innerHTML=str;
	}
	
	
	//获取url中的参数
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if(r != null) return unescape(r[2]);
		return null; //返回参数值
	}

	var consult_id = getUrlParam("consult_id");

	//在数组中查找所有出现的x，并返回一个包含匹配索引的数组
	function findall(a, x) {
		var results = [],
		len = a.length,
		pos = 0;
		while(pos < len) {
			pos = a.indexOf(x, pos);
			if(pos === -1) { //未找到就退出循环完成搜索
				break;
			}
			results.push(pos); //找到就存储索引
			pos += 1; //并从下个位置开始搜索
		}
		return results;
	}

	//点赞事件
	function thumbs_up(consult_id,zan,thumbs_up) {
	var jsonConsult11 = $.cookie('jsonConsult');
	var doczan="zan"+zan+"a";
	if(jsonConsult11 == null) {
		var jsonConsult = {
			"jsonConsult1": [],
			"jsonConsult2": [],
			"jsonConsult3": []
		};
		$.cookie('jsonConsult', JSON.stringify(jsonConsult), {
			expires: 10,
			path: "/"
			}); //过期时间7天
		}
	var jsonread = $.cookie('jsonConsult');
	var jsonjsonConsult = JSON.parse(jsonread); //转对象
	var index = findall(jsonjsonConsult.jsonConsult1, parseInt(consult_id));
	if(index.length > 0) {
		alert("你已经点赞了哦");
	} else {
	
		function thumbsUp(data) {
			if(data.state == 0) {
				var zainum = parseInt(thumbs_up) + 1;
				document.getElementById(doczan).innerHTML=zainum;
				jsonjsonConsult.jsonConsult1.push(parseInt(consult_id));
				$.cookie('jsonConsult', JSON.stringify(jsonjsonConsult), {
					expires: 7,
					path: "/"
				}); //过期时间7天
			}
		}
		var paramData;
		var paramData={consult_id:consult_id,thumbs_up:1};                               
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>weixin_expertConsult/thumbs_up",object,"json","json",thumbsUp);
	}
}
	
	
	

	
	function onloadd(){
		var paramData;
		var paramData={1:1};                               
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>weixin_expertConsult/findAllExpertConsult",object,"json","json",showQuestion);
	};
	window.onload=function(){
		onloadd();
	};
	</script>
	<script type="text/javascript">
		
		$(function() {
			$(".guanbie").click(function() {
				$(".bgdiv,.box").hide();
				$(document).unbind("scroll");
			});
			$("#closes").click(function() {
				$(".shaixuan_div").hide();
				$(document).unbind("scroll");
			});
			
		});
		function tc(expert_id){
			$(".bgdiv,.box").fadeIn();
			var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动  
			$(document).bind("scroll",function (){$(document).scrollTop(tops); });
			document.getElementById("expert_id").value=expert_id;
		}
		
		function shaixuan() {
			$(".shaixuan_div").fadeIn();
			var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动  
			$(document).bind("scroll",function (){$(document).scrollTop(tops); });
			document.getElementById("expert_id").value=expert_id;
		}
		function healthAata(){
			window.location="<%=basePath%>maid/healthAata";
		}
		function healthAssistant(){
			window.location="<%=basePath%>maid/healthAssistant";
		};
	</script>
</body>
</html>