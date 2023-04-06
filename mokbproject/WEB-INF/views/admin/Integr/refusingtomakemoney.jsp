<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 体现打款</title>
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
<script type="text/javascript" src="js/medicinefood/uitl-string.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script src="file/laydate/laydate.js"></script>
<script type="text/javascript">
      
       function findUser(user_basics_id){
           window.location="<%=basePath%>admin_integr/tofindUser?user_basics_id="+user_basics_id;
        }
	   function wait(vnl){
	     var htmlstr="";
	     var apply_value;//申请金额
	     var apply_receipt_type;//收款方式(1:微信零钱,2用户银行卡)
	     var apply_type;//提现方式（1通过余额提现）
	     var applystatus="";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     if(object[i].apply_status==1){
	         applystatus="审核中";
	     }else if(object[i].apply_status==2){
	         applystatus="已通过";
	     }else if(object[i].apply_status==3){
	         applystatus="已拒绝";
	     }else if(object[i].apply_status==4){
	         applystatus="已删除";
	     }
	     if(object[i].apply_type==1){
	         apply_type="通过余额提现"
	     }else if(object[i].apply_type==2){
	     }
	     if(object[i].apply_receipt_type==1){
	         apply_receipt_type="微信零钱";
	     }else if(object[i].apply_receipt_type==2){
	         apply_receipt_type="用户银行卡";
	     }
	     if(object[i].apply_value!=null){
	         apply_value=object[i].apply_value;
	     }else{
	         apply_value="0.00";
	     }
          htmlstr+="<tr>"+
                "<td><input type='checkbox'/></td>"+
                "<td>"+object[i].withdrawal_apply_id+"</td>"+
                "<td>"+formatDateTimeStr(object[i].apply_add_date)+"</td>"+
                "<td>"+apply_value+"</td>"+
                "<td><a style='cursor:pointer' onclick='findUser("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+
                "<td>"+applystatus+"</td>"+
                "<td>"+apply_receipt_type+"</td>"+
                "<td>"+apply_type+"</td>"+
                "<td>"+object[i].apply_explain+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
                if(object[i].apply_status==1){
	         		htmlstr+="<a onclick='remitWithdrawalApply("+object[i].withdrawal_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 打款</a>"+
	    		    "<a onclick='rejectWithdrawalApply("+object[i].withdrawal_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 拒绝</a>";
	    		 }
	    		 if(object[i].apply_status==2||object[i].apply_status==3){
	         		htmlstr+="<a onclick='("+object[i].withdrawal_apply_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'> 删除</a>"
	    		 }
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
	  }
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  //查询待打款状态
	  window.onload=function(){
	  findWithdrawalApplyToStatus(1);
	  };
	  function findWithdrawalApplyToStatus(apply_status){
	     var paramData={'apply_status':apply_status};
	     var object = JSON.stringify(paramData);
	     ajaxPost("<%=basePath%>admin_withdrawalapply/findwithdrawalapplytostatus",object,"json","json",wait);
	  }
	  //根据单个条件查询
	  function findStore(){
	    var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	  	var paramData;
	    var paramData={'state':selectedVal};
	    var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/adminFindToMoney",object,"json","json",wait);
	  }
	  //根据用户ID查询
	  function findUser_basics_id(){
	    var user_basics_id=uitl_trim(document.getElementById("userIdInput").value);
	    var paramData;
	    var paramData={'user_basics_id':user_basics_id}; 
	    var object = JSON.stringify(paramData);
	    if(user_basics_id!=null && user_basics_id!=""){
	        ajaxPost("<%=basePath%>admin_integr/adminFindToMoney",object,"json","json",wait);
	    }else{
	        alert("请输入用户编号");
	    }
	  }
	  //通过打款状态
	  	function remitWithdrawalApply(withdrawal_apply_id){
  		var paramData;
	  	 if(confirm("确认打款吗？")){
	  	 var reason = prompt('请输入打款备注','');
	  	 object=JSON.stringify({'withdrawal_apply_id':withdrawal_apply_id,'edit_notes':reason});
	  	   ajaxPost("<%=basePath%>admin_withdrawalapply/remitWithdrawalApply",object,"json","json",updateAdopt3);
	    }else{
	    return false;
	    }
	  }
       function updateAdopt3(vnl){
       alert(JSON.stringify(vnl));
    	if(vnl.state==0){
    	alert("打款成功！");
    	window.location.reload();
    	}else{
    	alert("打款失败！");
    	alert(vnl.message);
    	return;
    	}
    }
    //拒绝打款状态
	  	function rejectWithdrawalApply(withdrawal_apply_id){
	  	var reason = prompt('请输入拒绝理由','');
  		var paramData;
  		if(reason){
	  	 if(confirm("确认拒绝打款吗？")){
	  	 var object=JSON.stringify({'withdrawal_apply_id':withdrawal_apply_id,'edit_notes':reason});
	  	   ajaxPost("<%=basePath%>admin_withdrawalapply/rejectWithdrawalApply",object,"json","json",updateRefuse2);
	    }else{
	    return false;
	    }
	    }
    	}
       function updateRefuse2(vnl){
    	if(vnl.state==0){
    	alert("您已拒绝打款！");
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
	//组合查询
	function combinatorial(){
	  var date=new Date(document.getElementById("datetimepicker").value);
	  var datetime = Date.parse(date);
	  var date1=new Date(document.getElementById("datekey").value);
	  var datetime2 = Date.parse(date1);
	  var user_basics_id=document.getElementById("userIdInput").value;
	  var selectObj = document.getElementById("select");
	  var index=selectObj.selectedIndex;
	  var selectedVal = selectObj.options[index].value;
	  var paramData;
	  var paramData={'datetime':datetime,'state':selectedVal,'user_basics_id':user_basics_id,'datetime2':datetime2};
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_integr/adminFindCombinatorial",object,"json","json",wait);
	}
 //日期选择
	laydate.render({
	  elem: '#datetimepicker' //指定元素
	});
	laydate.render({
	  elem: '#datekey' //指定元素
	});
	function dateTime(){
	   var datetimepicker = uitl_trim(document.getElementById("datetimepicker").value);
	   var datekey = uitl_trim(document.getElementById("datekey").value);
	   if(datetimepicker==null || datetimepicker=="" && datekey==null || datekey==""){
	      alert('请选择时间');
	      return;
	   }
	   var date=new Date(datetimepicker);
	   var datetime = Date.parse(date);
	   var date1=new Date(datekey);
	   var datetime2 = Date.parse(date1);
	   var paramData;
	   var paramData={'datetime':datetime,'datetime2':datetime2};                               
	   var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>admin_integr/timeCombination",object,"json","json",wait);
	}
	function dateTime1(){
	   var datetimepicker=uitl_trim(document.getElementById("datetimepicker").value);
	   if(datetimepicker==null||datetimepicker==""){
	   alert('请选择时间');
	   return;
	   }
	   var date=new Date(datetimepicker);
	   var datetime = Date.parse(date);
	   var paramData;
	   var paramData={'datetime':datetime};                               
	   var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>admin_integr/adminFindToMoney",object,"json","json",wait);
	   
	}
/* //年月范围
laydate.render({
  elem: '#years'
  ,type: 'month'
  ,range: true
});
//日期范围
laydate.render({
  elem: '#date'
  ,range: true
}); */
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
				<div class="am-u-md-12 am-cf">
					<div class="am-fl am-cf">
						<div id="test" class="am-btn-toolbar am-fl">
							<input id="datetimepicker"style="border:1px solid #55cbd2"type="text" placeholder="请选择日期">
							<button id="btn" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="dateTime1()" type="button">搜索</button>
							至
							<input id="datekey" type="text"style="border:1px solid #55cbd2" class="demo-input" placeholder="请选择日期">
							<button id="btn" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="dateTime()" type="button">日期组合</button>
						    &nbsp;&nbsp;
							<input  id="userIdInput"style="border:1px solid #55cbd2" placeholder="请输入用户编号"> 
					        <button style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" type="button" onclick="findUser_basics_id()">搜索</button>
					        <select id="select"style="border:1px solid #55cbd2" onchange="findWithdrawalApplyToStatus(this.options[this.selectedIndex].value)">
							  <option value="1">待审核</option>
							  <option value="2">已打款</option>
							  <option value="3">已拒绝</option>
						    </select>	
						<button style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" type="button" onclick="findStore()">搜索</button>
					 </div>
					</div>
				  </div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
					</div>
				</div>
			</div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
									    <th class="table-check"><input type="checkbox" /></th>
										<th class="table-i">申请编号</th>
										<th class="table-title">申请时间</th>
										<th class="table-type">申请金额</th>
										<th class="table-type">用户编号</th>
										<th class="table-author">申请状态</th>
										<th class="table-author">收款方式</th>
										<th class="table-author">提现方式</th>
										<th class="table-author">申请备注</th>
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
				<!-- <hr />
				</form> -->
			</div>
			<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
<!-- 
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
