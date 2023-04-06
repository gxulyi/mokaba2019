<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 用户信息</title>
<meta name="description" content="这是一个 查询商品 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script type="text/javascript">
	  function findUserIdCapital(user_basics_id){//查询购买记录
	       window.location="<%=basePath%>admin_integr/tofindCapitalOne?user_basics_id="+user_basics_id; 
	  }
	  function findUserIdBonus(user_basics_id){//查询提现记录
	       window.location="<%=basePath%>admin_integr/tofindBonusExtractOne?user_basics_id="+user_basics_id;
	  }
	  function findTeamRecord(user_basics_id){//查看团队
	       window.location="<%=basePath%>admin_user/toFindTeamInformationRecord?user_basics_id="+user_basics_id;
	  }
	  function findname(){//根据用户姓名模糊查询
	    var information_compellation=document.getElementById("name").value;
	    /* var information_card=document.getElementById("number").value; */
	    document.getElementById("number").value="";
	    var paramData;
	    var paramData={'information_compellation':information_compellation}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_user/findTeamInformationName",object,"json","json",wait);
	  }
	  function findnumber(){//根据用户身份证查询
	    document.getElementById("name").value="";
	    var information_card=document.getElementById("number").value;   
	    var paramData;
	    var paramData={'information_card':information_card}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_user/findTeamInformationNumber",object,"json","json",wait);
	  }
	  function findReturn(){
	     window.location="<%=basePath%>admin_user/toFindTeamInformation";
	  }
	  
	  function wait(vnl){
	     var htmlstr="";
	     var integral_bonus;
	     var information_card;
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	         //奖金保留两位小数，数据库自动四舍五入，String类型加parseFloat()转换类型
            // var integral_bonus = document.getElementById("money").innerHTML = object[i].integral_bonus.toFixed(2);
           if(object[i].integral_bonus!=null){
              integral_bonus=object[i].integral_bonus.toFixed(2);
           }else if(object[i].integral_bonus=="null" || object[i].integral_bonus==0){
              integral_bonus=0.0;
           }
           if(object[i].information_card!=null){
              information_card=object[i].information_card;
           }else if(object[i].information_card==null || object[i].information_card=="null"){
              information_card="未知";
           }
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+object[i].user_basics_id+"</td>"+
                "<td>"+object[i].information_compellation+"</td>"+
                "<td>"+object[i].grade_name+"</td>"+
                "<td>"+information_card+"</td>"+
                "<td>￥"+integral_bonus+"</td>"+
                "<td>"+object[i].integral_basics+"</td>"+
                "<td>"+object[i].integral_travel+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
	         		"<a onclick='findUserIdCapital("+object[i].user_basics_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 查看购买记录</a>"+
	         		         "<a onclick='findUserIdBonus("+object[i].user_basics_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 查看提现记录</a>"+
	         		         "<a onclick='findTeamRecord("+object[i].user_basics_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 查看团队</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	 /*  document.getElementById("name").innerHTML="";
	  document.getElementById("number").innerHTML=""; */
	  
	  }
	  //查询全部
	  window.onload=function(){
	    var information_compellation=document.getElementById("name").value;
	    var information_card=document.getElementById("number").value;
	    var paramData;
	    var paramData={'information_compellation':information_compellation,'information_card':information_card}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_user/findTeamInformation",object,"json","json",wait);
	  };
	 
	  
</script>
</head>
<body>
	<input type='hidden' id="currentPage" value="" />

	<%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<%@ include file="../template/admin-body-sidebar.jsp"%><!-- 侧边内容 -->
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<%@ include file="../template/admin-content-heder.jsp"%><!-- body 标题 -->
			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl" style="margin-left:20px;">
							<a onclick="findReturn()">返回会员页</a>
						</div>
					</div>
				</div>
				<div class="am-u-md-6 am-cf">
					<div class="am-fr">
						<div class="am-u-md-6 am-input-group am-input-group-sm"  style="position: relative;"	>
							<input id="name" type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;" onfocus="if (value =='请输入姓名'){value =''}" onblur="if (value ==''){value='请输入姓名'}" placeholder="请输入姓名"/> 
							<span class="am-input-group-btn"> 
							 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button"onclick="findname()">
									<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" src="images/sousuo1.png">
								</a>
							</span>
<!-- 							<span -->
<!-- 								class="am-input-group-btn"> -->
<!-- 								<button class="am-btn am-btn-default" type="button" onclick="findname()">搜索</button> -->
<!-- 							</span> -->
						</div>
						<div class="am-u-md-6 am-input-group am-input-group-sm"  style="position: relative;" >
							<input id="number" type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;" onfocus="if (value =='请输入身份证号码'){value =''}" onblur="if (value ==''){value='请输入身份证号码'}" placeholder="请输入身份证号码"/>
							<span class="am-input-group-btn"> 
							 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button"onclick="findnumber()">
									<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" src="images/sousuo1.png">
								</a>
							</span>
							 <!-- <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button" onclick="findnumber()">搜索</button>
							</span> -->
						</div>
					</div>
				</div>
			</div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-ID">编号</th>
										<th class="table-title">姓名</th>
										<th class="table-type">会员等级</th>
										<th class="table-type">身份证号</th>
										<th class="table-type">奖金（元）</th>
										<th class="table-author">晋级积分</th>
										<th class="table-author">旅游积分</th>
										<th class="table-author">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">

								</tbody>
							</table>
							<!-- 页面分页 开始 -->
							<div class="am-cf">
				                                        共<span id="total_number"></span>条记录
				              <div class="am-fr">
				                <ul class="am-pagination">
				                  <li class="am-disabled"><a href="#">«</a></li>
				                  <li class="am-active"><a href="#">1</a></li>
				                  <li><a href="#">2</a></li>
				                  <li><a href="#">3</a></li>
				                  <li><a href="#">4</a></li>
				                  <li><a href="#">5</a></li>
				                  <li><a href="#">»</a></li>
				                </ul>
				              </div>
				            </div>
							<!-- 页面分页 结束 -->
						</form>
						<!-- </li>
						</ul> -->
					</div>
				</div>
			<!-- </form> -->
		</div>
		<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>

	<!-- </div>
	</div> -->

	
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/template/jquery.min.js"></script>
	<script src="js/template/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="js/template/app.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript">
		var width = document.documentElement.clientWidth || document.body.clientWidth;
		$(".admin-content").css("width",width-200);
	</script>
</body>
</html>
