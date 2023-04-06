<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
	
  	<meta charset="utf-8">
  	<base href="<%=basePath%>">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<title>后台管理 专家</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp" />
  	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
  	<link rel="stylesheet" href="css/template/amazeui.min.css"/>
  	<link rel="icon" type="image/png" href="css/template/images/favicon.png">
  	<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  	<link rel="stylesheet" href="css/template/admin.css">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/jquery-form.js" ></script> 
  	<script type="text/javascript" src="js/ajax.js"></script>
  	<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  	<script type="text/javascript">
  		
	    function findExpert(expert_id){
	    	window.location="<%=basePath%>admin_expert/adminFindExpertOne?expert_id="+expert_id;
	    }
	    
	    function deleteExpert(expert_id){
		  var paramData;
		  var paramData={expert_id:expert_id};                               
		  var object = JSON.stringify(paramData);
		   if(confirm("确定删除？")){
		    	ajaxPost("<%=basePath%>admin_expert/deleteExpert",object,"json","json",ifdelete);
		  	}else{
		    	return false;
		    }
	    }
	    
	    
	    function ifdelete(data){
	        if(data.state==0){
	    		alert("删除成功！");
	    		window.location="<%=basePath%>admin_expert/toAdminFindExpert";
	    	}else{
	    		alert("删除失败!");
	    		return;
	    	}
	    }
	    
		function wait(data){
			if(data.state!=0){
				alert("查询失败!");
				return;
			}
  			var htmlstr="";
  			var eey=data.object;
  			if(eey!=null){
  				for(var i=0;i<eey.length;i++){
  					htmlstr +=  "<tr>"+
              				   	"	<td><input type='checkbox' /></td>"+
              				   	"	<td>"+eey[i].expert_id+"</td>"+
              					"	<td><a style='cursor:pointer' onclick='alert(\"开发中...\")'>"+eey[i].user_basics_id+"</td>"+
              					"	<td>"+eey[i].expert_academic+"</a></td>"+
              					"	<td>"+eey[i].add_user_basics_id+"</td>"+
              					"	<td>"+formatDateTimeStr(eey[i].add_date,1)+"</td>"+
              					"	<td>"+
                				"		<div class='am-btn-toolbar'>"+
                  				"			<div class='am-btn-group am-btn-group-xs'>"+
                  				"				<a onclick='findExpert("+eey[i].expert_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'>查看/编辑</a>"+
                    			"				<a onclick='deleteExpert("+eey[i].expert_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'>删除</a>"+
                  				"			</div>"+
                				"		</div>"+
              					"	</td>"+
            					"</tr>";
  				}
  				document.getElementById("textValue").innerHTML=htmlstr;
  			}else{
  				alert("暂无专家");
  			}
  		}
  	
  		function onloadd(){
	  		var paramData;
	  		var paramData={"1":"1"};                               
	  		var object = JSON.stringify(paramData);
	  		ajaxPost("<%=basePath%>admin_expert/adminFindExpert",object,"json","json",wait);
	  	};
	  
	  	window.onload=function(){
	  		onloadd();
	  	};
    </script>

</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>

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
        
          </div>
        </div>
      </div>
      
    </div>
    <div class="am-g" style="margin-top:10px;">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">专家编号</th>
                <th class="table-id">专家用户编号</th>
                <th class="table-title">专家职称</th>
                <th class="table-type">添加人</th>
                <th class="table-title">添加时间</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody id="textValue"></tbody>
        </table>
          </form>
        </div>

      </div>
    </div>
     <%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
</div>

<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
