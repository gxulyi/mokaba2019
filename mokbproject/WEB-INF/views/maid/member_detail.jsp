<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page  import="com.medicinefood.entity.core.TeamEntity" %>
<%@ page  import="com.medicinefood.entity.user.UserWeixin" %>
<%
Object series= request.getAttribute("series");
Object type= request.getAttribute("type");
%>

<!DOCTYPE HTML>
<html>

	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>第一代已购会员</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<style type="text/css">
			img{width: 100%;height: 100%;}
			.mdfd-content{padding: 0 5px;}
			.firstmember{position: relative;clear: all;overflow: hidden;background-color: #F0F2F1;border-radius: 10px;padding: 5px;margin-top: 5px;line-height: 1.5;}
			.firstmember-img{width: 50px;height: 50px;border-radius: 50%;overflow: hidden;position: absolute;left: 30px;}
			.firstmember-info{text-align: center;height: 50px;position: relative;clear: all;overflow: hidden;}
		</style>
	</head>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/medicinefood/team.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		 ajaxPost("<%=basePath%>user_weixin/findUserSubordinateInculdeOrderBasics5","","json","json",showMyteamNum);
	};
	
	function showMyteamNum(data){
		var object =data.object;//后台数据库返回数据
		var subordinate1=object[1];//一级下属
		var subordinate2=object[2];//二级下属
		var subordinate3=object[3];//三级下属
		var subordinate4=object[4];//四级下属
		var subordinate5=object[5];//五级下属
		var showSubordinate;//显示的下属
		switch (<%=type%>) {
		case 0://查看已购下属
			switch (<%=series%>) {
			case 1://查看的为一级已购买下属
				showSubordinate=getBuySubordinate(subordinate1,11);
				break;
			case 2://查看的为二级已购买下属
				showSubordinate=getBuySubordinate(subordinate2,11);
				break;
			case 3://查看的为三级已购买下属
				showSubordinate=getBuySubordinate(subordinate3,11);
				break;
			case 4://查看的为四级已购买下属
				showSubordinate=getBuySubordinate(subordinate4,11);
				break;			
            case 5://查看的为五级已购买下属
				showSubordinate=getBuySubordinate(subordinate5,11);
				break;
			default:
				break;
			}
			break;
        case 1://查看未购下属
           switch (<%=series%>) {
			case 1://查看的为一级未购买下属
			    showSubordinate=getBuySubordinateNo(subordinate1,11);
			    break;
			case 2://查看的为二级未购买下属
				showSubordinate=getBuySubordinateNo(subordinate2,11);
				break;
			case 3://查看的为三级未购买下属
				showSubordinate=getBuySubordinateNo(subordinate3,11);
				break;
		    case 4://查看的为四级未购买下属
				showSubordinate=getBuySubordinateNo(subordinate4,11);
				break;
			case 5://查看的为五级未购买下属
			    showSubordinate=getBuySubordinateNo(subordinate5,11);
				break;		
            default:
				break;
			}
			break;
		default:
			break;
		}
		setHtml(showSubordinate);
    }
    
    var series=<%=series%>;//下属级数
    var type=<%=type%>;//类型，0为购买 1为未购买
    
    function setHtml(showSubordinate){
     var myteam=document.getElementById("myteam");
     myteamHtml="";
     showSubordinate.forEach(function(value,index,array){
     var weixin_nickname=value.weixin_nickname==null||value.weixin_nickname==""?"—— (用户未登录或昵称包含特殊字符)":value.weixin_nickname;
     var superior_weixin_nickname;
     
      html="<div  class='firstmember'>"+
					"<div class='firstmember-img'>"+
						"<img src='file/jointly/images/logo.png'/>"+
					"</div>"+
					"<div class='firstmember-info'>"+
						"<span style='display: block;'>"+value.weixin_nickname+"</span>"+
						"<span style='display: block;'>推荐人："+value.superior_weixin_nickname+"</span>"+
				    "</div>"+
		"</div>";
      myteamHtml+=html;
      });
       myteam.innerHTML=myteamHtml;
    }
   
    </script>
	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div id="myteam" class="mdfd-content">
				<!--  <div class="firstmember">
					<div class="firstmember-img">
						<img src="file/jointly/images/logo.png"/>
					</div>
					<div class="firstmember-info">
						<span style="display: block;">往事随风</span>
						<span style="display: block;">推荐人：张三</span>
					</div>
				</div>
				
				<div class="firstmember">
					<div class="firstmember-img">
						<img src="file/jointly/images/logo.png"/>
					</div>
					<div class="firstmember-info">
						<span style="display: block;">往事随风</span>
						<span style="display: block;">推荐人：张三</span>
					</div>
				</div>
				
				<div class="firstmember">
					<div class="firstmember-img">
						<img src="file/jointly/images/logo.png"/>
					</div>
					<div class="firstmember-info">
						<span style="display: block;">往事随风</span>
						<span style="display: block;">推荐人：张三</span>
					</div>
				</div>-->
				
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
			
				$.ready(function(){
					var afterUrl =  window.location.search.substring(1);
					var page_title = decodeURI(afterUrl).split('=');
					doc.title = page_title[1];
					doc.getElementById('title').innerHTML = page_title[1];
				});
			})(mui,document);
		</script>
	</body>

</html>