<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="js/jquery-form.js" ></script> 
  <script type="text/javascript" src="js/ajax.js"></script>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript">
  window.onload=function(){
    findPrivilege(0);
  };
  function updateOperationLog(is_operation_log){
  debugger;
  is_operation_log=parseInt(is_operation_log);
  var operation_type=document.getElementById("operation_type").value;
  if(operation_type==0){
  alert("请选择操作类型!");
  return;
  }
  var checkAll=[];//需要设置的复选框
  var checks=document.getElementsByName("checkName");//获取所有复选框
  for(var index=0;index<checks.length;index++){
    console.log("index:"+index);
    if(checks[index].checked){//复选框被选中
     checkAll.push(checks[index].value);//数据需要设置
    }
   }
  var object=JSON.stringify({"is_operation_logs":checkAll,is_operation_log:is_operation_log,operation_type:operation_type});
  
  ajaxPost("<%=basePath%>operation_log/updateOperationLog",object,"json","json",ifSuccess);
  }
  function ifSuccess(data){
  	if(data.state==0){
  		alert("添加成功!");
  		ajaxPost("<%=basePath%>admin_privilege/findAllPrivilegeAdmin","","json","json",showTbodyText);
  	}else{
  		alert("添加失败!");
  	}
  }
  
  
  
  function updatePrivilegeVerify(operationNum){//设置权限是否需要访问验证
  operationNum=parseInt(operationNum);
  var checkAll=[];//需要设置的复选框
  var checks=document.getElementsByName("checkName");//获取所有复选框
  //for(index in checks){
  for(var index=0;index<checks.length;index++){
    console.log("index:"+index);
    if(checks[index].checked){//复选框被选中
     var privilege_verify=checks[index].getAttribute("privilege_verify");//获取动态加载时此数据privilege_verify属性，privilege_verify属性记录的值为是否需要访问验证
     if(parseInt(privilege_verify)!=1&&operationNum==1){//此数据没有设置需要访问权限验证并且操作为设置权限为需要验证
     checkAll.push(checks[index].value);//数据需要设置
     }
     if(parseInt(privilege_verify)==1&&operationNum==0){//此数据需要访问权限验证并且操作为设置权限为不需验证
      checkAll.push(checks[index].value);//数据需要设置
     }
    }
   }
  var object=JSON.stringify({"privilegeIds":checkAll});
  if(checkAll.length<1){
  alert('请选择操作的权限');
  return;
  }
  if(parseInt(operationNum)==1){//设置权限为需要验证
  ajaxPost("<%=basePath%>admin_privilege/joinPrivilegeVerify",object,"json","json",function(jsonData){alert(jsonData.message);findPrivilege();});
  }else{//设置权限为不需验证
  ajaxPost("<%=basePath%>admin_privilege/joinPrivilegeVerifyContrary",object,"json","json",function(jsonData){alert(jsonData.message);findPrivilege();});
  }
  
  }
  
  
  
  /**function getCheckAll(operationNum){
  if(operationNum==1){//将权限设置为需要验证
   var checkAll=[];//选中复选框
   var checkAllContrary=[];//未选中复选框
   var checks=document.getElementsByName("privilegeId");
   for(index in checks){
    if(checks[index].checked){
     checkAll.push(checks[index].value);
    }else{
    checkAllContrary.push(checks[index].value);
    }
   }
   
  }else{//将权限设置为不需验证
  }
  }**/

  function findPrivilege(){//查询权限
  var privilegeSelect=document.getElementById("privilegeSelect");
  var index=privilegeSelect.selectedIndex;
  var value=parseInt(privilegeSelect.options[index].value);
  switch (value) {
case 0://查询全部
       ajaxPost("<%=basePath%>admin_privilege/findAllPrivilege","","json","json",showTbodyText);
	break;
case 1://后台权限
	   ajaxPost("<%=basePath%>admin_privilege/findAllPrivilegeAdmin","","json","json",showTbodyText);
	break;
case 2://查询pc权限
	
	break;
case 3://微信公众号权限
	
	break;
case 4://app权限
	
	break;
case 5://无需验证的权限
	
	break;
case 6://需要访问验证的权限
	
	break;

default://查询全部
ajaxPost("<%=basePath%>admin_privilege/findAllPrivilege","","json","json",showTbodyText);
	break;
  }
}
  function showTbodyText(jsonData){//tbody显示异步查询出的信息
  var object=jsonData.object;
  var textValue="";
  object.forEach(function(value,index,array){
  var privilege_url=value.privilege_url==null?"——":value.privilege_url;
  var privilege_operate_name=value.privilege_operate_name==null?"——":value.privilege_operate_name;
  var privilege_describe=value.privilege_describe==null?"——":value.privilege_describe;
  var privilege_verify=value.privilege_verify==1?"是":"否";
  var is_page=value.is_page==1?"是":"否";//0不分页,1分页
  var is_operation_log=value.is_operation_log==1?"是":"否";//0不记录操作,1记录操作
  var operation_type=value.operation_type;//操作类型(1增加,2删除,3修改,4查询)
  if(operation_type==1){
  	operation_type="新增";
  }
  else if(operation_type==2){
  	operation_type="删除";
  }
  else if(operation_type==3){
  	operation_type="修改";
  }
  else if(operation_type==4){
  	operation_type="查询";
  }
  var privilege_code;
  switch (parseInt(value.privilege_code_num)) {
case 1:
	privilege_code="后台权限";
	break;
case 2:
	privilege_code="pc权限";
	break;
case 3:
	privilege_code="微信权限";
	break;
case 4:
	privilege_code="app权限";
	break;
case 5:
	privilege_code="无需验证的权限";
	break;
case 6:
	privilege_code="需验证的权限";
	break;
default:
    privilege_code="未定义";
	break;
}
  textValue+="<tr>"+
             
              "<td><input type='checkbox' privilege_verify='"+value.privilege_verify+"'name='checkName' value='"+value.privilege_id+"'/></td>"+
              "<td>"+privilege_url+"</td>"+ 
              "<td>"+privilege_operate_name+"</td>"+ 
              "<td>"+is_page+"</td>"+ 
              "<td>"+is_operation_log+"</td>"+ 
              "<td>"+operation_type+"</td>"+ 
              "<td>"+privilege_verify+"</td>"+   
              "<td>"+privilege_describe+"</td>"+ 
              "<td>"+privilege_code+"</td>"+   
              "</tr>";
   });
  document.getElementById("tbodyText").innerHTML=textValue;
  
  
  }
  function renewalControllerPrivilegeData(){//加载更新权限接口弹出页面。（更新权限信息）
  loadStackHtml('template-3','400px','300',function(){
  $("#template-3Button").attr("onclick","renewalPrivilege()");
  });
  
  }
  function renewalPrivilege(){//更新权限接口
  var savePrivilegeInfo= document.getElementById("savePrivilegeInfo").checked;
  var deletePrivilege= document.getElementById("deletePrivilege").checked;
  var updateOperateName=document.getElementById("updateOperateName").checked;
  var param=JSON.stringify({"savePrivilegeInfo":savePrivilegeInfo,"deletePrivilege":deletePrivilege,"updateOperateName":updateOperateName});
  ajaxPost("<%=basePath%>admin_privilege/renewalControllerPrivilegeData",param,"json","json",renewalInfo);
  }
  function renewalInfo(jsonData){
  var object = jsonData.object;
  alert(JSON.stringify(object));
  var privilegeNew=parseInt(object.privilegeNew);//新增权限数
  var privilegeOriginal=parseInt(object.privilegeOriginal);//现有权限数
  var privilegeRemoveNum=parseInt(object.privilegeRemoveNum);//被移除的权限数
  var privilegeUpdateNum=parseInt(object.privilegeUpdateNum);//被更改的权限数
  var privilegeNowNum=parseInt(object.privilegeNowNum);//已有权限数
  var str="";
  str=privilegeNew>0?str+"新增权限："+privilegeNew+"条":str;
  //str=privilegeOriginal>0?str+"现有权限："+privilegeNew+"条":str;
  str=privilegeRemoveNum>0?str+"' \n '被移除的权限："+privilegeRemoveNum+"条":str;
  str=privilegeUpdateNum>0?str+"' \n '被更改的权限："+privilegeUpdateNum+"条":str;
  //str=privilegeNowNum>0?str+"已有权限："+privilegeNew+"条":str;
  alert(str);
  window.location.reload(false);
  }
    
  function toAddPrivilegeGroupIndex(){//前往加载添加权限组页面
  document.getElementById("addPrivilegeGroupIndex").style.display="block";
  document.getElementById("mainAdminDiv").style.opacity=0.3;
   var checkAll=[];//选中复选框
   var checkAllContrary=[];//未选中复选框
   var checks=document.getElementsByName("checkName");
   for(index in checks){
    if(checks[index].checked){
     checkAll.push(checks[index].value);
    }else{
    checkAllContrary.push(checks[index].value);
    }
   }
   if(checkAll.length>0){//有选中的复选框
    var object=JSON.stringify({"privilegeIds":checkAll});
   ajaxPost("<%=basePath%>admin_privilege/findPrivilegesToPrivilegeIds",object,"json","json",showAddGroupPrivilegeTbody);
   }
  }
  function closePrivilegeGroupIndex(){//取消添加权限组
  document.getElementById("addPrivilegeGroupIndex").style.display="none";
  document.getElementById("mainAdminDiv").style.opacity="";
  }
  
  function addPrivilegeGroupIndex(){//添加权限组
  var privilegeSelect=document.getElementById("privilegeSelect").options[document.getElementById("privilegeSelect").selectedIndex].value;
  var privilege_gather_type=privilegeSelect==1||privilegeSelect=='1'?1:2;
  var groupName=document.getElementById("groupName").value;//权限组名称
  var groupDescribe=document.getElementById("groupDescribe").value;//权限组描述
  var privilegeIdToTr=document.getElementsByName("privilegeIdToTr");
  privilegeIds=[];
  privilegeIdToTr.forEach(function(value,index,array){
  privilegeIds[index]=value.value;
  });
  var object=JSON.stringify({"privilegeIds":privilegeIds,"gatherName":groupName,"gatherDescribe":groupDescribe,"privilege_gather_type":privilege_gather_type});
  ajaxPost("<%=basePath%>admin_privilege/addPrivilegeGatherAndPgp",object,"json","json",function(jsonData){alert(jsonData.message);location.reload();});
  }
  
  function showAddGroupPrivilegeTbody(jsonData){//加载显示添加权限的页面数据
  var object=jsonData.object;
  var addGroupPrivilegeTbody=document.getElementById("addGroupPrivilegeTbody");
  var TbodyHtmlStr="";
  object.forEach(function(value,index,array){
  var privilege_code;
  switch (parseInt(value.privilege_code_num)) {
case 1:
	privilege_code="后台权限";
	break;
case 2:
	privilege_code="pc权限";
	break;
case 3:
	privilege_code="微信权限";
	break;
case 4:
	privilege_code="app权限";
	break;
case 5:
	privilege_code="无需验证的权限";
	break;
case 6:
	privilege_code="需验证的权限";
	break;
default:
    privilege_code="未定义";
	break;
}
  TbodyHtmlStr+="<tr>"+ 
                "<input type='hidden' name='privilegeIdToTr' value="+value.privilege_id+">"+
                "<td>"+value.privilege_operate_name+"</td>"+
                "<td>"+privilege_code+"</td>"+  
                "<td><button onclick='removeTrToTd(this)'>-</button></td>"+
                "<tr>";
  
  });
  addGroupPrivilegeTbody.innerHTML=TbodyHtmlStr;
  }
  function removeTrToTd(objectNode){//删除单个tr
  var td=getTbodyInTd(objectNode);
  var tr=td.parentNode;
  var tbody=tr.parentNode;
  tbody.removeChild(tr);
  }
  </script>
  <script type="text/javascript">
  function getTbodyInTd(objectNode){
  var td=objectNode.parentNode;
  return td;
  }
  </script>
