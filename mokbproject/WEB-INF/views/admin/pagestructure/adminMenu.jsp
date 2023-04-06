<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp" %>
<!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理 商城</title>
		<meta name="keywords" content="index">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="icon" type="image/png" href="css/template/images/favicon.png">
		<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="stylesheet" href="css/template/amazeui.min.css" />
		<link rel="stylesheet" href="css/template/admin.css">
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				findAdminMenu();
			};

			function findAdminMenu() { //查询左侧菜单栏
				var $statusNum = $("#statusNum option:selected").val();
				//var $statusNum=2;
				var param = JSON.stringify({
					'menu_series': $statusNum
				});
				switch(parseInt($statusNum)) {
					case 1:
						ajaxPost('<%=basePath%>adminPageStructure/findMenuToMenu_series', param, 'json', 'json', setTextValue1);
						break;
					case 2:
						ajaxPost('<%=basePath%>adminPageStructure/findMenuToMenu_series', param, 'json', 'json', setTextValue2);
						break;
				}
			}

			function setTextValue1(jsonData) {
				var object = jsonData.object;
				var textValue = document.getElementById("textValue");
				textValue.innerHTML = "";
				for(var i = 0; i < object.length; i++) {
					var tr = document.createElement("tr"); //创建tr标签
					var td_checkbox = document.createElement("td"); //
					var input_checkbox = document.createElement("input");
					input_checkbox.setAttribute("type", "checkbox");
					td_checkbox.appendChild(input_checkbox);
					var td_menu_name = document.createElement("td");
					td_menu_name.appendChild(document.createTextNode(object[i].menu_name));
					var td_menu_url = document.createElement("td");
					td_menu_url.appendChild(document.createTextNode(object[i].menu_url == null || object[i].menu_url == "null" ? '——' : object[i].menu_url));
					var td_menu_priority = document.createElement("td");
					td_menu_priority.appendChild(document.createTextNode(object[i].menu_priority));
					var td_menu_style = document.createElement("td");
					td_menu_style.appendChild(document.createTextNode(object[i].menu_style));
					var td_operation = document.createElement("td");
					var a_details = document.createElement("a");
					a_details.appendChild(document.createTextNode('详情'));
					a_details.setAttribute("onclick", 'alert(' + object[i].menu_id + ')');
					a_details.setAttribute("class", "am-btn am-btn-default am-btn-xs am-text-secondary");
					var a_delete = document.createElement("a");
					a_delete.appendChild(document.createTextNode('删除'));
					a_delete.setAttribute("onclick", 'removeMenu(' + object[i].menu_id + ')');
					a_delete.setAttribute("class", "am-btn am-btn-default am-btn-xs am-text-danger");
					td_operation.appendChild(a_details);
					td_operation.appendChild(a_delete);
					tr.appendChild(td_checkbox);
					tr.appendChild(td_menu_name);
					tr.appendChild(td_menu_url);
					tr.appendChild(td_menu_priority);
					tr.appendChild(td_menu_style);
					tr.appendChild(td_operation);
					textValue.appendChild(tr);
				};
			}

			function setTextValue2(jsonData) {
				var object = jsonData.object;
				var textValue = document.getElementById("textValue");
				textValue.innerHTML = "";
				for(var i = 0; i < object.length; i++) {
					var tr = document.createElement("tr"); //创建tr标签
					var td_checkbox = document.createElement("td"); //
					var input_checkbox = document.createElement("input");
					input_checkbox.setAttribute("type", "checkbox");
					td_checkbox.appendChild(input_checkbox);
					var td_menu_name = document.createElement("td");
					td_menu_name.appendChild(document.createTextNode(object[i].menu_name));
					var td_menu_url = document.createElement("td");
					td_menu_url.appendChild(document.createTextNode(object[i].menu_url == null || object[i].menu_url == "null" ? '——' : object[i].menu_url));
					//var td_menu_superior_id=document.createElement("td");
					//td_menu_superior_id.appendChild(document.createTextNode(object[i].menu_superior_id));
					var td_menu_priority = document.createElement("td");
					td_menu_priority.appendChild(document.createTextNode(object[i].menu_priority));
					var td_menu_style = document.createElement("td");
					td_menu_style.appendChild(document.createTextNode(object[i].menu_style));
					var td_operation = document.createElement("td");
					var a_details = document.createElement("a");
					a_details.appendChild(document.createTextNode('详情'));
					a_details.setAttribute("onclick", 'alert(' + object[i].menu_id + ')');
					a_details.setAttribute("class", "am-btn am-btn-default am-btn-xs am-text-secondary");
					var a_delete = document.createElement("a");
					a_delete.appendChild(document.createTextNode('删除'));
					a_delete.setAttribute("onclick", 'removeMenu(' + object[i].menu_id + ')');
					a_delete.setAttribute("class", "am-btn am-btn-default am-btn-xs am-text-danger");
					td_operation.appendChild(a_details);
					td_operation.appendChild(a_delete);
					tr.appendChild(td_checkbox);
					tr.appendChild(td_menu_name);
					tr.appendChild(td_menu_url);
					//tr.appendChild(td_menu_superior_id);
					tr.appendChild(td_menu_priority);
					tr.appendChild(td_menu_style);
					tr.appendChild(td_operation);
					textValue.appendChild(tr);
				};
			}

			function toAddMenu() { //添加后台页面菜单栏页面
				loadStackHtml('template-4', '400px', '400px;', function() { //添加层叠div
					var menu_superiorSelect = document.getElementById("menu_superior");
					//当菜单栏有上级菜单栏时显示隐藏的部分内容
					menu_superiorSelect.setAttribute("onchange", "javascript:{if(parseInt($('#menu_superior option:selected').val())!=0){var a;}else{var a;}}");
					//用户点击上级菜单时，将一级菜单的内容加入select中
					//menu_superiorSelect.setAttribute("onclick", "javascript:{if($(this).find('option').length<2){loadSelectMenu_superior(this)};}");
					if($("#menu_superior").length) {
						loadSelectMenu_superior($("#menu_superior"));
					}
					//为确认按钮加入点击事件
					$("#stackAffirmButton").attr("onclick", "addMenu()");
					//菜单url中的值发生改变时查出符合条件的url列表
					$("#menu_url").attr("oninput", "menu_urlOninput(this.value)");
				});
			}

			function loadSelectMenu_superior(select) { //将一级菜单的内容加入select中
				ajaxPost('<%=basePath%>adminPageStructure/findAdminSeries1MenuLeft', "", 'json', 'json', function(jsonData) {
					var object = jsonData.object;
					object.forEach(function(value, index, array) {
						var optionstr = "<option value=" + value.menu_id + ">" + value.menu_name + "</option>";
						$(select).append(optionstr);
					});
				});
			}

			function addMenu() { //添加后台页面菜单
				var menu_name = document.getElementById("menu_name").value; //菜单名字
				var menu_style = document.getElementById("menu_style").value == "" || document.getElementById("menu_style").value == null ? " " : document.getElementById("menu_style").value; //菜单类型样式
				var menu_priority = document.getElementById("menu_priority").value == "" || document.getElementById("menu_priority").value == null ? 99 : document.getElementById("menu_priority").value; //显示顺序 
				var menu_nature = $("#menu_nature option:selected").val(); //上级菜单
				var menu_url = document.getElementById("menu_url").value == "/" ? "" : document.getElementById("menu_url").value; //菜单链接
				var privilege_id = $("#privilege_id").val();
				var param; //保存的菜单栏参数
				if(parseInt($("#menu_superior option:selected").val()) == 0) {
					var menu_series = 1;
					param = JSON.stringify({
						'menu_name': menu_name,
						'menu_style': menu_style,
						'menu_priority': menu_priority,
						'menu_nature': menu_nature,
						'menu_series': menu_series,
						'menu_url': menu_url,
						'privilege_id': privilege_id
					});
				} else {
					var menu_superior_id = $("#menu_superior option:selected").val(); //上级菜单
					var menu_series = 2;
					param = JSON.stringify({
						'menu_name': menu_name,
						'menu_style': menu_style,
						'menu_priority': menu_priority,
						'menu_superior_id': menu_superior_id,
						'menu_url': menu_url,
						'menu_nature': menu_nature,
						'menu_series': menu_series,
						'privilege_id': privilege_id
					});
				}
				ajaxPost('<%=basePath%>adminPageStructure/addMenu', param, 'json', 'json', addMeunCallback);
			}

			function addMeunCallback(jsonData) { //添加后台页面菜单后的回调方法
				alert(jsonData.message);
				location.reload(true);

			}

			function menu_urlOninput(menu_url) { //url值发生改变+
				if(menu_url.indexOf("/") == -1) {
					$("#menu_url").val("/" + $("#menu_url").val());
					return;
				}
				setTimeout(function() { //定时执行已经定义好的方法 脚本
					if($("#menu_url").val() == menu_url) {
						findMenu_url_list();
					};
				}, 1500); //定时执行一次
			}

			function findMenu_url_list() { //根据用户在文本中输入的url链接查询权限
				var menu_url = $("#menu_url").val();
				if(menu_url == "/") {
					$('#menu_url_list').children('ul').html('');
					return;
				}
				var indexOf = menu_url.indexOf('/');
				if(menu_url.indexOf('/', indexOf + 1) == -1) { //如果路径中没有输入‘/’不进行查询
					return;
				}
				$('#menu_url_list').children('ul').html('');
				var param = JSON.stringify({
					"privilege_url": menu_url
				});
				ajaxPost('<%=basePath%>admin_privilege/likeFindPrivilegeToPrivilege_url', param, 'json', 'json', function(jsonData) {
					var object = jsonData.object;
					for(var i = 0; i < object.length; i++) {
						var menu_url_listUl = document.getElementById("menu_url_list").children[0];
						var li = document.createElement("li"); //创建ul下的li 每个li为路径对应的权限信息
						li.setAttribute("privilege_id", object[i].privilege_id + ''); //自定义属性privilege_id 值为权限的id
						li.setAttribute("onclick", 'javascript:{$("#privilege_id").val($(this).attr("privilege_id"));$("#menu_url").val($(this).html());$("#menu_url_list").children("ul").html("");}');
						liText = document.createTextNode(String(object[i].privilege_url)); //标签内容为权限对应的访问路径
						li.appendChild(liText); //元素加入内容
						menu_url_listUl.appendChild(li);
					};
				});
			}

			function removeMenu(menu_id) {
				if(confirm('确认删除吗，删除后无法恢复')) {
					var param = JSON.stringify({
						'menu_id': menu_id
					});
					ajaxPost('<%=basePath%>adminPageStructure/removeMenuOne', param, 'json', 'json', function(jsonData) {
						alert(jsonData.message);
						window.location.reload();
					});

				}
			}
		</script>
	</head>
	<%@ include file="../../template/stack-div.jsp"%>
	<!-- 隐藏的层叠div-->
	<%@ include file="../template/admin-body-header.jsp" %>
	<!-- 内容头部 -->

	<body>
		<div class="am-cf admin-main">
			<!-- sidebar start -->
			<%@ include file="../template/admin-body-sidebar.jsp" %>
			<!-- 侧边内容 -->
			<!-- sidebar end -->
			<!-- content start -->
			<div class="admin-content">
				<%@ include file="../template/admin-content-heder.jsp" %>
				<!-- body 标题 -->
				<div class="am-g">
					<div class="am-u-md-6 am-cf">
						<div class="am-fl am-cf">
							<div class="am-btn-toolbar am-fl">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default" onclick="toAddMenu()"><span class="am-icon-plus"></span> 新增</button>
								</div>

								<div class="am-form-group am-margin-left am-fl">
									<select id="statusNum" onchange="javascript:{if(parseInt(this.options[this.selectedIndex].value)==2){document.getElementById('menu_superior_id_th').style.display='none';document.getElementById('menu_url_th').style.display='';}else{document.getElementById('menu_superior_id_th').style.display='none';document.getElementById('menu_url_th').style.display='';}findAdminMenu();}">
										<!--  <option value="0">所有类别</option>-->
										<option value="1">一级菜单</option>
										<option value="2">二级菜单</option>
									</select>
								</div>
								<div class="am-btn-group am-btn-group-xs">
									<a onclick="statusFind()"><button type="button" class="am-btn am-btn-default">查询</button></a>
								</div>

							</div>
						</div>
					</div>
					<div class="am-u-md-3 am-cf">
						<div class="am-fr">
							<div class="am-input-group am-input-group-sm" style="position: relative;">
								<input type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;">
								<span class="am-input-group-btn"> 
								 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button">
										<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" src="images/sousuo1.png">
									</a>
								</span>
							</div>
						</div>
					</div>
					<!-- 
					<div class="am-u-md-3 am-cf">
				        <div class="am-fr">
				          	<div class="am-input-group am-input-group-sm">
					            <input type="text" class="am-form-field">
				                <span class="am-input-group-btn">
				                  <button class="am-btn am-btn-default" type="button">搜索</button>
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
										<th class="table-check">
											<font size="3"><input type="checkbox"></font>
										</th>
										<th class="table-title" id='menu_name_th'>菜单名</th>
										<th class="table-type" id='menu_url_th' style="">菜单链接</th>
										<th class="table-type" id='menu_superior_id_th' style="display:none">上级菜单</th>
										<th class="table-title" id='menu_priority_th'>菜单优先级</th>
										<th class="table-title" id='menu_style_th'>菜单样式类型</th>
										<!-- <th class="table-type">菜单包含功能数</th>
                						<!--<th class="table-author">上级菜单</th>-->
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">
									<!--  
									<tr>
						             <td>store_picture</td>
						              <td>
						                <div class="am-btn-toolbar">
						                  <div class="am-btn-group am-btn-group-xs">
						                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
						                    <button class="am-btn am-btn-default am-btn-xs am-text-danger"><span class="am-icon-trash-o"></span> 删除</button>
						                  </div>
						                </div>
						              </td>
						            </tr>
						            -->
								</tbody>
							</table>

							<div class="am-cf">
								共<span id="total_number"></span>条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled">
											<a href="#">«</a>
										</li>
										<li class="am-active">
											<a href="#">1</a>
										</li>
										<li>
											<a href="#">2</a>
										</li>
										<li>
											<a href="#">3</a>
										</li>
										<li>
											<a href="#">4</a>
										</li>
										<li>
											<a href="#">5</a>
										</li>
										<li>
											<a href="#">»</a>
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
		<%@ include file="../template/admin-footer.jsp" %>
		<!-- 底部内容 -->

		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="js/template/jquery.min.js"></script>
		<script src="js/template/amazeui.min.js"></script>
		<!--<![endif]-->
		<script src="js/template/app.js"></script>
		<script type="text/javascript">
			var width = document.documentElement.clientWidth || document.body.clientWidth;
			$(".admin-content").css("width", width - 200);
		</script>
	</body>

</html>