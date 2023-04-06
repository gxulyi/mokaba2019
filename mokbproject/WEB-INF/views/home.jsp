<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.medicinefood.entity.weixin.oauth.SNSUserInfo"%>


<% 
  SNSUserInfo SNSUserInfo=new SNSUserInfo();
  
   Cookie[] cookies = request.getCookies();
    System.out.println(SNSUserInfo.getOpenId()) ;
     // 遍历数组,获得具体的Cookie
    if(cookies == null) {
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
    %>
<% /*//SNSUserInfo SNSUserInfo=new SNSUserInfo();
  o340P1jtyhs6ab3dYtcktOddOxQo
 //SNSUserInfo=(SNSUserInfo)request.getAttribute("snsUserInfo");
 System.out.println(SNSUserInfo.getOpenId()) ;
Cookie getOpenId = new Cookie("getOpenId",SNSUserInfo.getOpenId());

getOpenId.setPath("/");
Cookie getHeadImgUrl = new Cookie("getHeadImgUrl",SNSUserInfo.getHeadImgUrl());
getHeadImgUrl.setPath("/");
Cookie getNickname = new Cookie("getNickname",java.net.URLEncoder.encode(SNSUserInfo.getNickname(),"UTF-8")); 
//Cookie getNickname = new Cookie("getNickname",SNSUserInfo.getNickname());
getNickname.setPath("/");
 response.addCookie(getOpenId);
  response.addCookie(getHeadImgUrl);
   response.addCookie(getNickname);
*/

  
   %>

<!DOCTYPE HTML>
<html>
	<head>
	
	  	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>首页</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/home.css"/>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>		
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		
	</head>
	
	<body>
		<!--主体部分-->
		<div class="mui-content" style="background-color: #fff;">
			<!--顶部开始-->
			<div class="home-top">
				<!--轮播图-->
				<div id="banner" class="banner-box" onclick="window.location='HomeController/knowledge'">
					<%-- <img src="<%=basePath%>/file/jointly/images/banner/home/home.png"/> --%>
					<!--首页轮播图-->
					<div id="slider" class="mui-slider">
				      	<div class="mui-slider-group mui-slider-loop">
				      			   
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>

						<%// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
								request.setCharacterEncoding("UTF-8");
								response.setCharacterEncoding("UTF-8");
						List<HashMap<String, Object>> listMap=null;
						listMap=(List<HashMap<String, Object>>)request.getAttribute("listMap");%>
				        	<%if(listMap.size()>=1){
				        	
							for(int i=0;i<listMap.size()+2;i++){
				   				if(i==0){%>
				     				<div class="mui-slider-item mui-slider-item-duplicate">
										<a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(listMap.size()-1).get("article_id")%>">
									   		<img src="<%=listMap.get(listMap.size()-1).get("pictures_url")%>">
									  	</a>
									 </div>
				 				<%}else if(i==listMap.size()+1){%>		   
				 					<div class="mui-slider-item mui-slider-item-duplicate">
										<a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(0).get("article_id")%>">
									    	<img src="<%=listMap.get(0).get("pictures_url")%>">
									    </a>
									</div>
								<% }else{%>
									 <div class="mui-slider-item">
										<a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(i-1).get("article_id")%>">
											<img src="<%=listMap.get(i-1).get("pictures_url")%>">
										</a>
									 </div>
								<%} %>
								<%}%>
							<%}%>
				      	</div>
				    </div>
				</div>
				<!--视频按钮-->
				<div class="video-btn-box" onclick="window.location='HomeController/video'">
					<img src="<%=basePath%>/file/jointly/images/icon/icon-video.png"/>
					<span style="position: absolute;top:50px;width: 100%; font-size: 10px;color:#ffa954;display: block;text-align: center;">音视频</span>
				</div>
				
				<!--卡巴部落奖金池-->
				<div class="knowledge-btn-box" onclick="window.location='HomeController/kbBonusPool'">
					<img src="<%=basePath%>/file/jointly/images/icon/icon-essence.png"/>
					<span style="position: absolute;top: 45px;width: 100%; font-size: 10px;color:#62bca3;display: block;text-align: center;">卡巴奖金</span>
				</div>
				
				<!--卡巴知识库-->
				<div class="essence-btn-box" onclick="window.location='HomeController/knowledge'">
					<img src="<%=basePath%>/file/jointly/images/icon/icon-knowledge.png"/>
					<span style="position: absolute;top:45px;width: 100%; font-size: 10px;color:#62bca3;display: block;text-align: center;">知识库</span>
				</div>
				<!--卡巴公益-->
				<div class="fund-btn-box" onclick="window.location='HomeController/fund'">
					<img src="<%=basePath%>/file/jointly/images/icon/icon-fund.png"/>
					<span style="position: absolute;top:45px;width: 100%; font-size: 10px;color:#62bca3;display: block;text-align: center;">卡巴公益</span>
				</div>
				<!--卡巴资讯-->
				<div class="dynamic-btn-box" onclick="window.location='HomeController/dynamic'">
					<img src="<%=basePath%>/file/jointly/images/icon/icon-dynamic.png"/>
					<span style="position: absolute;top:45px;width: 100%; font-size: 10px;color:#62bca3;display: block;text-align: center;">卡巴资讯</span>
				</div>
			</div>
			<!--顶部结束-->
			
			<!--底部开始-->
			<div class="home-bottom">
				<div class="home-tip-box">
					<div class="home-tip-content">
						<span>优享生命科技&nbsp;&nbsp;共筑未来社区</span>
						<span>Enjoy Life Technology to Build a Future Community</span>
					</div>
				</div>
			</div>
			<!--顶部结束-->
		</div>
		
		<!--底部导航栏-->
		<nav class="mui-bar mui-bar-tab" style="">
		    <a class="mui-tab-item mui-active" href="./home">
		        <span class="mui-icon iconfont shade-active icon-tabber-home"></span>
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
		    <a class="mui-tab-item" href="./maid">
		        <span class="mui-icon iconfont shade icon-tabber-maid"></span>
		        <span class="mui-tab-label">管家</span>
		    </a>
		</nav>
		
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			mui('.mui-bar').on('tap','.mui-tab-item',function(){
				var href_str = this.href;
				var hrefArr = href_str.split('/');
				var page_url = '/'+hrefArr[hrefArr.length-1];
				var page_id = hrefArr[hrefArr.length-1];
				var argument = '';
				page_url="HomeController"+page_url+"?id=kjkjdfslkfsdfklsgsjfjflf";
				OpenPage(page_url,page_id,argument);
			});
			
			var slider = mui('#slider');
			//轮播图滚动方法
			slider.slider({
				interval: 5000
			});
			
			var weixin_id="<%=SNSUserInfo.getOpenId()%>"; 
 			// o340P1hTZQNb3UhIkI54LPy6vT4Q";
			var getHeadImgUrl=$.cookie('getHeadImgUrl');
			var getNickname=$.cookie('getNickname');

			function function_login(data){  
	    		//$.cookie('cookieName',data.message, {path: '/' });
	  			//$.cookie('user_grade_id', basicsUser.user_grade_id);//过期时间1天
      			//$.cookie('weixin_id',weixin_id);//过期时间7天
     			//$.cookie('cookieName',JSON.stringify(basicsUser));//过期时间7天
     			//$.cookie('cookieName888', "{\"user_basics_id\":53,\"user_nickname\":null,\"user_password\":\"null\",\"user_register_data\":1517221855834,\"user_register_address\":\"null\",\"user_grade_id\":1}", {path: "/" });//过期时间7天
      			//SetCookie("cookieName999",encodeURIComponent(JSON.stringify(basicsUser)));
      			//$.cookie('basicsUser', JSON.stringify(basicsUser), { expires:7, path:  "/" });//过期时间7天
        
     			// 取的时候是这样取：
     			// var user_basics_id=$.cookie('user_basics_id');
    			// var dhfs=JSON.stringify(getNickname);//json转字符串
    			// var sdfh= JSON.parse(getNickname);//转对象
        	}
        
        	var weixin_nickname="<%=SNSUserInfo.getNickname()%>";
        	var weixin_portrait="<%=SNSUserInfo.getHeadImgUrl()%>";
        	var paramData={weixin_id:weixin_id,weixin_nickname:weixin_nickname,weixin_portrait:weixin_portrait};                               
	      	var object = JSON.stringify(paramData);
	      	ajaxPost("<%=basePath%>user_weixin/findUserWeixin",object,"json","json",function_login);
		</script>
	</body>

</html>
 