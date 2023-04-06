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
    findLog();
  };
  function findLog(){
  	paramData={"1":"1"};
	var object = JSON.stringify(paramData);
  	ajaxPost("<%=basePath%>operation_log/findAllOperationLog", object, "json", "json", showLog);
  }
  function showLog(data){
  	//alert(JSON.stringify(data.object));
  	var object=data.object;
  	var htmlStr="";
  	for(var i=0;i<object.length;i++){
  		value=object[i];
  		var user_basics_id=value.user_basics_id;
  		var operation_module=value.operation_module;
  		var operation_mothod=value.operation_mothod;
  		var operation_date=value.operation_date;
  		var operation_type=value.operation_type;
  		var ip=value.ip;
  		if(operation_type==1){
  			operation_type="增加";
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
  		else{
  			operation_type="未知";
  		}
  		htmlStr+="<tr>"+
  			"<td><input type='checkbox' operation_id='"+value.operation_id+"'name='checkName' value='"+value.operation_id+"'/></td>"+
  			"<td>"+user_basics_id+"</td>"+
  			"<td>"+operation_module+"</td>"+
  			"<td>"+operation_mothod+"</td>"+
  			"<td>"+formatDateTimeStr(operation_date,1)+"</td>"+
  			"<td>"+operation_type+"</td>"+
  			"<td>"+ip+"</td>";
  	}
  	document.getElementById("tbodyText").innerHTML=htmlStr;
  }
  
  function findByUserId(){
  	var user_basics_id=document.getElementById("user_id").value;
  	if(user_basics_id==null){
  		alert("请输入用户编号!");
  		return;
  	}
  	if(!Number.isInteger(parseInt(user_basics_id))){
  		alert("请输入整数!");
  		return;
  	}else{
  		
  	}
  	paramData={user_basics_id:user_basics_id};
  	var operation_type=document.getElementById("operation_type").value;
  	if(operation_type!=0){
  		paramData={user_basics_id:user_basics_id,operation_type:operation_type};
  	}
  	
	var object = JSON.stringify(paramData);
  	ajaxPost("<%=basePath%>operation_log/findAllOperationLog", object, "json", "json", showLog);
  }
  function findByType(){
  	var operation_type=document.getElementById("operation_type").value;
  	if(operation_type==0){
  		alert("请选择操作类型!");
  		return;
  	}
  	paramData={operation_type:operation_type};
  	var user_basics_id=document.getElementById("user_id").value;
  	if(Number.isInteger(parseInt(user_basics_id))){
  		paramData={operation_type:operation_type,user_basics_id:user_basics_id};
  	}
	var object = JSON.stringify(paramData);
  	ajaxPost("<%=basePath%>operation_log/findAllOperationLog", object, "json", "json", showLog);
  }
  </script>
</head>
<body>
<%@ include file="../../template/stack-div.jsp"%><!-- 隐藏的层叠div-->
<div id="addPrivilegeGroupIndex" style="width: 100%;height: 100%; z-index:99999; position:fixed;display:none;">
<div style="background-color: #f5f5f5;  width:650px ; height:500px; z-index:99999;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%); border:1px solid #55cbd2;border-radius:5px;">
          
           <div class="am-form-group" style="margin-top:30px;">
            <div class="am-u-sm-9 am-u-sm-push-4">
              <button type="button" onclick="addPrivilegeGroupIndex()"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">确认</button>
              &nbsp;&nbsp;
              <button type="button" onclick="closePrivilegeGroupIndex()"  class="am-btn am-btn-primary" style="width:60px;background:#55cbd2;border:none;border-radius:3px;">取消</button>
            </div>
          </div>
        

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
          
          <div class="am-btn-group am-btn-group-xs">
			  <input id="user_id" value="">
			</div>
			
			<div class="am-btn-group am-btn-group-xs">
			  <a onclick="">
			    <button onclick="findByUserId()" type="button" class="am-btn am-btn-default">
						<span class=""></span> 根据用户编号查询
				</button> 
			  </a>
			</div>
			
			
			<div class="am-btn-group am-btn-group-xs">
			  <select id="operation_type">
				<option value=0>操作类型</option>
				<option value=1>新增</option>
				<option value=2>删除</option>
				<option value=3>修改</option>
				<option value=4>查询</option>
			  </select>
			</div>
			
			<div class="am-btn-group am-btn-group-xs">
			  <a onclick="">
			    <button onclick="findByType()" type="button" class="am-btn am-btn-default">
				  <span class=""></span> 根据操作类型查询
				</button> 
			  </a>
			</div>
			
			<div class="am-btn-group am-btn-group-xs">
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
    </div>
    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input id="checkChief" type="checkbox" onclick="util_checkAll(this.id,'checkName')"/></th>
                <th class="user_basics_id">用户编号</th>
                <th class="user_basics_id">操作模块</th>
                <th class="user_basics_id">操作方法</th>
                <th class="user_basics_id">操作时间</th>
                <th class="user_basics_id">操作类型</th>
                <th class="user_basics_id">IP地址</th>
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
