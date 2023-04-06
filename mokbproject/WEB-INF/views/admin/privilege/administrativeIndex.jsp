<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html>
<head>
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
  function toAddPrivilegeAdminstrativeOne(){//新增管理组
  showStackHtml(1);//显示或隐藏层叠div
  }
  function showStackHtml(showTypeNum){//显示或隐藏层叠div 显示类型（1为新增管理组 2为查看管理组）
  var stackHtmlTitleText;//层叠div的顶部文字
  var confirmText;//层叠div的确认按钮文字内容
  var stackHtmlButtonAffirm=document.getElementById("stackHtmlButtonAffirm");//获取层叠div的确认按钮
  if(showTypeNum==1){//showTypeNum为显示层叠div的操作类型 1为新增管理组 2为查看管理组
  stackHtmlTitleText="新增管理组";
  confirmText="确认";
  stackHtmlButtonAffirm.removeEventListener("click",updatePrivilegeAdminstrativeOne);
  stackHtmlButtonAffirm.addEventListener("click",addPrivilegeAdministrative);
  }else{
  stackHtmlButtonAffirm.removeEventListener("click",addPrivilegeAdministrative);
  stackHtmlButtonAffirm.addEventListener("click",updatePrivilegeAdminstrativeOne);
  stackHtmlTitleText="查看管理组";
  confirmText="确认";
  }
  document.getElementById("stackHtmlTitleText").innerHTML=stackHtmlTitleText;
  stackHtmlButtonAffirm.innerHTML=confirmText;//给层叠div的确认按钮赋值内容
  var display=document.getElementById("stackHtml").style.display;//获取层叠div的display属性，
  document.getElementById("stackHtml").style.display=display=="block"?"none":"block";//div隐藏和显示之间切换
  var overflow=document.body.style.overflow;//获取body的overflow属性
  document.body.style.overflow=overflow=='hidden'?"":"hidden";//body能否滚动之间切换hidden为不可滚动
  var opacity=document.getElementById("mainAdminDiv").style.opacity;//获取层叠div的opacity属性
  document.getElementById("mainAdminDiv").style.opacity=opacity==''?0.3:'';//div透明与不透明之间切换
  if(overflow!="hidden"){//当前操作为隐藏层叠div
  clearStackHtmlValue();//清除层叠div中的动态value值
  }
  }
  function getTbodyInTd(objectNode){//通过objectNode获取表单内容中的td标签
  var td=objectNode.parentNode;
  return td;
  }
  function cancelStackHtml(){//取消层叠div
  showStackHtml();//显示或隐藏层叠div
  }
  function clearStackHtmlValue(){//清除层叠div中的动态value值
  var StackHtmlTbody=document.getElementById("StackHtmlTbody");//获取tbodyDoc对象
  StackHtmlTbody.innerHTML="";//将tbody中的内容清空
  document.getElementById("administrative_name").value="";
  document.getElementById("administrative_describe").value="";
  document.getElementById("administrative_priority").value="";
  document.getElementById("stackSelectPG").style.display="none";//隐藏层叠div中权限集数据的select
  }
  function loadStackSelectPGHtml(jsonData){//加载层叠div中权限集数据的select
  var stackSelectPG=document.getElementById("stackSelectPG");
  var object=jsonData.object;
  object.forEach(function(value,index,array){
  stackSelectPG.options[index+1]=new Option(value.privilege_gather_name,value.privilege_gather_id);
  });
  }
  function selectValueChange(selectDoc){//层叠div中的select值发生改变
  var object=JSON.stringify({privilege_gather_id:selectDoc.options[selectDoc.selectedIndex].value});//异步查询所需的参数 权限集id
  //异步查询权限集信息
  ajaxPost('<%=basePath%>admin_privilege/findPrivilegeGarherOrPGId',object,'json','json',superadditionStackTableTr);
  selectDoc.options.remove(selectDoc.selectedIndex);//删除选中的select 加载进tbody显示的权限集 
  }
  function showStackSelectPG(){//显示或隐藏层叠div中权限集数据的select
  var display=document.getElementById("stackSelectPG").style.display;
  var status=display=="none"?1:2;//显示操作为1 关闭操作为2
   switch (status) {//判断当前的操作为显示或者时隐藏
   case 1://显示div中权限集数据的select
	 document.getElementById("stackSelectPG").style.display="block";
	 //异步加载select的内容
	 ajaxPost("<%=basePath%>admin_privilege/findPrivilegeGarherInAdmin","","json","json",loadStackSelectPGHtml);
     break;
   case 2://隐藏div中权限集数据的select
     document.getElementById("stackSelectPG").style.display="none";
     break;
   default://隐藏div中权限集数据的select
     document.getElementById("stackSelectPG").style.display="none";
	 break;
   }
  }
  function superadditionStackTableTr(jsonData){//将select中选中的数据追加到tbody中显示
  var object1=jsonData.object;
  var StackHtmlTbody=document.getElementById("StackHtmlTbody");//获取tbodyDoc对象
  object1.forEach(function (object,index,array){
  var tr = document.createElement("tr"); //创建tr标签
  var TdPrivilege_gather_id = document.createElement("td");//创建td标签
  TdPrivilege_gather_id.style.display='none';//创建包含Privilege_gather_id的td，属性为隐藏
  var inputPrivilege_gather_id=document.createElement("input");//创建input
  inputPrivilege_gather_id.setAttribute('type', 'hidden');//input为隐藏
  inputPrivilege_gather_id.setAttribute('value', object.privilege_gather_id);//input的value值为Privilege_gather_id
  inputPrivilege_gather_id.name='privilege_gather_ids';//input的name属性为privilege_gather_ids
  TdPrivilege_gather_id.appendChild(inputPrivilege_gather_id);//将隐藏的input赋值为TdPrivilege_gather_id td标签的子元素
  var tdPrivilege_gather_name=document.createElement("td");//创建显示权限集名字的td标签
  tdPrivilege_gather_name.innerHTML=object.privilege_gather_name;//td标签内容为权限集名字
  var tdPrivilege_gather_describe=document.createElement("td");//创建显示权限集描述的td标签
  tdPrivilege_gather_describe.innerHTML=object.privilege_gather_describe;//td标签的内容为权限集描述
  var tdRemove=document.createElement("td");//创建删除功能的td标签
  var removeButton=document.createElement("button");//创建删除按钮
  removeButton.addEventListener('click',function(){removeTrToTd(this);});//为删除按钮绑定方法
  removeButton.innerHTML="-";//删除按钮的显示内容
  tdRemove.appendChild(removeButton);//将删除按钮添加为删除功能的td标签的子元素
  tr.appendChild(TdPrivilege_gather_id);//tr添加子元素TdPrivilege_gather_id
  tr.appendChild(tdPrivilege_gather_name);//tr添加子元素tdPrivilege_gather_name
  tr.appendChild(tdPrivilege_gather_describe);//tr添加子元素tdPrivilege_gather_describe
  tr.appendChild(tdRemove);//tr添加子元素tdRemove
  StackHtmlTbody.appendChild(tr);//StackHtmlTbody添加子元素tr
  });
  }
  function alterStackSelectPGHtml(selectIndex){//改变隐藏层叠div中权限集数据的select
  }
  function addPrivilegeAdministrative(){//添加管理组
    var privilege_gather_ids=document.getElementsByName("privilege_gather_ids");
    var administrative_name=document.getElementById("administrative_name").value;//管理组名字
    var administrative_describe=document.getElementById("administrative_describe").value;//管理组描述
    var administrative_priority=document.getElementById("administrative_priority").value;//管理组优先级
    var privilegeGatherIdsName=document.getElementsByName("privilege_gather_ids");//获取value值为权限集id的隐藏input
    var privilegeGatherIds=[];//权限集id数组
    privilegeGatherIdsName.forEach(function(value,index,array){//遍历name选择器中的input标签
    privilegeGatherIds.push(value.value);//将input的值添加进权限集id数组
    });
    //将请求的变量赋值
    var object=JSON.stringify({"administrative_name":administrative_name,"administrative_describe":administrative_describe,"administrative_priority":administrative_priority,"privilegeGatherIds":privilegeGatherIds});
    //发送添加管理组请求
    ajaxPost("<%=basePath%>admin_privilege/addPrivilegeAdministraOrPG",object,"json","json",function(jsonData){alert(jsonData.message);});
    console.log(JSON.stringify(privilegeGatherIds));
    console.log(privilegeGatherIds.length);
    cancelStackHtml();//取消并隐藏层叠div
  }
  function findPrivilegeAdminstrative(){//查询所有管理组
  ajaxPost("<%=basePath%>admin_privilege/findAllPrivilegeAdministra","","json","json",loadPrivilegeAdminstrativeTbody);
  }
  function loadPrivilegeAdminstrativeTbody(jsonData){//加载显示权限管理组的tbody内容
  var object=jsonData.object;
  var htmlStr="";
  if(object==null||object.length<1){
  var htmlStr="<tr>"+
             "<td colspan='5'>暂无信息</td>"+
             "<tr>";
  }
  object.forEach(function (value,index,array){
   htmlStr+=" <tr>"+
               "<td><input type='checkbox'/></td>" +
                "<td>"+value.administrative_name+"</td>"+
                "<td>"+value.administrative_describe+"</td>"+
                "<td style='text-align: center'>"+value.administrative_priority+"</td>"+
                "<td>"+
                 "<div class='am-btn-toolbar'>"+
				   "<div class='am-btn-group am-btn-group-xs'>"+
					"<a class='am-btn am-btn-default' onclick=findPrivilegeAdminstrativeOne("+value.administrative_id+")>查看</a>" +
					"<a class='am-btn am-btn-default' onclick=alert('暂未开放')>删除</a> "+ 
					"<a class='am-btn am-btn-default' onclick=javascript:{window.location.href="+"'"+"<%=basePath%>admin_privilege/toPrivilegeAdministrativeUserIndex?privilegeAdministrativeid="+value.administrative_id+"'"+"}>设置管理组用户</a>"+ 
				   "</div>"+
				  "</div>"+
				"</td>"+
              "</tr>";
  });
  document.getElementById("privilegeAdminstrativeTbody").innerHTML=htmlStr;
  }
  function updatePrivilegeAdminstrativeOne(){//修改管理组
  alert("暂未开放");
  }
  function findPrivilegeAdminstrativeOne(adminstrativeId){//查询管理组信息，包含管理组所包含的权限集
  object=JSON.stringify({"administrative_id":adminstrativeId});
  ajaxPost("<%=basePath%>admin_privilege/findPaAndPgToPaId",object,"json","json",function(jsonData){var jsonData0={"object":jsonData.object.privilegeGatherEntityList};superadditionStackTableTr(jsonData0);var jsonData1={"object":jsonData.object.privilegeAdministrativeEntity};setAdministrativeInputValue(jsonData1);});
  showStackHtml(2);//显示或隐藏层叠div
  }
  function setAdministrativeInputValue(jsonData){//将管理组属性的input内容赋值
  var object=jsonData.object;
  document.getElementById("administrative_name").value=object.administrative_name;
  document.getElementById("administrative_describe").value=object.administrative_describe;
  document.getElementById("administrative_priority").value=object.administrative_priority;
  };
  </script>
  <script type="text/javascript">
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
  
  </script>
