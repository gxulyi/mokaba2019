<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
  <meta charset="UTF-8">
		<title>会员等级</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/memberinto.css"/>
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css"/>
		<script src="js/pop/custom-pop.js"></script>
	</head>

	<body>
	<!--  <input id="objective" type="hidden" value="${unrealized.objective}">
	<input id="present" type="hidden" value="${unrealized.present}">-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-blue">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div id="content" class="mdfd-content">
				<div class="member-info-box">
					<div class="member-info">
						<div class="member-info-portrait">
							<img src="file/jointly/images/maid/794936905056871801.png"/>
						</div>
						<div class="member-info-text">
						<label>会员等级：<span>${userGrade.grade_name}</span></label>
							<!-- 
							<label>距离下一次等级：
							<c:forEach items="${userUpgrade.unrealizedList}" var="unrealized">
						    <c:if test="${!(unrealized.type=='custom')}">
							 <span>${unrealized.objective-unrealized.present}</span>${unrealized.Name}
							</c:if>
							</c:forEach>
							</label>
							 -->
						</div>
					</div>
				</div>
				
				<div class="member-mange-box">
					<p class="text-align-c" style="line-height: 40px;border-bottom: 1px solid #f0f0f0;">
<!-- 						<i class="iconfont shade icon-huiyuanguanli"></i>&nbsp;&nbsp; -->
						<span style="color:#333;font-size: 18px;">等级管理</span>
					</p>
					<div class="position-relative" style="margin-top: 10px;">
						<div class="member-single-box">
							<div class="member-single">
								<span>海星会员游客</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>体验会员红卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>普通会员橙卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>初级会员黄卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>中级会员绿卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>高级会员青卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>顶级会员蓝卡巴</span>
							</div>
						</div>
						<div class="member-single-box">
							<div class="member-single">
								<span>顶尖会员紫卡巴</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript">
			
			(function($,doc){
				$.init();
				
				var membersingles = $('.member-single');
				membersingles.each(function(i,btn){
					btn.addEventListener('tap',function(){
						// 选择等级
						var user_grade_num = i + 1;
						var paramData={user_grade_id:user_grade_num};
						var object = JSON.stringify(paramData);
						ajaxPost("<%=basePath%>user_weixin/findUserGrade",object,"json","json",showSver);
					},false);
				});
			  	
			  
			})(mui,document);
			
			// 处理等级介绍
			function showSver(data){
				var gradeIntroduce = data.object.grade_introduce;
				var popInfo = {
					title:'提示',
					content:gradeIntroduce
				};
				popShowAndHidden(popInfo);
			}
			
		</script>
	</body>

</html>