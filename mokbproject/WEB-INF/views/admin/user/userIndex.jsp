<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script type="text/javascript">
     window.onload=function (){
     
     	getAjax("<%=basePath%>js/medicinefood/jsonData/cache/grade.txt","json",setSelectGrade);
     };
     function setSelectGrade(jsonData){
		var num=1;
	    var selectGrade=document.getElementById("selectGrade");
	    for(var key in jsonData){
	    selectGrade[num]=new Option(jsonData[key],key);
	    num++;
	    }
	};
   function toUserdetails(user_basics_id){
        //alert(user_basics_id);
    	window.location="<%=basePath%>admin_user/toUserdetails?user_basics_id="+user_basics_id; 
    }
	function findGrade(){
    	var selectGrade=document.getElementById("selectGrade");
    	var index = selectGrade.selectedIndex; // 选中索引
    	var text = selectGrade.options[index].text; // 选中文本
    	var value = selectGrade.options[index].value; // 选中值
    	getData(parseInt(value));
    }
    
	function getData(value){
	switch (parseInt(value)) {
			case 0://查询所有会员
			ajaxPost("<%=basePath%>admin_user/findAllUserBasicsAndGrade","","json","json",setInfoValueUserHtml);
			break;
		}
	}

	function setInfoValueUserHtml(data){
    	var userDataList=data.object;
    	var infoValueUser=document.getElementById("infoValueUser");
    	var htmls="";
    	for(var i=0;i<userDataList.length;i++){
    		htmls += "<tr>"+
					 "	<td><input type='checkbox' />"+
					 "	</td>"+
					 "	<td>"+userDataList[i].user_basics_id+"</td>"+
					 "	<td>"+userDataList[i].user_nickname+"</td>"+
					 "	<td>"+formatDateTimeStr(userDataList[i].user_register_data)+"</td>"+
					 "	<td>"+userDataList[i].user_register_address+"</td>"+
					 "	<td>"+userDataList[i].grade_name+"("+userDataList[i].grade_nickname+")"+"</td>"+
					 "	<td>"+
					 "		<div class='am-btn-toolbar'>"+
					 "			<div class='am-btn-group am-btn-group-xs'>"+
					 "				<a class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='toUserdetails("+userDataList[i].user_basics_id+")'>查看详细资料</a>"+  
					 "			</div>"+
					 "		</div>"+
					 "	</td>"+
					 "</tr>";
    	};
    	infoValueUser.innerHTML=htmls;
	}
</script>
</head>
<%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->
<body>

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
							<div class="am-btn-group am-btn-group-xs">
								<a href="admin_user/toAddUser" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增会员</a>
							</div>
						    <div class="am-form-group am-margin-left am-fl">
								<select id="selectGrade">
									<option value="0">查询全部</option>
								</select>
							</div>
							<div class="am-btn-group am-btn-group-xs">
								<a class="am-btn am-btn-default" onclick="findGrade()">查询</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field"> <span
								class="am-input-group-btn"> <a
								class="am-btn am-btn-default" type="button" onclick="alert(1)">搜索</a>
							</span>
						</div>
					</div>
				</div>
				 -->
			</div>
			<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-title">编号</th>
										<th class="table-title">昵称</th>
										<th class="table-title">注册时间</th>
										<th class="table-title">注册地址</th>
										<th class="table-type">会员等级</th>
										<!--<th class="table-author">上级菜单</th>-->
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="infoValueUser"></tbody>
							</table>

							<div class="am-cf">
								共<span id="total_number"></span>条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled"><a href="javascript:void(0);">«</a></li>
										<li class="am-active"><a href="javascript:void(0);">1</a></li>
										<li><a href="javascript:void(0);">2</a></li>
										<li><a href="javascript:void(0);">3</a></li>
										<li><a href="javascript:void(0);">4</a></li>
										<li><a href="javascript:void(0);">5</a></li>
										<li><a href="javascript:void(0);">»</a></li>
									</ul>
								</div>
							</div>
						</form>
				</div>
			</div>

		</div>
		<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
	

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
