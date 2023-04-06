<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-form.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理</title>
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
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script type="text/javascript">
	window.onload = function() {

	};
	function findLikeUser() {//模糊查询用户信息
	    var searchTerms=document.getElementById("findLikeUserInput").value;
	    if(!util_isNotNull(searchTerms)){//未输入搜索词
	    return ;
	    }
		var administrative_id=document.getElementById("administrative_idInput").value;
		var object=JSON.stringify({"searchTerms":searchTerms,"administrative_id":administrative_id});
		ajaxPost('<%=basePath%>admin_searchUser/searchUserBasicsAndWxAndInformation',object,'json','json',loadUserTbody);
	}
	
	function loadUserTbody(jsonData){//加载显示会员 中的内容
	  var htmlStr="";
	  document.getElementById("userTableTbody").innerHTML="";
	  var objectList=jsonData.object;
	  if(objectList==null||objectList.length<1){
	    htmlStr="<tr>"+
	              "<td rowspan='' colspan='8'>暂无符合条件的数据</td> "+
	             "<tr>";
	    document.getElementById("userThead").style.display="none";
	    document.getElementById("userTableTbody").innerHTML=htmlStr;
	    return;
	  }else{
	    document.getElementById("userThead").style="block";
	  }
	  objectList.forEach(function(object,index,array){
	    htmlStr+="<tr>"+
	               "<td><input type='checkbox' /></td>"+
	               "<td>"+
					   "<div class='am-btn-toolbar'>"+
						 "<div class='am-btn-group am-btn-group-xs'>"+
							//"<a class='am-btn am-btn-default' onclick='addAdminstrativeUser(this)'>添加</a>"+
							"<a class='am-btn am-btn-default' onclick='toAddAdminstrativeUser(this)'>添加</a>"+
						"</div>"+
					   "</div>"+
					"</td>"+
					"<td>"+object.user_basics_id+"</td>"+
					"<td>"+object.information_card+"</td>"+
					"<td>"+object.nick_name+"</td>"+
					"<td>"+object.weixin_nickname+"</td>"+
					"<td>"+object.information_compellation+"</td>"+
					"<td>"+object.information_phone+"</td>"+
				 "</tr>";
	 });
	 document.getElementById("userTableTbody").innerHTML=htmlStr;
	}	
	function addAdminstrativeUser(){//添加管理组用户/添加用户权限
	var user_basics_id=document.getElementById("inputDomUid").value;
	var administrative_id=parseInt(document.getElementById("administrative_idInput").value);
	var privilegeIds=document.getElementsByName("privilegeIdToStackHtml");
	var privilege_ids=[];
	privilegeIds.forEach(function(value,index,array){
	privilege_ids[index]=value.value;
	});
	var object=JSON.stringify({"administrative_id":administrative_id,"user_basics_id":user_basics_id,"privilege_ids":privilege_ids});
	ajaxPost('<%=basePath%>admin_privilege/addAdministrativeUser',object,'json','json',function(jsonData){alert(jsonData.message);});
	var trIndex=parseInt(document.getElementById("inputTrIndex").value);//获取显示用户信息的tr下标
	var trDoc= document.getElementById("userTableTbody").childNodes[trIndex];//获取显示用户信息的tr
	removeTr(trDoc);//从显示的tbody中删除此用户信息
	hideStackHtml();
	}
	
	function removeAdminstrativeUser(){//移除管理组用户
	var user_basics_id=document.getElementById("inputDomUid2").value;//用户id
	var administrative_id=parseInt(document.getElementById("administrative_idInput").value);//管理组id
	var stackCheckbox=document.getElementById('stackCheckbox');//是否移除用户权限选择按钮
	var privilege_ids=[];//权限id数组
	if(stackCheckbox.checked){
	var privilegeIds=document.getElementsByName("privilegeIdToStackHtml2");
	privilegeIds.forEach(function(value,index,array){
	privilege_ids[index]=value.value;
	});
	}
	var object=JSON.stringify({"administrative_id":administrative_id,"user_basics_id":user_basics_id,'privilege_ids':privilege_ids});
	ajaxPost('<%=basePath%>admin_privilege/removePrivilegeAdministrativeUser',object,'json','json',function(jsonData){alert(jsonData.message);});
	var inputTrIndex2=parseInt(document.getElementById("inputTrIndex2").value);//获取显示用户信息的tr下标
	//var trDoc= document.getElementById("adminstrativeTbody").childNodes[inputTrIndex2];//获取显示用户信息的tr
	var trDoc= document.getElementById("adminstrativeTbody").children[inputTrIndex2];//获取显示用户信息的tr
	removeTr(trDoc);//删除前端权限组已有用户的展示
	hideStackHtml();//隐藏层叠div
	}
	function getTrToA(aTag){//通过a签标获取所属的tr
	var trDoc=aTag.parentNode.parentNode.parentNode.parentNode;
	return trDoc;
	}
	function removeTr(trDoc){//移动tr标签
	var trDocTbody=trDoc.parentNode;//获取tr所在的父级tbody
	var num=trDocTbody.id=='adminstrativeTbody'?1:2;
	switch (parseInt(num)) {//1为移除管理组。2为添加进管理组;
	case 1:
		trDocTbody.removeChild(trDoc);//将用户从信息从当前管理组删除
		break;
	case 2:
		trDocTbody.removeChild(trDoc);//将用户从信息从用户显示信息中删除
		trDoc.removeChild(trDoc.children[1]);
		var aTag=document.createElement("a");
		var td=document.createElement("td");
		var div=document.createElement("div");
		div.classList.add("am-btn-toolbar");
		var div1=document.createElement("div");
		div1.classList.add("am-btn-group");
		div1.classList.add("am-btn-group-xs");
		aTag.classList.add("am-btn");
		aTag.classList.add("am-btn-default");
		aTag.onclick=function(){toRemoveAdminstrativeUser(this);};
		aTag.innerHTML="移除";
		div1.appendChild(aTag);
		div.appendChild(div1);
		td.appendChild(div);
		trDoc.appendChild(td);
		var adminstrativeTbody=document.getElementById("adminstrativeTbody");
		adminstrativeTbody.appendChild(trDoc);
		break;
    default:
		break;
	}
	}