</head>
<body>
<%@ include file="../../template/stack-div.jsp"%><!-- 隐藏的层叠div-->
<div id="addPrivilegeGroupIndex" style="width: 100%;height: 100%; z-index:99999; position:fixed;display:none;">
<div style="background-color: #f5f5f5;  width:650px ; height:500px; z-index:99999;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%); border:1px solid #55cbd2;border-radius:5px;">
          <div style="text-align: center;background:#55cbd2;line-height: 40px;">
            <font style="color:#fff;font-size: 20px; font-weight:1000;">新增权限组</font>
          </div>
          <div style="margin-top:10px;" class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">权限组名称：</label>
            <div class="am-u-sm-9">
              <input type="text" style="border:1px solid #333;" id="groupName" placeholder="权限组名称">
<!--               <small>输入权限组名称。</small> -->
            </div>
          </div>
          <div style="clear: both;"></div>
          <div class="" style="width: 100%;margin-top:10px;">
            <label for="user-email" class="am-u-sm-3 am-form-label" style="text-align: right;">权限组描述：</label>
            <div class="am-u-sm-9">
              <textarea style="width: 70%; height:60px;border:1px solid #333;"  id="groupDescribe" placeholder="权限组描述"></textarea>
<!--               <small>权限组描述...</small> -->
            </div>
          </div>
          <div style="clear: both;"></div>
          <div id="addGroupPrivilegeHtml" style="margin-top:10px;;width: 100%; ">
            <label for="user-email" class="am-u-sm-3 am-form-label" style="text-align: right;">含以下权限：</label>
            <div class="am-u-sm-12" style="overflow-y:auto;height:220px">
              <table class="am-table">
               <thead>
                 <tr>
                   <th style="text-align: center;">权限操作</th>
                   <th style="text-align: center;">权限类型</th>
                   <th style="text-align: center;"></th>
                 </tr>
               </thead>
               <tbody id="addGroupPrivilegeTbody">
                 
               </tbody>
              </table>
              
            </div>
          </div>
          <div style="clear:both;"></div>
           <div class="am-form-group" style="margin-top:30px;">
            <div class="am-u-sm-9 am-u-sm-push-4">
              <button type="button" onclick="addPrivilegeGroupIndex()"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">确认</button>
              &nbsp;&nbsp;
              <button type="button" onclick="closePrivilegeGroupIndex()"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">取消</button>
            </div>
          </div>
          <!--  <div class="am-form-group" style="clear:both">
            <div class="am-u-sm-9 am-u-sm-push-3">
            <br>
            &nbsp&nbsp
              <button type="button" onclick="addPrivilegeGroupIndex()" class="am-btn am-btn-primary">确认添加</button>
              &nbsp&nbsp
              <button type="button" onclick="closePrivilegeGroupIndex()" class="am-btn am-btn-primary">取消</button>
            </div>
          </div> -->
        

