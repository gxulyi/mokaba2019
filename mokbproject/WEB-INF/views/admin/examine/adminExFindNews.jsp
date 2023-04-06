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
    //执行通过/拒绝操作方法
    function newsEvaluation(news_evaluation_id,status_state){
  		//var status_state=0;
  		//alert("news_evaluation_id:"+news_evaluation_id+",status_state:"+status_state);
  		var paramData;
	  	var paramData={news_evaluation_id:news_evaluation_id,status_state:status_state};                               
	  	var object = JSON.stringify(paramData);
	  	 if(confirm("确认执行此操作吗？")){
	       ajaxPost("<%=basePath%>admin_examine/updateNewsEvaluationByState",object,"json","json",newsEvaluationState);
	  }else{
	    return false;
	    }
  	}
  	/*判断操作是否执行成功*/
    function newsEvaluationState(vnl){
    	if(vnl.object.status_state == 0 && vnl.state == 0){
    	alert("已通过审核！");
    	window.location.reload();
    	}else if(vnl.object.status_state=2 && vnl.state == 0){
    	  alert("审核被拒绝！");
    	  window.location.reload();
    	}else{
    		alert("系统异常！");
    		return;
    	}
    }
    
    function findNew(news_id){
    	alert("开发中...");
    }
	function wait(data){
  		/* alert(JSON.stringify(data.ned)); */
  		//debugger;
  		var htmlstr="";
  		var newsEvaluation=data.ned.listNewsEvaluation;
  		/* alert(JSON.stringify(newsDate)); */
  		if(newsEvaluation!=null){
  		var statue="";
  		
  			for(var i=0;i<newsEvaluation.length;i++){
  			if(newsEvaluation[i].status_state==1){
  		      statue="待审核";
  		    }
  			htmlstr+="<tr>"+
              "<td><input type='checkbox' /></td>"+
              "<td>"+newsEvaluation[i].news_id+"</td>"+
              "<td><a style='cursor:pointer' onclick='findNew("+newsEvaluation[i].news_id+")'>"+newsEvaluation[i].evaluation_value+"</a></td>"+
              "<td>"+statue+"</td>"+
              "<td>"+
                "<div class='am-btn-toolbar'>"+
                  "<div class='am-btn-group am-btn-group-xs'>"+
                    "<a onclick='newsEvaluation("+newsEvaluation[i].news_evaluation_id+","+0+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 通过</a>"+
                    "<a onclick='newsEvaluation("+newsEvaluation[i].news_evaluation_id+","+2+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 拒绝</a>"+
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
  	  var news_type=4;
	  var paramData;
	  var paramData={"":""};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_examine/findEssEvaluations",object,"json","json",wait);
	  };
	  window.onload=function(){
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
