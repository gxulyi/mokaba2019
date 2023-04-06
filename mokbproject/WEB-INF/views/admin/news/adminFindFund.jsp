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
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 基金</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript">
    function findNew(news_id){
    	alert("开发中...");
    }
    function deleteNew(news_id){
	  var paramData;
	  var paramData={news_id:news_id};                               
	  var object = JSON.stringify(paramData);
	  if(confirm("确定删除？")){
    	ajaxPost("<%=basePath%>admin_news/deleteNew",object,"json","json",wait2);
  	  }else{
    	return false;
      }
    }
    function wait2(data){
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
              			"	<td><a style='cursor:pointer' onclick='findNew("+newsDate[i].news_id+")'>"+newsDate[i].news_title+"</a></td>"+
              			"	<td>"+newsDate[i].read_num+"</td>"+
              			"	<td>"+newsDate[i].thumbs_up+"</td>"+
              			"	<td>"+
                		"		<div class='am-btn-toolbar'>"+
                  		"			<div class='am-btn-group am-btn-group-xs'>"+
                  		"				<a class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='alert(\"开发中...\")'>编辑</a>"+
                   		"				<a onclick='deleteNew("+newsDate[i].news_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'>删除</a>"+
                  		"			</div>"+
                		"		</div>"+
              			"	</td>"+
            			"</tr>";
  			}
  			document.getElementById("textValue").innerHTML=htmlstr;
  			document.getElementById("total_number").innerHTML=i;
  		}else{
  			alert("暂无基金");
  		}
  	}
  	function onloadd(){
  	  var news_type=3;
	  var paramData;
	  var paramData={news_type:news_type};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_news/findNews",object,"json","json",wait);
	  };
	  window.onload=function(){
	  // alert("1");
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
            <div class="am-btn-group am-btn-group-xs">
              <a href="admin_news/toAddNews" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
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
            <span class="am-input-group-btn"><button class="am-btn am-btn-default" type="button">搜索</button></span>
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
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">编号</th>
                <th class="table-title">基金名称</th>
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
                  <li class="am-disabled"><a href="javascript:void(0);">«</a></li>
                  <li class="am-active"><a href="javascript:void(0);">1</a></li>
                  <li><a href="javascript:void(0);">2</a></li>
                  <li><a href="javascript:void(0);">3</a></li>
                  <li><a href="javascript:void(0);">4</a></li>
                  <li><a href="javascript:void(0);">5</a></li>
                  <li><a href="javascript:void(0);">»</a></li>
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
