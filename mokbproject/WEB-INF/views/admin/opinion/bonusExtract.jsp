<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 体现审核</title>
<meta name="description" content="这是一个 查询商品 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<!-- <script type="text/javascript" src="js/schedule.js"></script> -->
<script src="file/laydate/laydate.js"></script>
<script type="text/javascript">
	  function wait(vnl){
	  
	  //debugger;
	  //alert(JSON.stringify(vsi.map));
	     var htmlstr="";
	     var applystatus="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     if(object[i].apply_status==1){
	         applystatus="待审核";
	     }
	     if(object[i].apply_status==3){
	         applystatus="待打款";
	     }
	     if(object[i].apply_status==8){
	         applystatus="拒绝提现申请";
	     }
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+object[i].bonus_extract_apply_id+"</td>"+
                "<td>"+formatDateTimeStr(object[i].apply_add_date)+"</td>"+
                "<td>"+object[i].apply_sum+"</td>"+
                "<td><a style='cursor:pointer' onclick='findUserStae("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+
                "<td>"+applystatus+"</td>"+
                "<td>"+object[i].apply_postscript+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
                if(object[i].apply_status==1){
	         		htmlstr+="<a onclick='updateAdopt1("+object[i].bonus_extract_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 通过</a>"+
	    		    "<a onclick='updateRefuse1("+object[i].bonus_extract_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 拒绝</a>";
	    		 }
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
		
		
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  //查询全部提现申请或按条件查询
	  window.onload=function(){
	   var state=1;
	   var apply_add_date=0;
	   var paramData;
	   var paramData={'state':state}; 
	   var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/adminFindIntegr",object,"json","json",wait);
	  	
	 };
	 //根据状态条件查询
	 function findStore(){
	     var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	  	var paramData;
	    var paramData={'state':selectedVal};
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_integr/adminFindIntegr",object,"json","json",wait);
	  }
	  //根据用户ID查询
	  function findUser_basics_id(){
	    var user_basics_id=document.getElementById("userIdInput").value;
	    var paramData;
	    var paramData={'user_basics_id':user_basics_id}; 
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_integr/adminFindIntegr",object,"json","json",wait);
	  }
	  //通过提现状态
	  	function updateAdopt1(bonus_extract_apply_id){
  		var paramData;
	  	var paramData={'bonus_extract_apply_id':bonus_extract_apply_id};                               
	  	var object = JSON.stringify(paramData);
	  	 if(confirm("确认通过该会员的提现申请吗？")){
	  	   ajaxPost("<%=basePath%>admin_integr/updatebonusstate3",object,"json","json",updateAdopt3);
	    }else{
	    return false;
	    }
	  }
       function updateAdopt3(vnl){
    	if(vnl.state==0){
    	alert("已通过审核！");
    	window.location.reload();
    	}else{
    		alert("系统异常！");
    		return;
    	}
    }
        //拒绝提现状态
	  	function updateRefuse1(bonus_extract_apply_id){
  		var paramData;
	  	var paramData={'bonus_extract_apply_id':bonus_extract_apply_id};                               
	  	var object = JSON.stringify(paramData);
	  	 if(confirm("确认拒绝该会员的提现申请吗？")){
	  	   ajaxPost("<%=basePath%>admin_integr/updatebonusstate8",object,"json","json",updateRefuse2);
	    }else{
	    return false;
	    }
    	}
       function updateRefuse2(vnl){
    	if(vnl.state==0){
    	alert("您已拒绝该会员提现申请！");
    	window.location.reload();
    	}else{
    		alert("系统异常！");
    		return;
    	}
    }
	  //修改提示框
	function wait2(data){
	  	window.location="<%=basePath%>admin_company/tofindCompanyBasics";
	};
     //日期选择
	laydate.render({
	  elem: '#datetimepicker' //指定元素
	});
	function dateTime(){
	   var date=new Date(document.getElementById("datetimepicker").value);
	   var datetime = Date.parse(date);
	   var paramData;
	   var paramData={'datetime':datetime};                               
	   var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>admin_integr/adminFindIntegr",object,"json","json",wait);
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
						<div id="test" class="am-btn-toolbar am-fl">
							 <input id="datetimepicker" type="text" placeholder="请选择日期">
							 <button onclick="dateTime()" type="button">搜索</button>
						</div>
					</div>
					<div class="am-form-group am-margin-left am-fl">
								<select id="select" onchange="findStore()">
									<!-- <option value="">所有状态</option> -->
									<option value="1">待审核</option>
									<option value="3">已通过</option>
									<option value="8">已拒绝</option>
								</select>
							</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field" id="userIdInput" placeholder="请输入用户编号"> 
							<span class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button" onclick="findUser_basics_id()">搜索</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-i">申请编号</th>
										<th class="table-title">申请时间</th>
										<th class="table-type">申请金额</th>
										<th class="table-type">用户编号</th>
										<th class="table-author">申请状态</th>
										<th class="table-author">申请备注</th>
										<th class="table-author">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">

								</tbody>
							</table>
							<div class="am-cf">
								共<span id="total_number"></span>条记录
								<div class="am-fr" id="page_tatal">

									<ul class="am-pagination">
						</form>
						</li>
						</ul>
					</div>
				</div>
				<hr />
				</form>
			</div>

	</div>

	</div>
	</div>

	<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/template/jquery.min.js"></script>
	<script src="js/template/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="js/template/app.js"></script>
</body>
</html>