</div>
</div>
<!-- ------------------------------------------------- -->
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<div id="mainAdminDiv" class="am-cf admin-main" style="">
  <!-- sidebar start -->
  <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
    <div class="am-g">
      <div class="am-u-md-6 am-cf" style="width:70%">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl" >
            <div class="am-btn-group am-btn-group-xs" >
			  <a onclick="">
			    <button onclick="renewalControllerPrivilegeData()" type="button" class="am-btn am-btn-default">
						<span class=""></span> 更新所有访问权限
				</button> 
			  </a>
			</div>
			<div class="am-btn-group am-btn-group-xs">
			  <a onclick="">
			    <button onclick="updatePrivilegeVerify(1)" type="button" class="am-btn am-btn-default">
						<span class=""></span> 加入访问验证
				</button> 
			  </a>
			</div>
			<div class="am-btn-group am-btn-group-xs">
			  <a onclick="">
			    <button onclick="updatePrivilegeVerify(0)" type="button" class="am-btn am-btn-default">
						<span class=""></span> 不需访问验证
				</button> 
			  </a>
			</div>
			<div class="am-btn-group am-btn-group-xs">
			 <a >
			  <button type="button" onclick="toAddPrivilegeGroupIndex()" class="am-btn am-btn-default">
			    <span class="am-icon-plus"></span> 新增权限组
			  </button>
		    </a>
			</div>
			<div class="am-btn-group am-btn-group-xs" >
			  <select id="operation_type">
				<option value=0>操作类型</option>
				<option value=1>新增</option>
				<option value=2>删除</option>
				<option value=3>修改</option>
				<option value=4>查询</option>
			  </select>
			</div>
			<div class="am-btn-group am-btn-group-xs" >
			  <a onclick="">
			    <button onclick="updateOperationLog(1)" type="button" class="am-btn am-btn-default">
				  <span class=""></span>加入操作日志
				</button> 
			  </a>
			</div>
			<div class="am-form-group am-margin-left am-fl">
			  <select id="privilegeSelect">
				<!-- <option value=0>查询全部</option> -->
				<option value=1>后台权限</option>
				<option value=2>pc权限</option>
				<option value=3>微信权限</option>
				<option value=4>app权限</option>
			  </select>
			</div>
			<div class="am-btn-group am-btn-group-xs">
			  <!--  <a class="am-btn am-btn-default" onclick="findPrivilege(0)">
				 查询
			  </a>-->
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
      <!-- <div class="am-u-md-3 am-cf">
        <div class="am-fr">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
          </div>
        </div>
      </div> -->
    </div>
    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,'checkName')"/></th>
                <th class="user_basics_id">权限路径</th>
                <th class="user_basics_id">权限操作</th>
                <th class="user_basics_id">是否分页</th>
                <th class="user_basics_id">是否记录操作</th>
                <th class="user_basics_id">操作类型</th>
                <th class="user_basics_id">访问验证</th>
                <th class="user_basics_id">权限描述</th>
                <th class="information_compellation">权限类型</th>
              </tr>
          </thead>
          <tbody id="tbodyText">
            
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
</div>
<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
