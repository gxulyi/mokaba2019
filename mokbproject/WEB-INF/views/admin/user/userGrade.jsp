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
<!--  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>-->
<script type="text/javascript">
	window.onload=function(){
		ajaxPost("<%=basePath%>admin_user/findAllUserGrade", "", "json","json", setUserGradeHtml);
	};
	function setUserGradeHtml(jsonData) {
		var htmlStr="";
		var object = jsonData.object;
		object.forEach(function(value, index, array) {
					htmlStr+='<tr>'
+ '										<td><input type=\'checkbox\' />'
+ '										</td>'
+ '										<td>'+value.user_grade_id+'</td>'
+ '										<td>'+value.grade_name+'</td>'
+ '										<td>'+(value.grade_describe!=null?value.grade_describe:"")+'</td>'
+ '										  <td>'+value.grade_nickname+'</td>'
+ '										<td>'
+ '											<div class=\'am-btn-toolbar\'>'
+ '												<div class=\'am-btn-group am-btn-group-xs\'>'
+ '													<a'
+ '														class=\'am-btn am-btn-default am-btn-xs am-text-secondary\''
+ '														onclick=\'updateGrade('+value.user_grade_id+')\'> <span'+
'														class=\'am-icon-pencil-square-o\'></span> 修改称呼/描述</a> <a'
+ '														class=\'am-btn am-btn-default am-btn-xs am-text-secondary\''
+ '                                                     href="admin_user/toUserGradeUpgradeCondition?user_grade_id='+value.user_grade_id+'&grade_name='+value.grade_name+'"'+'> <span'+
'														class=\'am-icon-pencil-square-o\'></span> 配置等级升级条件/维持条件 </a>'
+ '												</div>' + '											</div>'
+ '										</td>' + '									</tr>';

				});
				document.getElementById("userGrade").innerHTML=htmlStr;

	}
	//修改会员等级内容
	function updateGrade(id){
		var user_grade_id=id;
		
		window.location="<%=basePath%>admin_user/iframeUpdateGrade?user_grade_id="+user_grade_id;
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
								<a onclick="alert('暂未开通此功能')"><button type="button"
										class="am-btn am-btn-default">
										<span class="am-icon-plus"></span> 新增会员等级
									</button> </a>
							</div>
							<div class="am-btn-group am-btn-group-xs">
								<a onclick="alert('暂未开通此功能')"><button type="button"
										class="am-btn am-btn-default">
										<span class=""></span> 会员等级升级顺序
									</button> </a>
							</div>
							<div class="am-form-group am-margin-left am-fl">
								<select id="selectGrade">
									<option value=0>查询全部</option>
								</select>
							</div>
							<div class="am-btn-group am-btn-group-xs">
								<a class="am-btn am-btn-default" onclick="findGrade()">查询</a>
							</div>
                        </div>
					</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm" style="position: relative;">
							<input type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;">
							 <span class="am-input-group-btn"> 
							 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button" onclick="alert(1)">
									<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" src="images/sousuo1.png">
								</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" /></th>
										<th class="table-title">等级编号</th>
										<th class="table-title">等级名</th>
										<th class="table-title">等级描述</th>
										<th class="table-type">等级昵称</th>
										<!--<th class="table-author">上级菜单</th>-->
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="userGrade">
								</tbody>
							</table>

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

							<hr />
							<p>注：.....</p>
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
