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
<!DOCTYPE HTML>

<html>

	<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
		<title>管家</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/maid.css"/>
		<script type="text/javascript" src="js/medicinefood/uitl-string.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
	
	</head>

	<body>

		<!--主体部分-->
		<div class="mui-content">
			
		    <ul class="mui-table-view">
		    	<li class="user-box">
	                <div class="user">
						<div class="user-portrait">
		            		<img id="headImgUrl" onerror="javascript:this.src='http://via.placeholder.com/100X100'"/>
		            	</div>
		            	<div class="user-info" style="width:50%;">  
		            		<div id="nickname" style="font-size:18px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"></div>
		            		<div id="userWeixin"style="padding-top: 7px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"></div>
		            		<div>晋升积分：<span id="reward"></span></div>
		            		<div id="vip_time"></div>
		            	</div>
		            	
		            	<span class="user-member">
		            		<span id="grade_nickname">游客会员</span>
		            		<span id="grade_name">海星</span>
		            	</span>
		            </div>
		            
		            <div class="user-manage">
		            	<div class="manage manage-border">
		            		奖金管理
		            	</div>
		            	<div class="manage manage-border">
		            		分红积分
		            	</div>
		            	<div class="manage manage-border">
		            		旅游积分
		            	</div>
		            </div>
	            </li>
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/personInfo';};">
	                <img class="custom-table-view-cell-icon" src="file/jointly/images/icon/gerenxx.png">
	                <a class="mui-navigate-right">
	              		个人信息
	                </a>
	            </li>
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/myorder';};">
	            	<img class="custom-table-view-cell-icon" src="file/jointly/images/icon/dingdan.png">
	                <a class="mui-navigate-right">
	              		我的订单
	                </a>
	            </li>
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/address';};">
	            	<img class="custom-table-view-cell-icon" src="file/jointly/images/icon/zengping.png">
	                <a class="mui-navigate-right">
	              		赠品信息
	                </a>
	            </li>
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/myteam';};">
	            	<img class="custom-table-view-cell-icon" src="file/jointly/images/icon/tuandui.png">
	                <a class="mui-navigate-right">
	              		我的团队
	                </a>
	            </li>
	            <!-- 
	            <li class="custom-table-view-cell" onclick="javascript:{mui.alert('暂未开放...');};">
	                <a class="mui-navigate-right">
	              		下载专区
	                </a>
	            </li>
	             -->
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/healthAata';};">
	            	<img class="custom-table-view-cell-icon" src="file/jointly/images/icon/jiankang.png">
	                <a class="mui-navigate-right">
	              		健康助理
	                </a>
	            </li>
	            <li class="custom-table-view-cell" onclick="javascript:{window.location='maid/myNews';};" style="position: relative;">
	                <img class="custom-table-view-cell-icon" src="file/jointly/images/icon/xiaoxi.png">
	                <a class="mui-navigate-right">
	              		我的消息
	                </a>
	                <p style="width:15px;height:15px;border-radius:50%;background: red;position: absolute;top:10px;left:120px;text-align: center;line-height: 15px;color:#fff;font-size: 12px;display:none" id="if_read"></p>
	            </li>
                <li class="custom-table-view-cell">
	                <img class="custom-table-view-cell-icon"  src="file/jointly/images/icon/qianbao.png">
	                <a class="mui-navigate-right" onclick="javascript:{window.location='maid/myWallet';};">
	              		我的钱包
	                </a>
	            </li>
				<li class="custom-table-view-cell">
	                <img class="custom-table-view-cell-icon" src="file/jointly/images/icon/fapiao.png">
	                <a class="mui-navigate-right" onclick="javascript:{window.location='maid/invoicingInfo';};">
	              		发票信息
	                </a>
	            </li>
	        </ul>
		</div>
		
		<!--底部导航栏-->
		<nav class="mui-bar mui-bar-tab">
		    <a class="mui-tab-item" href="home">
		        <span class="mui-icon iconfont shade icon-tabber-home"></span>
		        <span class="mui-tab-label">首页</span>
		    </a>
		    <a class="mui-tab-item" href="store">
		        <span class="mui-icon iconfont shade icon-tabber-store"></span>
		        <span class="mui-tab-label">自助区</span>
		    </a>
		    <a class="mui-tab-item" href="customize">
		        <span class="mui-icon iconfont shade icon-tabber-customize"></span>
		        <span class="mui-tab-label">定制</span>
		    </a>
		    <a class="mui-tab-item  mui-active" href="maid">
		        <span class="mui-icon iconfont shade-active icon-tabber-maid"></span>
		        <span class="mui-tab-label">管家</span>
		    </a>
		</nav>
	
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
			// 头像点击事件
			mui('.user').on('tap','.user-member',function(){
				var page = './maid/memberinto';
				window.location.href = page;
			});
			
			var manages = mui('.manage');
			manages.each(function(i,btn){
				btn.addEventListener('tap',function(){
					switch (i){
						case 0:
							var page = './maid/bonus';
							break;
						case 1:
							var page = './maid/reward';
							break;
						case 2:
							var page = './maid/tourism';
							break;
					}
					window.location.href = page;
				},false);
			});
			
			mui('.mui-bar').on('tap','.mui-tab-item',function(){
				var href_str = this.href;
				var hrefArr = href_str.split('/');
				var page_url = '/'+hrefArr[hrefArr.length-1];
				var page_id = hrefArr[hrefArr.length-1];
				var argument = '';
				page_url="HomeController"+page_url;
				OpenPage(page_url,page_id,argument);
			});

			var vipdoc=document.getElementById('vip_time');
       		var user_grade_id="${userGrade.user_grade_id}";
       		var low_vip_time="${bu.low_vip_time}";
       		var vip_time="${bu.vip_time}";
       		var health_time="${bu.health_time}";
       		
       		if(uitl_trim(user_grade_id)=="1"){
       			vipdoc.innerHTML="您还未成为正式会员";
       		}else{
       			if(vip_time!=null&&vip_time!=""){
       				if(parseInt(uitl_trim(vip_time))){
       					vipdoc.innerHTML="B系统会员到期时间： "+formatDateTimeStr(parseInt(vip_time),0);
       				}
       			}else if(health_time!=null&&health_time!=""){
       				if(parseInt(uitl_trim(health_time))){
       					vipdoc.innerHTML="A系统会员到期时间： "+formatDateTimeStr(parseInt(health_time),0);
       				}
       			}else if(low_vip_time!=null&&low_vip_time!=""){
       				if(parseInt(uitl_trim(low_vip_time))){
       					vipdoc.innerHTML="体验会员到期时间： "+formatDateTimeStr(parseInt(low_vip_time),0);
       				}
       			}else{
       				vipdoc.innerHTML="您的会员已到期";
       			}
       		};
       		
			
			//获取url中的参数
	        function getUrlParam(name) {
	            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	            if (r != null) return unescape(r[2]); return null; //返回参数值
	        }
		
			var store_id = getUrlParam('store_id');
			
	      	function user_basics_idssss(data){
	 	 		var userWeixin=data.userWeixinData.userWeixin;//weixin_nickname
	 	 		if(userWeixin!=null){
	 	 			$("#userWeixin").html(" 推荐人："+userWeixin.weixin_nickname);
	 	 		}
	  			
	      	}
	   
	       	var user_basics_id=$.cookie('user_basics_id');	   
	      	var paramData={user_basics_id:user_basics_id};                               
	      	var object = JSON.stringify(paramData);
	      	ajaxPost("<%=basePath%>user_weixin/findUserSuperioruserUserBasics",object,"json","json",user_basics_idssss);
	      	
	      	// 历史积分
	      	ajaxPost("<%=basePath%>maid/findRecordsIntegral", "", "json", "json", findRecordsIntegral); //异步获取当前用户晋升积分流水，并显示在当前页面
	      	
	      	function findRecordsIntegral(jsonData){
	      		document.getElementById('reward').innerHTML = jsonData.object;
	    	}
	      	// 用户未读消息   UserMessage/findUserCount
	      	var jsiondat={"1":"1"};
	      	ajaxPost("<%=basePath%>UserMessage/findUserCount",jsiondat,"json","json",findUserCounts);//异步获取当前用户用户未读消息
	      	
	      	function findUserCounts(data){
	      		if(data.state==0){
	      			if(data.object>0){
	      				document.getElementById("if_read").style.display='block';
	      				document.getElementById("if_read").innerHTML=data.object;
	      			}
	      		}
	      		
	      	}
	      	
	      	var user_grade_id="<%=user_grade_id%>";
	      	user_grade_id = parseInt(user_grade_id);
	   		var grade_name = null,grade_nickname=null;
			switch (user_grade_id){
				case 1:
					grade_nickname = "海星会员";
					grade_name = "游客";
					break;
				case 2:
					grade_nickname = "体验会员";
					grade_name = "红卡巴";
					break;
				case 3:
					grade_nickname = "普通会员";
					grade_name = "橙卡巴";
					break;
				case 4:
					grade_nickname = "初级会员";
					grade_name = "黄卡巴";
					break;
				case 5:
					grade_nickname = "中级会员";
					grade_name = "绿卡巴";
					break;
				case 6:
					grade_nickname = "高级会员";
					grade_name = "青卡巴";
					break;
				case 7:
					grade_nickname = "顶级会员";
					grade_name = "蓝卡巴";
					break;
				case 8:
					grade_nickname = "顶尖会员";
					grade_name = "紫卡巴";
					break;
			}
			document.getElementById("grade_nickname").innerHTML=grade_nickname;
			document.getElementById("grade_name").innerHTML=grade_name;
			 
			var headImgUrl="<%=headImgUrl%>";
			var nickname="<%=nickname%>";
			if(headImgUrl!=null){
				document.getElementById("headImgUrl").src=headImgUrl;
			}
			if(nickname!=null){
				document.getElementById("nickname").innerHTML=nickname;
			}
		</script>
	</body>

</html>

