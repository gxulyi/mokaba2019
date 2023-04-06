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
<meta name="description" content="">
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
	  function findNew(user_basics_id){
	       window.location="<%=basePath%>admin_integr/tofindUser?user_basics_id="+user_basics_id; 
	  }
	  function wait(vnl){
	     var htmlstr="";
	     var applystatus="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     
	     if(object[i].apply_status==5){
	         applystatus="已完成";
	     }
	      /* if(object[i].apply_status==6){
	         applystatus="已删除";
	     } */
          htmlstr+="<tr>"+
                "<td>"+object[i].bonus_extract_apply_id+"</td>"+
                "<td>"+formatDateTimeStr(object[i].apply_add_date)+"</td>"+
                "<td>￥"+object[i].apply_sum.toFixed(2)+"</td>"+
                "<td>"+applystatus+"</td>"+
                "<td><a style='cursor:pointer' onclick='findNew("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+
                "<td>"+object[i].information_compellation+"</td>"+
                "<td>"+object[i].information_card+"</td>"+
                "<td>"+object[i].apply_postscript+"</td>"+
                /* "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
	         		//htmlstr+="<a onclick='updateAdopt1("+object[i].bonus_extract_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+   */  
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  //查询状态为5（已完成）
	  window.onload=function(){
	    var information_card=document.getElementById("number").value;   
	    var information_compellation=document.getElementById("name").value;
	    var paramData;
	    var paramData={'information_card':information_card,'information_compellation':information_compellation}; 
	    var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/adminFindTradingFlow",object,"json","json",wait);
	  };
	  function findnumberANDname(){//根据姓名和身份证条件查询
	    var information_card=document.getElementById("number").value;   
	    var information_compellation=document.getElementById("name").value; 
	    var paramData;
	    var paramData={'information_card':information_card,'information_compellation':information_compellation}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_integr/adminFindTradingFlow",object,"json","json",wait);
	  }
	  function returnlist(){
	    window.location="<%=basePath%>admin_integr/toAdminFindTradingFlow";
	  }
	  //根据状态条件查询
	  function findState(){ 	
	  	var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	  	var paramData;
	    var paramData={'state':selectedVal};
	    var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/adminFindTradingFlow",object,"json","json",wait);
	  }
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
				 <!-- <div class="am-form-group am-margin-left am-fl">
				 <button type="button" onclick="exportExcel('tableExcel')">导出Excel</button>
								<select id="select">
									<option value="">请选择......</option>
									<option value="8">未通过审核</option>
									<option value="7">拒绝打款</option>
								</select>
								<button type="button" onchange="findState()">搜索</button>
							 &nbsp;&nbsp;&nbsp;
							</div> -->
							 <!-- <a onclick="returnlist()">返回列表</a> -->
							<input id="name" style="border:1px solid #55cbd2" type="text" onfocus="if (value =='请输入姓名'){value =''}" onblur="if (value ==''){value='请输入姓名'}" placeholder="请输入姓名"/>
							<input id="number" style="border:1px solid #55cbd2" type="text"  onfocus="if (value =='请输入身份证号码'){value =''}" onblur="if (value ==''){value='请输入身份证号码'}" placeholder="请输入身份证号码"/>
							<button  type="button" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="findnumberANDname()">搜索</button>
				</div>
				<div style="clear: both;"></div>
				<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead id="tableExcel">
									<tr>
										<th class="table-">申请编号</th>
										<th class="table-title">申请时间</th>
										<th class="table-type">申请金额(元)</th>
										<th class="table-author">申请状态</th>
										<th class="table-type">用户编号</th>
										<th class="table-type">用户姓名</th>
										<th class="table-type">身份证号</th>
										<th class="table-author">申请备注</th>
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
				<!-- <hr />
				</form> -->
		</div>
	</div>
	<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
	<!-- </div> -->

	
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
