<!-- 查询提现记录，开发人：陈文军，2018-04-26 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 提现记录</title>
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
	  function wait(vnl){
	     var htmlstr="";
	     var applystatus="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){ 
	     if(object[i].apply_status==1){
	         applystatus="审核中";
	     }
	     if(object[i].apply_status==2){
	         applystatus="等待用户确认";
	     }
	     if(object[i].apply_status==3){
	         applystatus="待打款";
	     }
	     if(object[i].apply_status==4){
	         applystatus="已打款";
	     }
	     if(object[i].apply_status==5){
	         applystatus="已完成";
	     }
	      if(object[i].apply_status==6){
	         applystatus="已删除";
	     }
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+object[i].bonus_extract_apply_id+"</td>"+
                "<td>"+formatDateTimeStr(object[i].apply_add_date)+"</td>"+
                "<td>"+object[i].apply_sum+"</td>"+
                "<td>"+object[i].receive_bank_card+"</td>"+
                "<td>"+applystatus+"</td>"+
                "<td>"+object[i].apply_postscript+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
	         		//htmlstr+="<a onclick='updateAdopt1("+object[i].bonus_extract_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  function onloadd(){
      var user_basics_id=document.getElementById("user_id").value;
      //alert(user_basics_id);
      //debugger;
      var paramData;
	  var paramData={user_basics_id:user_basics_id};   
	  var object = JSON.stringify(paramData);
	      ajaxPost("<%=basePath%>admin_integr/findBonusExtractOne",object,"json","json",wait);
	  };
	window.onload=function(){
	  onloadd();
	  };
	 
</script>
</head>
<body>
    <div  id="div" style="display: none" onMouseout="hidden();"><input id="user_id" value="${user_basics_id}"></div>
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
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" /></th>
										<th class="table-id">申请编号</th>
										<th class="table-title">申请时间</th>
										<th class="table-type">申请金额</th>
										<th class="table-type">银行卡号</th>
										<th class="table-author">申请状态</th>
										<th class="table-author">申请备注</th>
										<!-- <th class="table-author">操作</th> -->
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
<!-- 	</div>

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
