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
<title>后台管理 积分记录</title>
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
<script type="text/javascript" src="js/medicinefood/uitl-string.js"></script>
<script type="text/javascript">
	  function findUser(user_basics_id){
	       window.location="<%=basePath%>admin_integr/tofindUser?user_basics_id="+user_basics_id; 
	  }
	  function wait(vnl){
	     var htmlstr="";
	     var account_type="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     if(object[i].integral_account_type==1){
	          account_type="购买商品";
	     }else{
	       account_type= "奖金提现";
	     }
          htmlstr+="<tr>"+
                "<td>"+object[i].integral_account_id+"</td>"+
                "<td><a style='cursor:pointer' onclick='findUser("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+
                "<td>"+object[i].account_option_name+"</td>"+
                "<td>"+formatDateTimeStr(object[i].account_add_date)+"</td>"+
                "<td>"+object[i].integral_account_explain+"</td>"+
                "<td>"+account_type+"</td>"+
                "<td>"+object[i].integral_trigger+"</td>"+
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  //查询全部
	  window.onload=function(){
	    var paramData;
	    var paramData={"":""}; 
	    var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/findIntegra",object,"json","json",wait);
	  };
	  //流水类型和用户ID组合查询，用户ID也可单项查询
	  function findUserId(){
	    var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	    var user_basics_id=uitl_trim(document.getElementById("userIdInput").value);
	    var paramData;
	    var paramData={'user_basics_id':user_basics_id,'IntegrName':selectedVal}; 
	    var object = JSON.stringify(paramData);
	    if(user_basics_id!=null && user_basics_id!=""){
	        ajaxPost("<%=basePath%>admin_integr/findIntegra",object,"json","json",wait);
	    }else{
	        alert("请输入用户编号");
	    }
	  }
	  //根据流水类型查询
	 function findIntegrName(){
	    var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	  	var paramData;
	    var paramData={'IntegrName':selectedVal};
	    var object = JSON.stringify(paramData);
	    if(selectedVal!="null" && selectedVal!=""){
	       ajaxPost("<%=basePath%>admin_integr/findIntegra",object,"json","json",wait);
	  }else{
	     alert('请选择条件');
	  	}
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
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl">
								<select id="select" style="width:150px;border:1px solid #55cbd2">
									<option value="null">请选择类型</option>
									<option value="奖金">奖金</option>
									<option value="积分">积分</option>
									<option value="旅游积分">旅游积分</option>
								</select>
								<button  style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" type="button" onclick="findIntegrName()">搜索</button>
						</div>
					</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm" style="position: relative;">
							<input id="userIdInput" type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;" placeholder="请输入用户编号">
							 <span class="am-input-group-btn"> 
							 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button">
									<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" onclick="findUserId()" src="images/sousuo1.png">
								</a>
							</span>
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
										<th class="table-id">编号</th>
										<th class="table-type">用户编号</th>
										<th class="table-type">流水类型</th>
										<th class="table-author">更改时间</th>
										<th class="table-type">流水说明</th>
										<th class="table-author">触发原因</th>
										<th class="table-author">订单编号</th>
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
			 </form>  -->
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
