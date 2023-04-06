<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 服务</title>
  <meta name="description" content="这是一个 查询服务方式 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript" src="js/paging.js"></script>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript">
	function findSomeType(type_id){
	debugger;
	var paramData;
	var paramData={type_id:type_id};
	var object = JSON.stringify(paramData);
	 ajaxPost("<%=basePath%>admin_personal/findPersonalMode",object,"json","json",showMode);
	 ajaxPost("<%=basePath%>admin_personal/findPersonalSver",object,"json","json",wait1);
	  
	}
	function findSomeMode(mode_id){
	  var type_id=document.getElementById("psType").value;
	  	if(type_id==0){
	  	 alert("请选择服务方式！");
	  	}else{
	  var paramData;
	  var paramData={type_id:type_id,mode_id:mode_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_personal/findPersonalSver",object,"json","json",wait1);
	  }
	}
	function wait(vsi){
	  debugger;
	  //alert(JSON.stringify(vsi.personalServerData.listPersonalServer));
	  var htmlstr="";
	  var htmlstr2="<option value='0'>请选择服务方式</option>";
	     var listPersonalServer=vsi.personalServerData.listPersonalServer;
	     if(listPersonalServer!=null){
	     var lpt=listPersonalServer;
	     for(var i=0;i<lpt.length;i++){
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+lpt[i].type_id+"</td>"+
                "<td>"+lpt[i].mode_id+"</td>"+
                "<td><a href=<%=basePath%>admin_personal/iframeModifyPslSver?server_id="+lpt[i].server_id+">"+lpt[i].server_name+"</a></td>"+
                "<td><a href='javascript:void(0);' onclick='alert(\"正在努力开发中...\")'>"+lpt[i].effective_time+"</a></td>"+
                /* "<td>"+lpt[i].server_intro+"</td>"+ */
                "<td>"+lpt[i].user_basics_id+"</td>"+
                "<td>"+formatDateTimeStr(lpt[i].add_date)+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                "<a onclick='updateStore("+lpt[i].mode_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 编辑</a>"+
                "<a onclick='deleteType("+lpt[i].mode_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
                
		}
		//alert(htmlstr);
		document.getElementById("textValue").innerHTML=htmlstr;
		
	  var paramData;
	  var paramData={currentPage:1};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_personal/findPersonalType",object,"json","json",showType);
	  ajaxPost("<%=basePath%>admin_personal/findPersonalMode",object,"json","json",showMode);
	  }else{
	  alert("暂无服务方式信息");
	  }
	}
	  function showType(vsi){
	  var htmlstr2="<option value='0'>请选择服务方式</option>";
	     var listPersonalType=vsi.personalTypeData.listPersonalType;
	    if(listPersonalType!=null){
	     var lpt=listPersonalType;
	     for(var i=0;i<lpt.length;i++){
           htmlstr2+="<option value="+lpt[i].type_id+">"+lpt[i].type_name+"</option>";
	  	 }
	  	document.getElementById("psType").innerHTML=htmlstr2;
	  	}
	  }	
	   function showMode(vsi){
	  var htmlstr2="<option value='0'>请选择服务类型</option>";
	     var listPersonalMode=vsi.personalModeData.listPersonalMode;
	    if(listPersonalMode!=null){
	     var lpt=listPersonalMode;
	     for(var i=0;i<lpt.length;i++){
           htmlstr2+="<option value="+lpt[i].mode_id+">"+lpt[i].mode_name+"</option>";
	  	 }
	  	document.getElementById("psMode").innerHTML=htmlstr2;
	  	}
	  }	
	  function wait1(vsi){
	  debugger;
	  //alert(JSON.stringify(vsi.personalTypeData.listPersonalType));
	  var htmlstr="";
	     debugger;
	  	 //alert(JSON.stringify(vsi.personalServerData.listPersonalServer));
	 	 var htmlstr="";
	 	 var htmlstr2="<option value='0'>所有方式</option>";
	     var listPersonalServer=vsi.personalServerData.listPersonalServer;
	     if(listPersonalServer!=null){
	     var lpt=listPersonalServer;
	     for(var i=0;i<lpt.length;i++){
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+lpt[i].type_id+"</td>"+
                "<td>"+lpt[i].mode_id+"</td>"+
                "<td><a href='javascript:void(0)'>"+lpt[i].server_name+"</a></td>"+
                "<td><a href='javascript:void(0)'>"+lpt[i].effective_time+"</a></td>"+
                /* "<td>"+lpt[i].server_intro+"</td>"+ */
                "<td>"+lpt[i].user_basics_id+"</td>"+
                "<td>"+lpt[i].add_date+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                "<a onclick='updateStore("+lpt[i].mode_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 编辑</a>"+
                "<a onclick='deleteType("+lpt[i].mode_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> "; 
                
		}
		document.getElementById("textValue").innerHTML=htmlstr;
	  }else{
	  alert("暂无服务方式信息");
	  }
	  }
	  
	  function onloadd(){
	  //alert(11);
	  var paramData;
	  var paramData={currentPage:1};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_personal/findPersonalSver",object,"json","json",wait);
	  };
	  
	  window.onload=function(){
	  	onloadd();
	  };
	
	  //修改商品
	  function updateStore(store_id){
	  //alert(store_id);
	  var parame="?store_id="+store_id;
	  //alert(parame);
	  window.location="<%=basePath%>admin_store/toUpdateStore"+parame;
	  };
	  
	  //删除服务方式
	  function deleteMode(mode_id){
	  debugger;
	  	alert(mode_id);
	  var paramData;
	  var paramData={mode_id:mode_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_personal/deletePersonalMode",object,"json","json",wait2);
	  };
	  function wait2(data){
	  //	alert(JSON.stringify(data));
	  	window.location="<%=basePath%>admin_personal/toFindPersonalMode";
	  };
    </script>
</head>
<body>
<input type='hidden' id="currentPage" value=""/>

<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->

<div class="am-cf admin-main">
  <!-- sidebar start -->
   <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
 <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <div class="am-btn-group am-btn-group-xs">
              <a href="admin_personal/ifmameAddServer" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
            </div>
			
            <div class="am-form-group am-margin-left am-fl" >
              <select id="psType"  onchange="findSomeType(this.value)">
                <option value="">请选择服务类型</option>
              </select>
            </div>
            
           
            <div class="am-form-group am-margin-left am-fl" >
              <select id="psMode" onchange="findSomeMode(this.value)">
                <option value="">请选择服务类型</option>
              </select>
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
                <th class="table-check"><input type="checkbox" /></th>
                <th class="type_id">服务方式编号</th>
                <th class="type_id">服务类型编号</th>
                <th class="server_name">服务名称</th>
                <th class="effective_time">服务期</th>
               <!--  <th class="server_intro">简介</th> -->
                <th class="user_basics_id">添加人编号</th>
                <th class="add_date">添加时间</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody id="textValue">
          
          </tbody>
        </table>
        	<!-- 页面分页 开始 -->
						<!-- <div class="am-cf">
							共<span id="total_number"></span>条记录
							<div class="am-fr" id="page_tatal">
								<ul class="am-pagination">
									
								</ul>
							</div>
						</div> -->
						<!-- 页面分页 结束 -->
           <!-- <div class="am-cf">
                                         共<span id="total_number"></span>条记录
              <div class="am-fr" id="page_tatal">
              
                <ul class="am-pagination">
                
                  <li class="am-disabled"><a href="#">«</a></li>
                  <li><a href="#"  type="hidden">... ...</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">... ...</a></li>
                  <li><a href="#">»</a></li>
                  <li style="margin:-1.5rem 0;">
                  
                  <form>
                  
                  <a style="width:55%;float:left;float:bottom;border:none;">第<input style="width:50%;line-height:1"/>页  共<span id="total_pages">50</span>页</a>
                  <a style="width:40%;float:left;border:none;"><button style="line-height:1" onclick="alert(1)">确定</button></a>
                  
                  </form>
                  </li>
                 
                </ul> 
              </div>
            </div> -->
            <hr/>
          </form>
        </div>
      </div>
    </div>
  </div>


<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/template/jquery.min.js"></script>
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
