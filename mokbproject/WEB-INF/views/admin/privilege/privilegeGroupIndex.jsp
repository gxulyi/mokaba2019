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
  <style>
        /* 弹窗 (background) */
        .modal {
            display: none; /* 默认隐藏 */
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
 
        /* 弹窗内容 */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 50%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s
        }
 
        /* 添加动画 */
        @-webkit-keyframes animatetop {
            from {top:-300px; opacity:0}
            to {top:0; opacity:1}
        }
 
        @keyframes animatetop {
            from {top:-300px; opacity:0}
            to {top:0; opacity:1}
        }
 
        /* 关闭按钮 */
        .close {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
 
        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
 
        .modal-header {
            padding: 2px 16px;
            background-color: #5587A2;
            color: white;
        }
 
        .modal-body {padding: 2px 16px;}
 
        .modal-footer {
            padding: 2px 16px;
            background-color: #5587A2;
            text-align: right;
            color: white;
        }
  </style>
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
  <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript">
  //confirm prompt
  var modal;//弹窗html内容
  window.onload=function(){
  findPrivilegeGroup();
  var span = document.getElementsByClassName("close")[0];// 获取 <span> 元素，用于关闭弹窗 that closes the modal
  modal = document.getElementById('myModal');// 获取弹窗
  span.onclick = function() { // 点击 <span> (x), 关闭弹窗
            cancelMyModal();//取消弹窗
        };
  //window.onclick = function(event) {// 在用户点击其他地方时，关闭弹窗
          //alert(event);
          //alert(event.target);
            //if (event.target == modal) {
                //cancelMyModal();
            //}
        //};
  
  };
  
  function toRemovePrivilegeGather(privilege_gather_id,privilege_gather_name){//删除页面
     if(confirm('确认删除管理组：'+privilege_gather_name+'吗,删除后不可恢复')){
       alert('');
     }
      //alertModal(privilege_gather_name);//显示弹框
  }
  function alertModal(){//显示弹框
  modal.style.display = "block";
  document.getElementById("")
  }
  function cancelMyModal(){//取消弹窗
  modal.style.display = "none";
  
  }
  function examinePrivilegeGatherOne(objectNode){//查看单个权限集
  var tdNode=objectNode.parentNode.parentNode.parentNode;//获取objectNode的父td标签
  var trNode=tdNode.parentNode;//获取tr标签
  var tdNodes=trNode.children;//获取所有td标签
  var privilege_gather_id=tdNodes[0].children[0].value;
  object=JSON.stringify({"privilege_gather_id":privilege_gather_id});
  ajaxPost("<%=basePath%>admin_privilege/findPgOrP",object,"json","json",loadExamineHtml);
  showStackHtml("确认");//显示或隐藏层叠div
  //移除确认按钮的添加权限集事件
  document.getElementById("confirmStackButton").removeEventListener('click',addPrivilegeGatherOne, false);
  //添加确认按钮的修改权限集事件
  document.getElementById("confirmStackButton").addEventListener('click',updatePrivilegeGatherOne, false);
  }
  function updatePrivilegeGatherOne(){//修改一条权限集
  alert('修改一条权限集');
  
  }
  function clearExamineHtmlValue(){//清除层叠div中的动态value值
  document.getElementById("gatherId").value="";
  document.getElementById("gatherName").value="";
  document.getElementById("gatherDescribe").value="";
  document.getElementById("examineHtmlTbody").innerHTML="";
  }
  function toAddPrivilegeGatherOne(){//新增权限集
  showStackHtml("确认添加");//显示或隐藏层叠div
  //移除确认按钮的修改权限集事件
  document.getElementById("confirmStackButton").removeEventListener('click',updatePrivilegeGatherOne, false);
  //添加确认按钮的添加权限集事件
  document.getElementById("confirmStackButton").addEventListener('click',addPrivilegeGatherOne, false);
  }
  function addPrivilegeGatherOne(){//添加一条权限集
  alert('添加一条权限集');
  }
  function loadExamineHtml(jsonData){//加载层叠div
  document.getElementById("gatherId").value=jsonData.object.privilegeGatherEntity.privilege_gather_id;
  document.getElementById("gatherName").value=jsonData.object.privilegeGatherEntity.privilege_gather_name;
  document.getElementById("gatherDescribe").value=jsonData.object.privilegeGatherEntity.privilege_gather_describe;
  showStackHtmlTbody(jsonData.object.privilegeEntityList);
  };
 
  function showStackHtml(confirmText){//显示或隐藏层叠div
  var stackHtmlTitleText=confirmText=="确认添加"?"新增权限组":"查看权限组";
  document.getElementById("stackHtmlTitleText").innerHTML=stackHtmlTitleText;
  document.getElementById("confirmStackButton").innerHTML=confirmText;//给层叠div的确认按钮赋值内容
  var display=document.getElementById("stackHtml").style.display;//获取层叠div的display属性，
  document.getElementById("stackHtml").style.display=display=="block"?"none":"block";//div隐藏和显示之间切换
  var overflow=document.body.style.overflow;//获取body的overflow属性
  document.body.style.overflow=overflow=='hidden'?"":"hidden";//body能否滚动之间切换hidden为不可滚动
  var opacity=document.getElementById("mainAdminDiv").style.opacity;//获取层叠div的opacity属性
  document.getElementById("mainAdminDiv").style.opacity=opacity==''?0.3:'';//div透明与不透明之间切换
  if(overflow!="hidden"){
  clearExamineHtmlValue();
  }
  }
  function stackHtmlCancel(){//取消层叠div
  showStackHtml();//显示或隐藏层叠div
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
  function findPrivilegeGroup(){
  var privilegeSelect=document.getElementById("privilegeSelect");
  var index=privilegeSelect.selectedIndex;
  var value=parseInt(privilegeSelect.options[index].value);
  var privilegeGatherTypes=[];
  switch (value) {
case 1://查询后台权限集
      privilegeGatherTypes.push(1);
	break;
case 2://查询pc权限
	
	break;
case 3://微信公众号权限
	
	break;
case 4://app权限

	default://查询全部
	  ajaxPost("<%=basePath%>admin_privilege/findAllPrivilege",object,"json","json",showTbodyText);
	break;
  }
  object=JSON.stringify({"privilegeGatherTypes":privilegeGatherTypes});
  ajaxPost("<%=basePath%>admin_privilege/findPrivilegeGroupAdmin",object,"json","json",showGatherPrivilegeTbody);
}
  
  function showGatherPrivilegeTbody(jsonData){
  var object=jsonData.object;
  if(object.length<1){//返回的查询的数据小于0
   var textValue="<tr>"+
    "<td colspan='5'>暂无数据</td>"+
   "<tr>";
   document.getElementById("gatherPrivilegeTbody").innerHTML=textValue;
   return;
   }
  var textValue="";
  object.forEach(function(value,index,array){
  var privilegeGatherType;
  switch (parseInt(value.privilege_gather_type)) {
case 1:
	privilegeGatherType='后台权限集';
	break;
case 2:
	privilegeGatherType='pc权限集';
	break;
case 3:
	privilegeGatherType='公众号权限集';
	break;
case 4:
	privilegeGatherType='app权限集';
	break;

default:
	break;
}
  textValue+="<tr>"+
              "<td><input type='checkbox' name='checkName' value='"+value.privilege_gather_id+"'/></td>"+
              "<td>"+value.privilege_gather_name+"</td>"+ 
              "<td>"+value.privilege_gather_describe+"</td>"+ 
              "<td>"+privilegeGatherType+"</td>"+
              "<td>"+
               "<div class='am-btn-toolbar'>"+ 
			    "<div class='am-btn-group am-btn-group-xs'>"+   
				 "<a class='am-btn am-btn-default' onclick=examinePrivilegeGatherOne(this)>查看</a>"+	 
				 "<a class='am-btn am-btn-default' onclick=toRemovePrivilegeGather("+value.privilege_gather_id+","+"'"+value.privilege_gather_name.toString()+"'"+")>删除</a> "+	  
			    "</div>"  +
			   "</div>"+  
			  "</td> "+  
              "</tr>";
   });
  document.getElementById("gatherPrivilegeTbody").innerHTML=textValue;
   }
 
  function showStackHtmlTbody(jsonDataObject){//加载显示添加权限的页面数据
  var object=jsonDataObject;
  var addGroupPrivilegeTbody=document.getElementById("examineHtmlTbody");
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
   
  </script>
  <script type="text/javascript">

  </script>
</head>

	<!-- 隐藏的层叠div-->
<body style="overflow: ;">
  <div id="stackHtml" style="width: 100%;height: 100%; z-index:99999; position:fixed;display:none;">
    <div style="background-color: #f5f5f5;  width:650px ; height:500px; z-index:99999;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%); border:1px solid #55cbd2;border-radius:5px;">
          <div style="text-align: center;background:#55cbd2;line-height: 40px;">
            <font style="color:#fff;font-size: 20px; font-weight:1000; " id="stackHtmlTitleText">新增权限组</font>
          </div>
          <div style="margin-top:10px;" class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">权限集名称：</label>
            <div class="am-u-sm-9">
              <input type="hidden" id="gatherId">
              <input type="text" style="border:1px solid #333;" id="gatherName" placeholder="">
              <small></small>
            </div>
          </div>
          <div style="clear: both;"></div>
          <div class="" style="width: 100%;margin-top:10px;">
            <label for="user-email" class="am-u-sm-3 am-form-label" style="text-align: right;">权限集描述：</label>
            <div class="am-u-sm-9">
              <textarea style="width: 70%; height:60px;border:1px solid #333;"  id="gatherDescribe" placeholder=""></textarea>
              <small></small>
            </div>
          </div>
          <div style="clear: both;"></div>
          <div id="addGroupPrivilegeHtml" style="margin-top:10px;width: 100%; ">
            <label for="user-email" class="am-u-sm-3 am-form-label" style="text-align: right;">含以下权限：</label>
            <div class="am-u-sm-12" style="overflow-y:auto;max-height:220px">
              <table class="am-table" style="text-align: center;">
               <thead>
                 <tr>
                   <th style="text-align: center;">权限操作</th>
                   <th style="text-align: center;">权限类型</th>
                   <th style="text-align: center;"><button>+</button></th>
                 </tr>
               </thead>
               <tbody id="examineHtmlTbody">
                 <tr>
                   <td>		来自微信的请求，get请求的参数是code、state，这里我需要在菜单那里配置即可，也就是用户点击按钮，然后微信访问该方法</td>
                   <td>后台权限</td>
                   <td><button onclick='removeTrToTd(this)'>-</button></td>
                 </tr>
                  <tr>
                   <td>	后台跳转至新增银行卡信息页面</td>
                   <td>后台权限</td>
                   <td><button onclick='removeTrToTd(this)'>-</button></td>
                  </tr>
                  <tr>
                   <td>	后台跳转至新增银行卡信息页面</td>
                   <td>后台权限</td>
                   <td><button onclick='removeTrToTd(this)'>-</button></td>
                 </tr>
                 <tr>
                   <td>	后台跳转至新增银行卡信息页面</td>
                   <td>后台权限</td>
                   <td><button onclick='removeTrToTd(this)'>-</button></td>
                 </tr>
                 <tr>
                   <td>	后台跳转至新增银行卡信息页面</td>
                   <td>后台权限</td>
                   <td><button onclick='removeTrToTd(this)'>-</button></td>
                 </tr>
               </tbody>
              </table>
          </div>
          <div style="position:absolute; top:-242px; left:595px; position: relative">
              <!--  <select>
               <option>5456456465456456</option>
               <option>5456456465456456</option>
               <option>5456456465456456</option>
               <option>5456456465456456</option>
              </select>-->
              </div>
            </div>
            <div style="clear:both;"></div>
           <div class="am-form-group" style="margin-top:30px;">
	            <div class="am-u-sm-9 am-u-sm-push-4">
	              <button type="button" id="confirmStackButton"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">确认</button>
	              &nbsp;&nbsp;
	              <button type="button" onclick="stackHtmlCancel()" class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">取消</button>
	            </div>
	          </div>
           <!-- <div class="am-form-group" style="clear:both">
            <div class="am-u-sm-9 am-u-sm-push-3">
            <br>
            &nbsp;&nbsp;
              <button type="button" onclick="" class="am-btn am-btn-primary" id="confirmStackButton">确认修改</button>
              &nbsp;&nbsp;
              <button type="button" onclick="stackHtmlCancel()" class="am-btn am-btn-primary">取消</button>
            </div>
          </div> -->
     </div>
  </div>
  <!-- 弹窗 -->
    <div id="myModal" class="modal">
 
        <!-- 弹窗内容 -->
        <div class="modal-content" style="height: 600px;" >
            <div class="modal-header" style="height: 10%; line-height: 50px;">
                <span style="" class="close">×</span>
                <h2 style="margin:0 0;">删除权限集: <font id="removePGName">11</font></h2>
                
            </div>
            <div class="modal-body" style="height: 84%;">
                <p>弹窗内容...</p>
                <p>弹窗内容...</p>
            </div>
            <div class="modal-footer" style="height: 6%;">
                <h3 style="width:100%;height:100%;text-align:center; padding:auto auto"><button style="color:#333;font-weight:900;">确认</button></h3>
            </div>
        </div>
 
    </div>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<div id="mainAdminDiv" class="am-cf admin-main">
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
            <div class="am-btn-group am-btn-group-xs">
			 <button onclick="alert('暂未开放，请从权限接口页面添加')" type="button" class="am-btn am-btn-default">
			    <span class="am-icon-plus"></span> 新增
			  </button>
		   </div>
			<div class="am-form-group am-margin-left am-fl">
			  <select id="privilegeSelect">
				<option value=1>后台权限集</option>
				<option value=2>客户端权限集</option>
				<!--  <option value=3>微信权限集</option>
				<option value=4>app权限集</option>-->
			  </select>
			</div>
			<!--<div class="am-btn-group am-btn-group-xs">
			  <a class="am-btn am-btn-default" onclick="findPrivilege(0)">
				 查询
			  </a>
			</div> -->
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
                <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,checkName)"/></th>
                <th style="width:10%" class="user_basics_id">权限集名称</th>
                <th style="width:65%" class="user_basics_id">权限集描述</th>
                <th>权限集类型 </th>
                <th class="user_basics_id">操作</th>
              </tr>
          </thead>
          <tbody id="gatherPrivilegeTbody">
              <!--  <tr>
                <td><input type='checkbox' /></td>
                <td>权限集名称</td>
                <td>权限集描述</td>
                <td>后台管理</td>
                <td>
                  <div class='am-btn-toolbar'>
				   <div class='am-btn-group am-btn-group-xs'>
					 <a class='am-btn am-btn-default' onclick='examinePrivilegeGather(this)'>查看</a>
					 <a class='am-btn am-btn-default' onclick="alert('暂未开放')">删除</a>  
				   </div>
				  </div>
				</td>
              </tr>-->
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
