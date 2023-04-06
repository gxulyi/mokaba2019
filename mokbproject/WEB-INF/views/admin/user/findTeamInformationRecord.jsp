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
	  function findTeamId(user_basics_id){
	       window.location="<%=basePath%>admin_user/toFindTeamId?user_basics_id="+user_basics_id;
	  }
	  function wait(vnl){
	     var htmlstr="";
	     var object=vnl.object;
	     var recommend_type = "";
	     var teamName = "";
	     if(object.recommend_type==1){
	         recommend_type = "微信扫上级推荐码";
	     }else if(object.recommend_type==2){
	         recommend_type = "后台创建";
	     }else{
	         recommend_type = "暂无信息";
	     }
	     if(object.superior_information_compellation==null){
	         teamName="未知";
	     }else if(object.superior_information_compellation!=null){
	         teamName=object.superior_information_compellation;
	     }
          htmlstr+="<tr>"+
                "<td>"+object.team_num+"</td>"+
                "<td><a style='cursor:pointer' onclick='findTeamId("+object.user_basics_id+")'>"+object.direct_team_num+"</a></td>"+
                "<td>"+object.records_integral+"</td>"+
                "<td>￥"+object.records_bonus.toFixed(2)+"</td>"+
                "<td>"+object.team_consume+"</td>"+
                "<td>"+object.direct_team_consume+"</td>"+
                "<td>"+teamName+"</td>"+
                "<td>"+recommend_type+"</td>"+
               /*  "<td>"+
                "</td>"+  */   
                "</tr> ";  
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  window.onloadd=function(){
	    var user_basics_id=document.getElementById("user_id").value;
	    var paramData;
	    var paramData={'user_basics_id':user_basics_id}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_user/findTeamInformationRecord",object,"json","json",wait);
	  };
	  window.onload=function(){
	     onloadd();
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
				<img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
					<div class="am-u-sm-12">
					<div  id="div" style="display: none" onMouseout="hidden();"><input id="user_id" value="${user_basics_id}"></div>
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-i">团队人数</th>
										<th class="table-title">直接推荐人数</th>
										<th class="table-type">历史积分</th>
										<th class="table-type">历史奖金</th>
										<th class="table-type">团队消费</th>
										<th class="table-author">直接推荐团队消费</th>
										<th class="table-author">推荐人姓名</th>
										<th class="table-author">推荐方式</th>
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
				<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
		</div>
	<!-- </div>

	</div>
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