</script>
<script type="text/javascript">
function toAddAdminstrativeUser(aTag){//转到添加管理组用户页面
    var stackOperateRecord=document.getElementById("stackOperateRecord");
    var stackOperateRecordNum= parseInt(stackOperateRecord.value);//上次显示层叠div的操作 1为添加，2为移除
   if(stackOperateRecordNum==2){
       emptystackHtmlTextDiv();//清楚层叠div加载的内容
       stackOperateRecord.value=1;
    }else if(stackOperateRecordNum==1){
    var StackHtmlTbody=document.getElementById("StackHtmlTbody");
    StackHtmlTbody.innerHTML='';//清除之前的动态的内容
    }else{
    stackOperateRecord.value=1;
    }
    //加载层叠div
	loadStackHtml('template-1','600px','400px',function(){
	var options=document.getElementById("privilegeSelect").options;//获取权限select
	var privilegeJsonDatas=[];//权限数据集合
	for(var i=0;i<options.length;i++){
	var privilegeJsonData={'privilege_id':options[i].value,'privilege_name':options[i].text,};//将权限信息创建成json对象
	privilegeJsonDatas.push(privilegeJsonData);
	}
	var trDoc=getTrToA(aTag);//获取点击的tr
	var inputTrIndex=uilt_getDomIndexToChild(trDoc);
	var user_basics_id=parseInt(trDoc.children[2].innerHTML);//获取数据中的用户id
	var jsonData={'object':privilegeJsonDatas,'user_basics_id':user_basics_id,'inputTrIndex':inputTrIndex};
	var StackHtmlTbody=document.getElementById("StackHtmlTbody");
	showStackHtmlTbodyAdd(jsonData);
	});
}


