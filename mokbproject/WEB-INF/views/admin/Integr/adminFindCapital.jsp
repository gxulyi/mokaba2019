<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 购买记录</title>
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
	 function findNew(to_user_basics_id){
	       window.location="<%=basePath%>admin_integr/tofindUser?user_basics_id="+to_user_basics_id; 
	  }
	  function wait(vnl){
	     var htmlstr="";
	     var account_type="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     if(object[i].capital_account_type==1){
	          account_type="购买商品";
	     }else{
	       account_type= object[i].capital_account_type;
	     }
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+object[i].capital_account_id+"</td>"+
                "<td><a style='cursor:pointer' onclick='findNew("+object[i].to_user_basics_id+")'>"+object[i].to_user_basics_id+"</a></td>"+
                "<td>"+object[i].fo_user_basics_id+"</td>"+
                "<td>"+object[i].account_explain+"</td>"+
                "<td>"+formatDateTimeStr(object[i].add_account_date)+"</td>"+
                "<td>"+object[i].capital_number+"</td>"+
                "<td>"+object[i].capital_trigger+"</td>"+
                "<td>"+account_type+"</td>"+
                /* "<td><a style='cursor:pointer' onclick='findNew("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+ */
                /* "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
	         		//htmlstr+="<a onclick='updateAdopt1("+object[i].bonus_extract_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+ */    
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  //查询全部
	  window.onload=function(){
	    var paramData;
	    var paramData={"":""}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_integr/adminFindCapital",object,"json","json",wait);
	  };
	  
	  //根据用户ID查询
	  function findUser_basics_id(){
	    var user_basics_id=document.getElementById("userIdInput").value;
	    var paramData;
	    var paramData={'user_basics_id':user_basics_id}; 
	    var object = JSON.stringify(paramData);
	    if(user_basics_id!=null && user_basics_id!=""){
	       ajaxPost("<%=basePath%>admin_integr/adminFindCapital",object,"json","json",wait);
	    }else{
	       alert('请输入用户编号');
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
							<!-- <div class="am-form-group am-margin-left am-fl">
								<select onchange="findStore01(this.value)">
									<option value="">所有类别</option>
									<option value="0">服务类</option>
									<option value="1">定制</option>
								</select>
							</div> -->
						</div>
					</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm" style="position: relative;">
							<input id="userIdInput" type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;" placeholder="请输入用户编号">
							 <span class="am-input-group-btn"> 
							 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button">
									<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" onclick="findUser_basics_id()" src="images/sousuo1.png">
								</a>
							</span>
						</div>
					</div>
				</div>
				<!-- <div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field"> <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button">搜索</button>
							</span>
						</div>
					</div>
				</div> -->
			</div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-id">编号</th>
										<th class="table-title">发起人编号</th>
										<th class="table-type">接收人编号</th>
										<th class="table-type">流水说明</th>
										<th class="table-author">发起时间</th>
										<th class="table-author">金额</th>
										<th class="table-type">数据编号</th>
										<th class="table-author">流水类型</th>
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
				<!-- <hr />
				</form> -->
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
