<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.medicinefood.entity.weixin.oauth.SNSUserInfo"%>
<%@ page import="com.medicinefood.entity.SessionEntity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<% 
SessionEntity sessionEntity=new SessionEntity(request);
Integer user_grade_id= sessionEntity.getUser_grade_id();
SNSUserInfo SNSUserInfo=new SNSUserInfo();
   Cookie[] cookies = request.getCookies();
     // 遍历数组,获得具体的Cookie
    if(cookies == null) {
        out.print("没有Cookie信息");
     } else {
       for(int i=0; i<cookies.length; i++) {
            // 获得具体的Cookie
            Cookie cookie = cookies[i];
            
            if(cookie.getName().equals("getOpenId")){
            SNSUserInfo.setOpenId(cookie.getValue());
            
            }
            else if(cookie.getName().equals("getHeadImgUrl")){            
             SNSUserInfo.setHeadImgUrl(cookie.getValue());
            }
            else if(cookie.getName().equals("getNickname")){
            
             SNSUserInfo.setNickname(java.net.URLDecoder.decode(cookie.getValue(),"UTF-8"));
            }
             else if(cookie.getName().equals("getCity")){
              SNSUserInfo.setCity(cookie.getValue());
             }
         }
         
   } 
   	String headImgUrl=SNSUserInfo.getHeadImgUrl();
    String nickname=SNSUserInfo.getNickname();
 %>
