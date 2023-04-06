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
			   <th >商品编号</th>
			   <th >商品名称</th>   
			   <th >商品销售价格</th>
			   <th >商品录入人</th>
			   <th >商品录入时间</th>
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
	  	var paramData={currentPage:1};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>admin_store/findAllStore?currentPage="+currentPage,object,"json","json",findAllStore);
		}); 
	/*展示所有商品信息函数*/
	function findAllStore(vsi){
      	var StoreBasicsData = vsi.sbd;
     	var StoreBasics = StoreBasicsData.storeBasics;
     	var storeBasicsList = StoreBasicsData.storeBasicsList;
     	if(storeBasicsList != null){
	     	for(var i = 0;i<storeBasicsList.length;i++){
	     		var list = storeBasicsList[i];
	     	    dataSet.push(['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>', list.store_id, list.store_name, list.store_price, list.user_basics_id, formatDateTimeStr(list.add_date, 1), '<a  onclick="findStoreOne(' + list.store_id + ')" class="btn bg-deep-blue operation_btn">查看</a>' +" " + '<a  onclick="updateStore(' + list.store_id + ')" class="btn bg-deep-blue operation_btn">编辑</a>' + " " + '<a  onclick="deleteStore(' + list.store_id + ')" class="btn bg-deep-blue operation_btn">删除</a>']);
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
    
    /*查看单个商品信息*/
    function findStoreOne(store_id){
    	var parame="?store_id="+store_id;
		window.location="<%=basePath%>admin_store/toFindStoreById"+parame;
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
	
	//修改商品
	function updateStore(store_id){
		var parame="?store_id="+store_id;
		window.location="<%=basePath%>admin_store/adminUpdateStore"+parame;
	};
	
	//删除商品
	function deleteStore(store_id){
		var paramData;
	  	var paramData={store_id:store_id};                               
	  	var object = JSON.stringify(paramData);
	  if(confirm("确认删除该商品吗？")){
	  	   ajaxPost("<%=basePath%>admin_store/deleteStore",object,"json","json",wait2);
	  }else{
	    return false;
	    }
	};
	  
	function wait2(data){
	     if(data.state ==0){
	       alert(data.mesasge);
	     }else{
	      alert("商品删除失败");
	     }
	  	window.location="<%=basePath%>admin_store/adminFindStore";
	};
</script>