</head>
<body style="overflow: ;">
  <div id="stackHtml" style="width: 100%;height: 100%; z-index:99999; position:fixed;display:none;">
    <div style="background-color: #f5f5f5;  width:650px ; height:550px; z-index:99999;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%); border:1px solid #55cbd2;border-radius:5px;">
          <div style="text-align: center;background:#55cbd2;line-height: 40px;">
            <font style="font-size: 20px; font-weight:1000;color:#fff;" id="stackHtmlTitleText">新增权限组</font>
          </div>
          <div style="margin-top:10px;" class="am-form-group">
            <label for="user-name" class="am-u-sm-4 am-form-label" style="text-align: right;">管理组名称：</label>
            <div class="am-u-sm-8">
              <input type="hidden" id="gatherId">
              <input type="text" style="border:1px solid #666;" id="administrative_name" placeholder="">
              <small></small>
            </div>
          </div>
          <div style="clear: both;"></div>
          <div class="" style="margin-top:10px;">
            <label for="user-email" class="am-u-sm-4 am-form-label" style="text-align: right;">管理组描述：</label>
            <div class="am-u-sm-8">
              <textarea style="width: 70%; height:60px;border:1px solid #666;"  id="administrative_describe" placeholder=""></textarea>
              <small></small>
            </div>
          </div>
          <div style="clear: both;"></div>
          <div style="margin-top:10px;" class="am-form-group">
            <label for="user-name" class="am-u-sm-4 am-form-label" style="text-align: right;">管理组优先级：</label>
            <div class="am-u-sm-8">
              <input style="width: 30px;height:22px;border:1px solid #666;" type="text" id='administrative_priority' placeholder="">
              <small>优先级顺序数字由小到大</small>
            </div>
          </div>
          <div style="clear: both;"></div>
          <div id="addGroupPrivilegeHtml" style=";clear:both;width: 100%; ">
          	<div style="margin-top:10px;">
	            <label for="user-email" class="am-u-sm-4 am-form-label" style="text-align: right;">未管理组添加权限集：</label>
	            <div class="am-u-sm-8">
		            <select onchange="selectValueChange(this)" id="stackSelectPG" style="display: none;border:1px solid #333;">
		               <option value=0>-请选择-</option>
		             </select>
	             </div>
             </div>
            <div class="am-u-sm-12" style="overflow-y:auto;max-height:220px">
              <table class="am-table" style="text-align: center;">
               <thead>
                 <tr>	
                   <th style="text-align: center;">权限集名称</th>
                   <th style="text-align: center;">权限集描述</th><!-- width:100px; -->
                   <th style="text-align: center;"><!-- width:53px; -->
                   		<button onclick="showStackSelectPG()">+</button>
                   </th>
                 </tr>
               </thead>
              
               <tbody id="StackHtmlTbody">
                 <!--  <tr>
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
                 </tr>-->
               </tbody>
             
              </table>
          </div>
