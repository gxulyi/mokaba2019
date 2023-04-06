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
<link rel="apple-touch-icon-precomposed"
	href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>

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
								<a href="admin_company/toAddCompanyAward?company_id=${company_id}"><button type="button"
										class="am-btn am-btn-default">
										<span class="am-icon-plus"></span> 新增奖励
									</button>
								</a>
							</div>

							<!--<div class="am-form-group am-margin-left am-fl">
								 <select id="companyTypeSelect">
									<option value="0">所有类别</option>
									<option value="1">总公司</option>
									<option value="2">分公司</option>
								</select>
							</div>
							<div class="am-btn-group am-btn-group-xs">
								<a class="am-btn am-btn-default" onclick="findCompanyShow()"><span
									class="am-icon-plus"></span> 查询</a>
							</div> -->

						</div>
					</div>
				</div>
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
			</div>
			<div class="am-g">
				<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-title">公司编号</th>
										<th class="table-title">奖励名</th>
										<th class="table-title">奖励发放周期</th>
										<th class="table-title">发放时间</th>
										<th class="table-type">添加时间</th>
										<th class="table-type">剩余值</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">

									  <tr>
										<td><input type='checkbox' />
										</td>
										<td>1</td>
										<td>老总用户昵称</td>
										<td>老总真实姓名</td>
										<td>老总身份证号码</td>
										<td>公司类型</td>
										<td>剩余值</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													 <a class="am-btn am-btn-default am-btn-xs am-text-secondary"
														onclick="alert(1)"> <span
														class="am-icon-pencil-square-o"></span> 设置 </a> <a
														class="am-btn am-btn-default am-btn-xs am-text-danger">
														<span class="am-icon-trash-o"></span> 删除 </a>
												</div>
											</div></td>
									</tr>

								</tbody>
							</table>

							<div class="am-cf">
								共<span id="total_number"></span>条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled"><a href="#">«</a>
										</li>
										<li class="am-active"><a href="#">1</a>
										</li>
										<li><a href="#">2</a>
										</li>
										<li><a href="#">3</a>
										</li>
										<li><a href="#">4</a>
										</li>
										<li><a href="#">5</a>
										</li>
										<li><a href="#">»</a>
										</li>
									</ul>
								</div>
							</div>

							<hr />
							<p>注：.....</p>
						</form>
					</div>

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
