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
		// 获取所有商品
		var currentPage = document.getElementById("currentPage").value;
		var paramData;
	  	var paramData={status_state:1};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>admin_examine/examineNewsByState?currentPage="+currentPage,object,"json","json",findAllStore);
		}); 
	/*展示所有商品信息函数*/
	function findAllStore(vsi){
	//alert(JSON.stringify(vsi.object));
      	var newsList = vsi.object;
      	var newsType ="";
     	if(newsList!= null){
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
	     	    dataSet.push(['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>', list.news_title, newsType,formatDateTimeStr(list.add_date, 1), '<a  onclick="examState(' + list.news_id + ','+ 0 +')" class="btn bg-deep-blue operation_btn">通过</a>' +" " + '<a  onclick="examState(' + list.news_id + ','+ 2 +')" class="btn bg-deep-blue operation_btn">不通过</a>']);
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
    //未通过审核 status_state=2
	  //通过审核    status_state=0
	  function examState(news_id,status_state){
	  debugger;
	  //alert(store_id);
	  var paramData;
	  var paramData={news_id:news_id,status_state:status_state};                               
	  var object = JSON.stringify(paramData);
	  if(confirm("确认执行此操作吗？")){
	    ajaxPost("<%=basePath%>admin_examine/updateNewsState",object,"json","json",wait2);
	    return true;
	  }else{
	    return false;
	    }
	  
	  }; 
	  function wait2(data){
	  	//alert(JSON.stringify(data));
	  	if(data.object.status_state == 0){
	  		alert("审核通过");
	  	}else if(data.object.status_state == 2){
	  		alert("审核不通过");
	  	}
	  	location.reload() ;
	  };
	
	
</script>