<!--           <div style=" top:240px; left:595px; position: absolute;"> -->
             <!-- javascript:{ajaxPost('<%=basePath%>admin_privilege/findPrivilegeGarherInAdmin',JSON.stringify({privilege_gather_id:this.options[this.selectedIndex].value}),'json','json',superadditionStackTableTr);} -->
<!--              <select onchange="selectValueChange(this)" id="stackSelectPG" style="display: none;"> -->
<!--                <option value=0>-请选择-</option> -->
<!--              </select> -->
<!--           </div> -->
           </div>
           <div style="clear:both;"></div>
           <div class="am-form-group" style="margin-top:30px;">
            <div class="am-u-sm-9 am-u-sm-push-4">
              <button type="button" id="stackHtmlButtonAffirm"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">确认</button>
              &nbsp;&nbsp;
              <button type="button" onclick="cancelStackHtml()" class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">取消</button>
            </div>
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
            <div class="am-btn-group am-btn-group-xs" style="">
			 <button onclick="toAddPrivilegeAdminstrativeOne()" type="button" class="am-btn am-btn-default">
			    <span class="am-icon-plus"></span> 新增管理组
			  </button>
		   </div>
		   <!--  <div class="am-form-group am-margin-left am-fl">
			  <select id="privilegeSelect">
				<option value=1>后台权限集</option>
				<option value=2>客户端权限集</option>
				<!--  <option value=3>微信权限集</option>
				<option value=4>app权限集</option>
			  </select>
			</div>-->
			
			<div class="am-btn-group am-btn-group-xs">
			  <a class="am-btn am-btn-default" onclick="findPrivilegeAdminstrative()">
				<span class=""></span> 查询
			  </a>
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
    <div class="am-g" style="margin-top:10px;">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,'checkName')"/></th>
                <th style=" text-align: center" class="user_basics_id">管理组名称</th>
                <th style=" text-align: center" class="user_basics_id">管理组描述</th>
                <th style=" text-align: center">管理组优先级</th>
                <th style=" text-align: center" class="user_basics_id">操作</th>
              </tr>
          </thead>
          <tbody id="privilegeAdminstrativeTbody">
               <!--  <tr>
                <td><input type='checkbox' /></td>
                <td>权限集名称</td>
                <td>权限集描述</td>
                <td style=" text-align: center">2</td>
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