function showStackHtmlTbodyAdd(jsonData){//动态显示层叠div中tbody的内容
  var StackHtmlTbody=document.getElementById("StackHtmlTbody");
  //var htmlTextTemplate1=document.getElementById("htmlTextTemplate1");
  object=jsonData.object;
  var inputDomUid=document.createElement("input");//创建值为用户id的隐藏input
  inputDomUid.id="inputDomUid";
  inputDomUid.value=jsonData.user_basics_id;
  inputDomUid.type='hidden';
  var inputTrIndex=document.createElement('input');//创建值为选中数据下标的隐藏input
  inputTrIndex.id='inputTrIndex';
  inputTrIndex.value=jsonData.inputTrIndex;
  inputTrIndex.type='hidden';
  for(var i=1;i<object.length;i++){
  var value=object[i];
  var trDom=document.createElement("tr");//创建展示每条权限数据的tr
  var tdDomPName=document.createElement("td");//创建显示权限名字的td
  var tdDomButton=document.createElement("td");//传教包含去除此条权限数据按钮的td
  var buttonRemoveRemoveTrToTd=document.createElement("button");//创建删除此条数据的按钮
  var inputDomPId=document.createElement("input");//创建值为权限id的隐藏input
  inputDomPId.type='hidden';
  inputDomPId.name='privilegeIdToStackHtml';//为隐藏input的name赋值
  inputDomPId.value=value.privilege_id;//为inputDomPId赋值为权限id
  tdDomPName.innerHTML=value.privilege_name;//将显示名字的td赋值内容
  buttonRemoveRemoveTrToTd.setAttribute("onclick","removeTrToTd(this)");//为删除按钮绑定方法
  buttonRemoveRemoveTrToTd.innerHTML='-';//为删除按钮设置内容
  tdDomButton.appendChild(buttonRemoveRemoveTrToTd);//将删除按钮添加进td
  trDom.appendChild(tdDomPName);
  trDom.appendChild(tdDomButton);
  trDom.appendChild(inputDomPId);
  StackHtmlTbody.appendChild(trDom);//添加进显示的内容
  };
  StackHtmlTbody.appendChild(inputDomUid);//将用户id添加添加为隐藏inpu
  StackHtmlTbody.appendChild(inputTrIndex);//将用户数据下标添加添加隐藏inpu
}	
function removeTrToTd(objectNode){//删除层叠div中table->tboyd中的一个tr
  var td=getTbodyInTd(objectNode);//通过传入节点获取td
  var tr=td.parentNode;//删除的tr
  var tbody=tr.parentNode;//删除tr所在的他tbody
  tbody.removeChild(tr);//删除tbody下中的一个tr
  }
function getTbodyInTd(objectNode){//通过objectNode获取表单内容中的td标签
  var td=objectNode.parentNode;
  return td;
  }	
