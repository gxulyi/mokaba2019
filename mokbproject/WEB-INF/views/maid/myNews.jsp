<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
    <link href="css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
	<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
	<link rel="stylesheet" type="text/css" href="css/maid.css"/>
	<script type="text/javascript" src="js/medicinefood/uitl-string.js"></script>
	<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
    <title>我的消息</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	
	
		
		<style>
	    	*{margin:0;padding:0;}
	    	ul{
	    		list-style: none;
	    	}
	    	.center_div{
	    		width:90%;height: 50px;margin:0 auto;
	    	}
	    	.center_div_img{
	    		width:50px;height: 50px;border-radius:100%;background: #ccc;float: left;
	    	}
	    	.center_div_img img{
	    		width:100%;height: 100%;	
	    	}
	    	.center_div_name{
	    		float: left;line-height: 22px;margin-left:10px;
	    	}
	    	.center_div_zjjs{
	    		width:90%;height: auto;margin:0 auto;
	    	}
	    	.center_div_nr{
	    		background: #f0f0f0;border-radius:5px;
	    	}
	    	.center_div_nr span{
	    		font-size: 13px;color:#333;
	    	}
	    	.demo{
	    		font-size: 12px;color:#999;text-indent:2em;line-height: 18px;padding:10px;
	    	}
	    	.center_div_nr_djzk{
	    		font-size: 11px;color:#666;text-align: center;
	    	}
	    	.center_div_nr_zj{
				width:100%;line-height: 30px;border-bottom:1px solid #fff;padding:0 10px;
			}
			.center_div_tit{
				width: 90%;height: 35px;line-height: 35px;margin:0 auto;font-size: 13px;color: #333333;
			}
			.center_div_tit p{
				width: 90%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;color: #333333;
			}
			.center_div_nr_sj{
				width: 90%;height: 30px;line-height:30px;margin:0 auto;border-bottom: 1px solid #f0f0f0;
				text-align: right;font-size: 12px;color: #999999;
			}
			.center_div_name_js{
				width: 90%;line-height:20px;margin: 0 auto;padding: 10px 0;font-size: 13px;color: #333333;border-bottom: 1px solid #F0F0F0;
			}
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
		  <div id="user_message">
		  <!-- 
		    <div style="margin-top:20px;">
					<div class="center_div">
						<div class="center_div_img">
							<img alt="" src="images/zhuanjia.png">
						</div>
						<div class="center_div_name">
							<p style="font-size: 14px;color: #333333;">健康助理</p>
							<p style="font-size: 12px;color: #666666;">2018-7-6</p>
						</div>
					</div>
					<div class="center_div_tit">
						<p>16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校，毕业后 </p>
					</div>
					<div class="center_div_zjjs">
						<div class="center_div_nr">
							<div class='demo'> 
								16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校，毕业后16岁考入南京军区军医学校，毕业后 
								16岁考入南京军区军医学校
							</div> 
						</div>
					</div>
					<p class="center_div_nr_sj">
						2018-7-6
					</p>
				</div>
				
				<div style="margin-top:20px;">
					<div class="center_div">
						<div class="center_div_img">
							<img alt="" src="images/moerkaba.png">
						</div>
						<div class="center_div_name">
							<p style="font-size: 14px;color: #333333;">摩尔卡巴公众号</p>
							<p style="font-size: 12px;color: #666666;">2018-7-6</p>
						</div>
					</div>
					<div class="demo center_div_name_js">
						欢迎来到摩尔卡巴公众号欢迎来到摩尔卡巴公众号欢迎来到摩尔卡巴公众号
					</div>
				</div>
				 -->
		</div>
	</div>
</div>
<script src="js/mui.min.js"></script>
<script type="text/javascript">
	function showUserMessage(data){
		var object=data.object;
		var message_content="";
		if(object==null||object==""){
			alert("暂时没有您的消息!");
			return;
		}
		for(var i=0;i<object.length;i++){
			message_content+=object[i].message_content;
		}
		document.getElementById("user_message").innerHTML=message_content;
	}
	
	
	function onloadd(){
	  	var paramData;
	  	var paramData={"1":"1"};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>UserMessage/findUserMessage",object,"json","json",showUserMessage);
	};
	  
	window.onload=function(){
	  	onloadd();
	};
</script>
  </body>
  <!-- 
  <script>
		var oBox=document.getElementsByClassName('demo');
		for(var i=0;i<oBox.length;i++){
		   var demoHtml = oBox[i].innerHTML.slice(2,50)+'......';
           oBox[i].innerHTML = demoHtml;
		}
	</script>
	 -->
</html>
