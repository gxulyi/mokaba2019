<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page  import="com.medicinefood.entity.core.TeamEntity" %>
<%
TeamEntity teamEntityNotBuy=(TeamEntity)request.getAttribute("teamEntityNotBuy");
%>
<!DOCTYPE HTML>

<html>

	<head>
	<base href="<%=basePath%>">
	
		<meta charset="UTF-8">
		<title>未购会员</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/myteam.css"/>
	</head>
    <script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/medicinefood/team.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		 ajaxPost("<%=basePath%>user_weixin/findUserSubordinateInculdeOrderBasics5","","json","json",showMyteamNum);
		};
	</script>
	<script type="text/javascript">
	function showMyteamNum(data){
		var object =data.object;//后台数据库返回数据
		var subordinate1=object[1];//一级下属
		var subordinateBuy1;//一级已购买下属
		var subordinateBuyNo1;//一级未购买下属
		var subordinate2=object[2];//二级下属
		var subordinateBuy2;//二级已购买下属
		var subordinateBuyNo2;//二级未购买下属
		var subordinate3=object[3];//三级下属
		var subordinateBuy3;//三级已购买下属
		var subordinateBuyNo3;//三级未购买下属
		var subordinate4=object[4];//四级下属
		var subordinateBuy4;//四级已购买下属
		var subordinateBuyNo4;//四级未购买下属
		var subordinate5=object[5];//五级下属
		var subordinateBuy5;//五级已购买下属
		var subordinateBuyNo5;//五级未购买下属
		
	
		var amount;//总人数
		var buyAmount;//已购买人数
		
		subordinateBuyNo1=getBuySubordinateNo(subordinate1,11);//得到一级未购买下属
		subordinateBuyNo2=getBuySubordinateNo(subordinate2,11);//得到二级未购买下属
		subordinateBuyNo3=getBuySubordinateNo(subordinate3,11);//得到三级未购买下属
		subordinateBuyNo4=getBuySubordinateNo(subordinate4,11);//得到四级未购买下属
		subordinateBuyNo5=getBuySubordinateNo(subordinate5,11);//得到五级未购买下属
		
		setHtml(subordinateBuyNo1,subordinateBuyNo2,subordinateBuyNo3,subordinateBuyNo4,subordinateBuyNo5);
		}
	   
	   
	   
	   function setHtml(subordinateBuyNo1,subordinateBuyNo2,subordinateBuyNo3,subordinateBuyNo4,subordinateBuyNo5){
       document.getElementById("subordinateBuyNo_1").innerHTML=subordinateBuyNo1.length;
       document.getElementById("subordinateBuyNo_2").innerHTML=subordinateBuyNo2.length;
       document.getElementById("subordinateBuyNo_3").innerHTML=subordinateBuyNo3.length;
       document.getElementById("subordinateBuyNo_4").innerHTML=subordinateBuyNo4.length;
       document.getElementById("subordinateBuyNo_5").innerHTML=subordinateBuyNo5.length;
       }
		
		
		
	
	</script>
	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-center">
					<h4 >未购会员</h4>
				</div>
				<div class="search-right">
					<!--<i class="iconfont icon-sousuo"></i>-->
				</div>
			</div>
			
			<div class="mdfd-content">
				<div class="teamnumber mui-navigate-right">
					<span>第一代会员</span>
					<span id="subordinateBuyNo_1">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第二代会员</span>
					<span id="subordinateBuyNo_2">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第三代会员</span>
					<span id="subordinateBuyNo_3">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第四代会员</span>
					<span id="subordinateBuyNo_4">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第五代会员</span>
					<span id="subordinateBuyNo_5">0</span>
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				
				var personnumbers = $('.teamnumber');
				personnumbers.each(function(i,btn){
					btn.addEventListener('tap',function(){
						
						var page = './maid/member_detail?member=';
						var member;
						switch (i){
							case 0:
								member = '第一代未购会员';
								break;
							case 1:
								member = '第二代未购会员';
								break;
							case 2:
								member = '第三代未购会员';
								break;
							case 3:
								member = '第四代未购会员';
								break;
							case 4:
								member = '第五代未购会员';
								break;
								
								
								
								
						}
						var page_url = page + member;
						window.location=page_url;
					},false);
				});
			})(mui,document);
		</script>
	</body>

</html>