function toRemoveAdminstrativeUser(bTag){
    var stackOperateRecord=document.getElementById("stackOperateRecord");
    var stackOperateRecordNum= parseInt(stackOperateRecord.value);//上次显示层叠div的操作 1为添加，2为移除
    if(stackOperateRecordNum==1){
       emptystackHtmlTextDiv();//清楚层叠div加载的内容
       stackOperateRecord.value=2;
    }else if(stackOperateRecordNum==2){//清除上次加载的动态内容
     var StackHtmlTbody=document.getElementById("StackHtmlTbody2");
     StackHtmlTbody.innerHTML='';//清除之前的内容
    }else{
      stackOperateRecord.value=2;
    }
    //加载层叠div
	loadStackHtml('template-2','600px','400px',function(){
	var options=document.getElementById("privilegeSelect").options;//获取权限select
	var privilegeJsonDatas=[];//权限数据集合
	for(var i=0;i<options.length;i++){
	var privilegeJsonData={'privilege_id':options[i].value,'privilege_name':options[i].text,};//将权限信息创建成json对象
	privilegeJsonDatas.push(privilegeJsonData);
	}
	var trDoc=getTrToA(bTag);//获取点击的tr
	var trIndex=uilt_getDomIndexToChild(trDoc);
	var user_basics_id=parseInt(trDoc.children[1].innerHTML);//获取数据中的用户id
	var jsonData={'object':privilegeJsonDatas,'user_basics_id':user_basics_id,'trIndex':trIndex};
	var StackHtmlTbody=document.getElementById("StackHtmlTbody2");
	showStackHtmlTbodyRemove(jsonData);
  });	
}
function showStackHtmlTbodyRemove(jsonData){//动态显示层叠div中tbody的内容
  var StackHtmlTbody=document.getElementById("StackHtmlTbody2");
  //var htmlTextTemplate1=document.getElementById("htmlTextTemplate1");
  object=jsonData.object;
  var inputDomUid=document.createElement("input");//创建值为用户id的隐藏input
  inputDomUid.id="inputDomUid2";
  inputDomUid.value=jsonData.user_basics_id;
  inputDomUid.type='hidden';
  var inputTrIndex=document.createElement('input');//创建值为选中数据下标的隐藏input
  inputTrIndex.id='inputTrIndex2';
  inputTrIndex.value=jsonData.trIndex;
  inputTrIndex.type='hidden';
  for(var i=1;i<object.length;i++){
  var value=object[i];
  var trDom=document.createElement("tr");//创建展示每条权限数据的tr
  var tdDomPName=document.createElement("td");//创建显示权限名字的td
  var tdDomButton=document.createElement("td");//传教包含去除此条权限数据按钮的td
  var buttonRemoveRemoveTrToTd=document.createElement("button");//创建删除此条数据的按钮
  var inputDomPId=document.createElement("input");//创建值为权限id的隐藏input
  inputDomPId.type='hidden';
  inputDomPId.name='privilegeIdToStackHtml2';//为隐藏input的name赋值
  inputDomPId.value=value.privilege_id;//为inputDomPId赋值为权限id
  tdDomPName.innerHTML=value.privilege_name;//将显示名字的td赋值内容
  buttonRemoveRemoveTrToTd.setAttribute("onclick","removeTrToTd(this)");//为删除按钮绑定方法
  buttonRemoveRemoveTrToTd.innerHTML='-';//为删除按钮设置内容
  tdDomButton.appendChild(buttonRemoveRemoveTrToTd);//将删除按钮添加进td
  trDom.appendChild(tdDomPName);
  trDom.appendChild(tdDomButton);
  trDom.appendChild(inputDomPId);
  StackHtmlTbody.appendChild(trDom);//添加进显示的内容
  };
  StackHtmlTbody.appendChild(inputDomUid);//将用户id添加添加为隐藏inpu
  StackHtmlTbody.appendChild(inputTrIndex);//将用户数据下标添加添加隐藏inpu
}	
</script>
</head>