<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>我的积分</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/myintegral.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		
	</head>
	<body style="background: #FFFFFF;">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">积分</h1>
		</header>
		<div class="mui-content" style="margin-bottom: 45px;">
			<div class="myintel_banner">
				<div class="member-center">
					<div class="user-portrait">
	            		<img id="headImgUrl" onerror="javascript:this.src='http://via.placeholder.com/74X74'" src="http://via.placeholder.com/74X74">
	            	</div>
	            	<div class="user-info">  
	            		<div style="font-size:12px;border-bottom: 1px solid #000000;padding-right: 13px;">可用积分<span id="integral" style="font-size: 24px;"></span></div>
	            		<div style="padding-top: 3px;font-size:12px;color: #000000;">累计获取积分<span id="integralhis"></span></div>
	            	</div>
            	</div>
			</div>
			<ul class="flash-sale-time">
				<li class="myintel_li" style="background: #c65280;color: #FFFFFF;" onclick="clickShowDiv(this,'quanbu_div');">
					<span>全部</span>
				</li>
				<li class="myintel_li" onclick="clickShowDiv(this,'huoqu_div');">
					<span>获取</span>
				</li>
				<li class="myintel_li" onclick="clickShowDiv(this,'shiyong_div');">
					<span>使用</span>
				</li>
			</ul>
			<div id="quanbu_div" class="myintel_nr">
				<div id="record1" class="detail-box">
					<ul class="detail-single" >
						<!-- <li style="width: 60%;">
							<h5 class="default-text-color"><span>购买商品</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>+100</span>
						</li> -->
					</ul>
					<!-- <ul class="detail-single">
						<li style="width: 60%;">
							<h5 class="default-text-color"><span>积分抽奖</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>-10</span>
						</li>
					</ul>
					<ul class="detail-single">
						<li style="width: 60%;">
							<h5 class="default-text-color"><span>优惠券兑换</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>+50</span>
						</li>
					</ul> -->
				</div> 
			</div>
			<div id="huoqu_div" class="myintel_nr" style="display: none;">
				<div id="record2" class="detail-box">
					<!-- <ul class="detail-single" >
						<li style="width: 60%;">
 							<div class="detail-base">   
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>+100</span>
						</li>
					</ul>
					<ul class="detail-single">
						<li style="width: 60%;">
							<h5 class="default-text-color"><span>优惠券兑换</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>+50</span>
						</li>
					</ul> -->
				</div>
			</div>
			<div id="shiyong_div" class="myintel_nr" style="display: none;">
				<div id="record3" class="detail-box">
					<!-- <ul class="detail-single">
						<li style="width: 60%;">
							<h5 class="default-text-color"><span>积分抽奖</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>-10</span>
						</li>
					</ul>
					<ul class="detail-single">
						<li style="width: 60%;">
							<h5 class="default-text-color"><span>优惠券兑换</span></h5>
							<div class="detail-base">
								<span>2018-04-29 09:10:45</span>
							</div>
						</li>
						<li style="width: 40%;" class="myintel_nr_jf">
							<span>-50</span>
						</li>
					</ul> -->
				</div>
			</div>
		</div>
		<div class="box" >
			<div class="box_tit">活动积分</div>
			<div class="mui-card">
		        <ul class="mui-table-view">
		            <li class="mui-table-view-cell">
		                <a style="display: flex;align-items:center;white-space: normal;background: #5eb8e1;opacity:0.76;">
		                	<div class="box_neirong_img">
		                		<label>+20</label>
		                	</div>
		                    <div class="box_neirong">
		                    	<p>推荐好友关注公众号</p>
		                    	<span>通过我的二维码将个人二维码分享给朋友，关注后获得积分</span>
		                    </div>
		                    <div class="box_neirong-btn" onclick="jifen_click(this)">去完成</div>
		                </a>
		            </li>
		        </ul>
		    </div>
		    <div class="mui-card">
		        <ul class="mui-table-view">
		            <li class="mui-table-view-cell">
		                <a style="display: flex;align-items:center;white-space: normal;background:#a89ad8;">
		                	<div class="box_neirong_img1">
		                		<label>+10</label>
		                	</div>
		                    <div class="box_neirong">
		                    	<p>购买商品</p>
		                    	<span>在商城中进行消费，按商品价格1：1等价转换为积分</span>
		                    </div>
		                    <div class="box_neirong-btn" style="color:#a89ad8;" onclick="jifen_click(this)">去完成</div>
		                </a>
		            </li>
		        </ul>
		    </div>
		    <div class="mui-card">
		        <ul class="mui-table-view">
		            <li class="mui-table-view-cell">
		                <a style="display: flex;align-items:center;white-space: normal;background: #4db4af;">
		                	<div class="box_neirong_img2">
		                		<label>+5</label>
		                	</div>
		                    <div class="box_neirong">
		                    	<p>撰写文章</p>
		                    	<span>在观茶论道中发表文章并成为推荐</span>
		                    </div>
		                    <div class="box_neirong-btn" style="color:#4db4af;" onclick="jifen_click(this)">去完成</div>
		                </a>
		            </li>
		        </ul>
		    </div>
			<img class="guanbie" src="images/myintegral/gb.png" />
			<img style="width:86px;position: absolute;left: 50%;top: 0%;transform: translate(-50%,-50%);" src="images/myintegral/toux.png" />
		</div>
		<div class="bgdiv"></div>
		<div class="return-div" onclick="pointShow();">赚取积分</div>
		
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
 		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/mui.min.js"></script>
		<script>
		var headImgUrl="<%=headImgUrl%>";
		if(headImgUrl!=null){
			document.getElementById("headImgUrl").src=headImgUrl;
		}
			function onloadd(){
			   var paramData;
			   var paramData={1:1};                               
			   var object = JSON.stringify(paramData);
			   ajaxPost("<%=basePath%>maid/findIntegralBasics", "", "json", "json", setIntegralBasics);//异步获取当前用户积分，并显示在当前页面
				ajaxPost("<%=basePath%>maid/findIntegralBasicsAccount", "", "json", "json", setIntegralAccount); //异步获取当前用户积分流水，并显示在当前页面
			ajaxPost("<%=basePath%>maid/findRecordsIntegral", "", "json", "json", showIntegralHis); //异步获取当前用户晋升积分流水，并显示在当前页面	
			 };
			 window.onload=function(){
			  onloadd();
			 }; 
			 //展示历史积分
			 function showIntegralHis(data){
			 	var object = data.object;
			 	document.getElementById("integralhis").innerHTML = object;
			 }
			 //展示可用积分
			 function setIntegralBasics(data){
			 	var object = data.object;
			 	document.getElementById("integral").innerHTML = object;
			 }
			 //展示积分流水
			 function setIntegralAccount(data){
			 	var dataList = data.object;
			 	var htmlStr1 ="";//全部
			    var htmlStr2 ="";//获取
			    var htmlStr3 ="";//使用
			 	if(dataList==null){
			 		alert("暂无记录！");
			 		return;
			 	}
			 	for(var i = 0 ; i < dataList.length; i++){
			 		if(dataList[i].integral_account_num<0){//使用
			 			htmlStr3 +='<ul class="detail-single" >'+
			              '<li style="width: 60%;">'+
							'<h5 class="default-text-color"><span>'+dataList[i].integral_account_explain+'</span></h5>'+
							'<div class="detail-base">'+
							'<span>'+ formatDateTimeStr(dataList[i].account_add_date,1) +'</span>'+
							'</div>'+
						'</li>'+
						'<li style="width: 40%;" class="myintel_nr_jf">'+
						 '<span>'+dataList[i].integral_account_num+'</span>'+
						'</li>'+
				        '</ul>';
			 		}else{
			 			htmlStr2 +='<ul class="detail-single" >'+
			              '<li style="width: 60%;">'+
							'<h5 class="default-text-color"><span>'+dataList[i].integral_account_explain+'</span></h5>'+
							'<div class="detail-base">'+
							'<span>'+ formatDateTimeStr(dataList[i].account_add_date,1) +'</span>'+
							'</div>'+
						'</li>'+
						'<li style="width: 40%;" class="myintel_nr_jf">'+
						 '<span>'+"+"+dataList[i].integral_account_num+'</span>'+
						'</li>'+
				        '</ul>';
			 		}
			      htmlStr1 +='<ul class="detail-single" >'+
			              '<li style="width: 60%;">'+
							'<h5 class="default-text-color"><span>'+dataList[i].integral_account_explain+'</span></h5>'+
							'<div class="detail-base">'+
							'<span>'+ formatDateTimeStr(dataList[i].account_add_date,1) +'</span>'+
							'</div>'+
						'</li>'+
						'<li style="width: 40%;" class="myintel_nr_jf">';
						if(dataList[i].integral_account_num >= 0){
						 htmlStr1 += '<span>'+"+"+dataList[i].integral_account_num+'</span>'+
						'</li>';
						}else{
						htmlStr1 += '<span>'+dataList[i].integral_account_num+'</span>'+
						'</li>';
						}
					htmlStr1 += '</ul>';	
			   };
			   if(dataList!=null){
			    
			    if(htmlStr2 == ""){
			    	document.getElementById("record2").innerHTML = "暂无数据";
			    }else{
			    	document.getElementById("record2").innerHTML = htmlStr2;
			    }
			    
			    if(htmlStr3 == ""){
			    	document.getElementById("record3").innerHTML = "暂无数据";
			    }else{
			    	document.getElementById("record3").innerHTML = htmlStr3;
			    }
			    document.getElementById("record1").innerHTML = htmlStr1;
			    
			   }else{
			    document.getElementById("record1").innerHTML = "暂无数据";
			    document.getElementById("record2").innerHTML = "暂无数据";
			    document.getElementById("record3").innerHTML = "暂无数据";
			   }
			 }
		
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			//点击领取积分
			function jifen_click(elm){
				$(elm).css({
		            "color":"#fff",
		            "background":"#999999"
		        });
			}
			//菜单切换
			function clickShowDiv(e,id){
				//菜单切换
				$(".myintel_nr").each(function(){
					if($(this).attr("id")==id){
						$(this).show();
					}else{
						$(this).hide();
					}
				});
				$(e).css({
					"background":"#c65280",
					"color":"#FFFFFF"
					});
				$(e).siblings().each(function(){
					if($(this).attr("class")=="myintel_li"){
						$(this).css({
						"background":"#fff",
						"color":"#c65280"
					});
					}
				});
			}
			//显示积分赚取
			$(function() {
				$(".guanbie").click(function() {
					$(".bgdiv,.box").hide();
					$(document).unbind("scroll");
				});
			});
			function pointShow(url){
				alert("敬请期待！");
				return;
				$(".bgdiv,.box").fadeIn();
				$(".box").find("div:eq(1)").children().attr("src","img/kcds/"+url+".png");
				var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动  
				$(document).bind("scroll",function (){$(document).scrollTop(tops); });
			}
		</script>
	</body>

</html>