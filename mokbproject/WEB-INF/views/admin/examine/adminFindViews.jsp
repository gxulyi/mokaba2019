<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
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
<title>后台管理 商城</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
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
<script type="text/javascript">
    function videoadopt(news_id){
  		var status_state=0;
  		var paramData;
	  	var paramData={news_id:news_id,status_state:status_state};                               
	  	var object = JSON.stringify(paramData);
	  	 if(confirm("确认通过审核吗？")){
	       ajaxPost("<%=basePath%>admin_examine/upVideoState",object,"json","json",video);
	  }else{
	    return false;
	    }
  	}
    function video(vnl){
    	if(vnl.state==0){
    	alert("已通过审核！");
    	window.location.reload();
    	}else{
    		alert("系统异常！");
    		return;
    	}
    }
     function videorefuse(news_id){
  		var status_state=2;
  		var paramData;
	  	var paramData={news_id:news_id,status_state:status_state};                               
	  	var object = JSON.stringify(paramData);
	  	
	  	if(confirm("确认拒绝审核吗？")){
	       	ajaxPost("<%=basePath%>admin_examine/upVideoState",object,"json","json",videoError);
	       
	  }else{
	    return false;
	    }
  	}
    function videoError(vnl){
    	if(vnl.state==0){
    	alert("拒绝通过审核！");
    	window.location.reload();
    	}else{
    		alert("系统异常！");
    		return;
    	}
    }
    function findNew(news_id){
    	alert("开发中...");
    }
    function deleteNew(news_id){
      //alert(news_id);
	  var paramData;
	  var paramData={news_id:news_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_news/deleteNew",object,"json","json",wait2);
	  
    }
    function wait2(data){
        alert("删除视频成功");
    	window.location="<%=basePath%>admin_news/toFindViews";
    }
	function wait(data){
  		/* alert(JSON.stringify(data.ned)); */
  		//debugger;
  		var htmlstr="";
  		var newsDate=data.ned.listNewsEvaluation;
  		/* alert(JSON.stringify(newsDate)); */
  		if(newsDate!=null){
  		var statue="";
  		
  			for(var i=0;i<newsDate.length;i++){
  			if(newsDate[i].status_state==1){
  		      statue="待审核";
  		    }
  			htmlstr+="<tr>"+
              "<td><input type='checkbox' /></td>"+
              "<td>"+newsDate[i].news_id+"</td>"+
              "<td><a style='cursor:pointer' onclick='findNew("+newsDate[i].news_id+")'>"+newsDate[i].evaluation_value+"</a></td>"+
              "<td>"+statue+"</td>"+
              "<td>"+
                "<div class='am-btn-toolbar'>"+
                  "<div class='am-btn-group am-btn-group-xs'>"+
                    "<a onclick='videoadopt("+newsDate[i].news_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 通过</a>"+
                    "<a onclick='videorefuse("+newsDate[i].news_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 拒绝</a>"+
                  "</div>"+
                "</div>"+
              "</td>"+
            "</tr>";
            
  			}
  			document.getElementById("textValue").innerHTML=htmlstr;
  			document.getElementById("total_number").innerHTML=i;
  		}else{
  			alert("暂无视频");
  		}
  	}
  	function onloadd(){
  //	alert("加载。。");
  	  var news_type=4;
	  var paramData;
	  var paramData={news_type:news_type};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_examine/findNewsState",object,"json","json",wait);
	  };
	  window.onload=function(){
	  // alert("1");
	  onloadd();
	  };
    </script>

</head>
<%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->
<body>


	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<%@ include file="../template/admin-body-sidebar.jsp"%><!-- 侧边内容 -->
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<%@ include file="../template/admin-content-heder.jsp"%><!-- body 标题 -->
			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl">
							<!-- <div class="am-btn-group am-btn-group-xs">
								<a href="admin_news/toAddNews" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
							</div> -->

							<!-- <div class="am-form-group am-margin-left am-fl">
								<select>
									<option value="option1">所有类别</option>
									<option value="option2">服务类</option>
									<option value="option3">定制</option>
								</select>
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
							<input type="text" class="am-form-field"> <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button">搜索</button>
							</span>
						</div>
					</div>
				</div> -->
			</div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk"
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" />
										</th>
										<th class="table-news_id">编号</th>
										<th class="table-evaluation_value">内容</th>
										<th class="table-status_state">状态</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">
								</tbody>
							</table>
							<div class="am-cf">
								共<span id="total_number"></span>条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled"><a href="javascript:void(0);">«</a>
										</li>
										<li class="am-active"><a href="javascript:void(0);">1</a>
										</li>
										<li><a href="javascript:void(0);">2</a>
										</li>
										<li><a href="javascript:void(0);">3</a>
										</li>
										<li><a href="javascript:void(0);">4</a>
										</li>
										<li><a href="javascript:void(0);">5</a>
										</li>
										<li><a href="javascript:void(0);">»</a>
										</li>
									</ul>
								</div>
							</div>
							<hr />
							<!-- <p>注：.....</p> -->
						</form>
					</div>

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