<body >
     <input type="hidden" id="stackOperateRecord" value='3'>
    <%@ include file="../../template/stack-div.jsp"%><!-- 隐藏的层叠div-->
    <%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->
	<div id="mainAdminDiv" class="am-cf admin-main">
		<!-- sidebar start -->
		<%@ include file="../template/admin-body-sidebar.jsp"%><!-- 侧边内容 -->
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<%@ include file="../template/admin-content-heder.jsp"%><!-- body 标题 -->
			<img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
			<div class="am-g">
				<div class="am-u-md-6 am-cf" style="width:90%">
					<div style="float:left;width:50%">
					    <input type="hidden" id="administrative_idInput" value="${privilegeAdministrativeAndPgAndP.privilegeAdministrativeEntity.administrative_id }">
						<span>${privilegeAdministrativeAndPgAndP.privilegeAdministrativeEntity.administrative_name}：</span>
						<textarea rows="" cols="" style="width:80%;resize:none;border:1px solid #394a59;"
							readonly="readonly">${privilegeAdministrativeAndPgAndP.privilegeAdministrativeEntity.administrative_describe}
          				</textarea>
					</div>
					<div style="float:left;margin-right: 30px;">
						<select style="border:1px solid #394a59;" onchange="javascript:{this.selectedIndex=0 ;}" onclick="">
							<option>共包含权限集
								${fn:length(privilegeAdministrativeAndPgAndP.privilegeGatherEntityList)}个</option>

							<c:if
								test="${!empty privilegeAdministrativeAndPgAndP.privilegeGatherEntityList }">
								<c:forEach
									items="${privilegeAdministrativeAndPgAndP.privilegeGatherEntityList }"
									var="privilegeGatherEntity">
									<option value=${privilegeGatherEntity.privilege_gather_id }>
										${privilegeGatherEntity.privilege_gather_name }</option>

								</c:forEach>
							</c:if>

						</select>
					</div>
					<div style="float:left;">
						<select id="privilegeSelect" style="border:1px solid #394a59;" onchange="javascript:{this.selectedIndex=0 ;}">
							<option>包含以下权限${fn:length(privilegeAdministrativeAndPgAndP.privilegeEntityList)}个</option>
							<c:if
								test="${!empty privilegeAdministrativeAndPgAndP.privilegeEntityList }">
								<c:forEach
									items="${privilegeAdministrativeAndPgAndP.privilegeEntityList }"
									var="privilegeEntity">
									<option value=${privilegeEntity.privilege_id }>
										${privilegeEntity.privilege_operate_name }</option>
								</c:forEach>
							</c:if>
						</select>
					</div>

				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr"></div>
				</div>
			</div>
			<hr style="width:97%;margin:20px auto;height: 1px;border-top:2px solid #55cbd2;" />
			<div class="am-g">
				<div class="am-u-sm-12" >
					<div style="width: 49%;float: left;">
						<div style="height: 30px; margin-bottom: 20px;">
							&nbsp;&nbsp;<span>管理组当前用户：</span>
							<button style="margin-left: 300px;display:none" id="adminstrativeButton">(将选中用户移除管理组)=&gt;</button>
						</div>
						<table id="adminstrativeTable" border="1" class="am-table am-table-striped am-table-hover table-main">
						    <thead id="adminstrativeThead">
						       <c:if test="${!empty uEntityList }">
						        <tr>
						          <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,checkName)"></th>
						          <th>编号</th>
							      <th>身份证号</th>
							      <th>昵称</th>
							      <th>微信昵称</th>
							      <th>真实姓名</th>
							      <th>手机号码</th>
							      <th>操作</th>
							    </tr>
							   </c:if>
						   </thead>
							<tbody id="adminstrativeTbody">
							  <c:if test="${!empty uEntityList }">
							   <c:forEach  items="${uEntityList }" var="uEntity" >
							    <tr>
								  <td><input type="checkbox"></td>
								  <td> ${uEntity.user_basics_id }</td>
								  <td>${uEntity.information_card }</td>
								  <td>${uEntity.nick_name }</td>
								  <td>${uEntity.weixin_nickname }</td>
								  <td>${uEntity.information_compellation }</td>
								  <td>${uEntity.information_phone }</td>
								  <td>
								    <div class="am-btn-toolbar">
								      <div class="am-btn-group am-btn-group-xs">
								        <a class="am-btn am-btn-default" onclick="toRemoveAdminstrativeUser(this)">移除</a>
								      </div>
								    </div>
								  </td>
								</tr>
							   </c:forEach>
							  </c:if>
							</tbody>
						</table>
					</div>
					<div
						style="width: 49%;float: right;">
						<!--  <div class="am-input-group am-input-group-sm">
				            <input type="text" class="am-form-field">
				                <span class="am-input-group-btn">
				                  <button class="am-btn am-btn-default" type="button">搜索</button>
				                </span>
				          </div>-->
						<div style="height: 50px; ">
							&nbsp;&nbsp;
							<button id="userButton" style="display:none">&lt;=(将选中用户加入管理组)：</button>
							<div style="float: left; ">
								<input id="findLikeUserInput"
									placeholder="支持身份证号，用户昵称，用户真实姓名，用户id搜索" type="text"
									style="text-align:center;width:;border:1px solid #55cbd2;" class="" />
								<button style="border-color:#55cbd2;" class="am-btn am-btn-default" type="button"
									onclick="findLikeUser()">搜索</button>
							</div>


						</div>
						<table border="1" id="userTable" class="am-table am-table-striped am-table-hover table-main">
							<thead id="userThead" style="display:none">
							  <tr>
							    <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,checkName)"></th>
							    <th>操作</th>
							    <th>编号</th>
							    <th>身份证号</th>
							    <th>昵称</th>
							    <th>微信昵称</th>
							    <th>真实姓名</th>
							    <th>手机号码</th>
							  </tr>
							</thead>
							<tbody id="userTableTbody">

							</tbody>
						</table>
					</div>

				</div>
		<!-- 		<div>--------------------</div> -->
			</div>
		</div>
		<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
	<script src="js/template/amazeui.min.js"></script>
	<script type="text/javascript">
		var width = document.documentElement.clientWidth || document.body.clientWidth;
		$(".admin-content").css("width",width-200);
	</script>
</body>
</html>
