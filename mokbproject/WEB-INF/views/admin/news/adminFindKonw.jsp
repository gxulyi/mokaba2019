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
  	<title>后台管理 知识</title>
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
  		function addEssence(news_id){
	  		var paramData;
		    var paramData={news_id:news_id,news_type:1};                               
		    var object = JSON.stringify(paramData);
		    if(confirm("添加到精华？")){
		    	ajaxPost("<%=basePath%>admin_news/addEssence",object,"json","json",wait2);
		  	}else{
		    	return false;
		    }
  		}
  		
	    function findNew(news_id){
	    	window.location="<%=basePath%>admin_news/toAdminExamineAdd?news_id="+news_id;
	    }
	    
	    function deleteNew(news_id){
		  var paramData;
		  var paramData={news_id:news_id};                               
		  var object = JSON.stringify(paramData);
		   if(confirm("确定删除？")){
		    	ajaxPost("<%=basePath%>admin_news/deleteNew",object,"json","json",wait3);
		  	}else{
		    	return false;
		    }
	    }
	    
	    function wait2(data){
	        if(data.state==0){
	    		alert("添加成功！");
	    		window.location="<%=basePath%>admin_news/toFindnews";
	    	}
	    	
	    }
	    
	    function wait3(data){
	        if(data.state==0){
	    		alert("删除成功！");
	    		window.location="<%=basePath%>admin_news/toFindnews";
	    	}
	    }
	    
		function wait(data){
  			var htmlstr="";
  			var newsDate=data.newsDate.listNews;
  			if(newsDate!=null){
  				for(var i=0;i<newsDate.length;i++){
  					htmlstr +=  "<tr>"+
              				   	"	<td><input type='checkbox' /></td>"+
              					"	<td>"+newsDate[i].news_id+"</td>"+
              				 // "	<td><a style='cursor:pointer' onclick='findNew("+newsDate[i].news_id+")'>"+newsDate[i].news_title+"</a></td>"+
              					"	<td><a style='cursor:pointer' onclick='alert(\"开发中...\")'>"+newsDate[i].news_title+"</a></td>"+
              					"	<td>"+newsDate[i].read_num+"</td>"+
              					"	<td>"+newsDate[i].thumbs_up+"</td>"+
              					"	<td>"+
                				"		<div class='am-btn-toolbar'>"+
                  				"			<div class='am-btn-group am-btn-group-xs'>"+
                    			"				<a class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='iframeUpdateNews("+newsDate[i].news_id+")'>编辑</a>"+
                    			"				<a onclick='deleteNew("+newsDate[i].news_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'>删除</a>"+
                    			"				<a onclick='addEssence("+newsDate[i].news_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'>添加到精华</a>"+
                  				"			</div>"+
                				"		</div>"+
              					"	</td>"+
            					"</tr>";
  				}
  				document.getElementById("textValue").innerHTML=htmlstr;
  				document.getElementById("total_number").innerHTML=i;
  			}else{
  				alert("暂无知识");
  			}
  		}
  	
  		function onloadd(){
  	  		var news_type=1;
	  		var paramData;
	  		var paramData={news_type:news_type};                               
	  		var object = JSON.stringify(paramData);
	  		ajaxPost("<%=basePath%>admin_news/findNews",object,"json","json",wait);
	  	};
	  
	  	window.onload=function(){
	  		onloadd();
	  	};
	  	
	  	function iframeUpdateNews(news_id){
	  		alert(news_id);
	  		window.location="<%=basePath%>admin_news/iframeUpdateNews?news_id="+news_id;
	  	}
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
                <th class="table-id">编号</th>
                <th class="table-title">知识名称</th>
                <th class="table-type">阅读数量</th>
                <th class="table-author">点赞数量</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody id="textValue"></tbody>
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
     <%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
</div>

<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
