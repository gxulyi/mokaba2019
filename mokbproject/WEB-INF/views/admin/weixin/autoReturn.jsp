<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<title>商品</title>
</head>
<body>
	<input type='hidden' id="currentPage" value="1" />
		<div class="margin order_style" id="page_style">	 
			<div class="List_display">
			  <table class="table table_list table_striped table-bordered" id="sample-table">
			  <thead>
			  <tr>
			  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
			   <th >新闻标题</th>
			   <th >新闻类型</th>   
			   <th >新闻增加日期</th>
			   <th >操作</th>
			   </tr>   
			  </thead>
			  <tbody>
			   <tr>
			   </tr>
			  </tbody>
			 </table>
			</div>
	   </div>
</body>
</html>
<script>
	var dataSet=[];
	$(document).ready(function(){  
		// 获取所有新闻
		var currentPage = document.getElementById("currentPage").value;
		var paramData;
	  	var paramData={status_state:0};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>admin_news/findNewsByState?currentPage="+currentPage,object,"json","json",findAllNews);
		}); 
	/*展示所有新闻信息函数*/
	function findAllNews(vsi){
	//alert(JSON.stringify(vsi.object));
      	var newsList = vsi.object;
      	var newsType ="";
     	if(newsList != null){
	     	for(var i = 0;i<newsList.length;i++){
	     	 var list = newsList[i];
	     	   if(list.news_type==1){
	     		   newsType="知识";
	     		}else if(list.news_type==2){
	     		newsType="动态";
	     		}else if(list.news_type==3){
	     			newsType="基金";
	     		}else if(list.news_type==4){
	     			newsType="视频";
	     		}else{
	     			newsType="其他";
	     		}
	     	    dataSet.push(['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>', list.news_title, newsType,formatDateTimeStr(list.add_date, 1), '<a  onclick="findNewsOne(' + list.news_id + ')" class="btn bg-deep-blue operation_btn">查看</a>' +" " + '<a  onclick="updateNews(' + list.news_id + ')" class="btn bg-deep-blue operation_btn">编辑</a>' + " " + '<a  onclick="deleteNews(' + list.news_id + ')" class="btn bg-deep-blue operation_btn">删除</a>']);
			}
  		}
  		page();
	}
	/*分页函数*/
    function page(){
    	debugger;
    	var oTable1 = $('#sample-table').dataTable( {
				"data": dataSet,
				"width":"100%",	
				"bLengthChange":false,
				"iDisplayLength": 12,
				//"columns" : _tableCols,
				"sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
				"bInfo" : true, //是否显示页脚信息，DataTables插件左下角显示记录数 
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": true,
		        "aoColumnDefs": [{"orderable":false,"aTargets":[0,1,2,3]
				}]
		
			   });
		$('table th input:checkbox').on('click' , function(){
							var that = this;
							$(this).closest('table').find('tr > td:first-child input:checkbox')
							.each(function(){
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});
								
						});
    
    };
    
    /*查看单个新闻信息*/
    function findNewsOne(news_id){
    	var parame="?news_id="+news_id;
		window.location="<%=basePath%>admin_news/toAdminNewsDetail"+parame;
	}
	
	
	
	<%-- function findStore01(store_type){
	//alert(store_type);
	    var currentPage = document.getElementById("currentPage").value;
		var paramData;
	  	var paramData={store_type:store_type};                               
	  	var object = JSON.stringify(paramData);
	 	ajaxPost("<%=basePath%>admin_store/findAllStore?currentPage="+currentPage,object,"json","json",findAllStore);
	}
	//查看评价
	function toFindEvaluation(store_id){
		var parame="?store_id="+store_id;
		window.location="<%=basePath%>admin_store/toFindEvaluation"+parame;
	}; --%>
	
	//修改新闻
	function updateNews(news_id){
		var parame="?news_id="+news_id;
		window.location="<%=basePath%>admin_news/toAdminUpdateNews"+parame;
	};
	
	//删除新闻
	function deleteNews(news_id){
		var paramData;
	  	var paramData={news_id:news_id};                               
	  	var object = JSON.stringify(paramData);
	  if(confirm("确认删除该新闻吗？")){
	  	   ajaxPost("<%=basePath%>admin_news/deleteNew",object,"json","json",wait2);
	  }else{
	    return false;
	    }
	};
	  
	function wait2(data){
	    alert(JSON.stringify(data));
	     if(data.state ==0){
	       alert(data.message);
	     }else{
	      alert("新闻删除失败");
	     }
	  	window.location="<%=basePath%>admin_news/autoReturnNews";
	};
</script>