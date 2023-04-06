<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


 <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="file/weixin_xiti/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="file/weixin_xiti/css/style.css"/>       
        <link href="file/weixin_xiti/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="file/weixin_xiti/assets/css/ace.min.css" />
        <link rel="stylesheet" href="file/weixin_xiti/font/css/font-awesome.min.css" />
        <link rel="stylesheet" href="css/template/admin.css">
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="file/weixin_xiti/js/jquery-1.9.1.min.js"></script>
        <script src="file/weixin_xiti/assets/js/bootstrap.min.js"></script>
		<script src="file/weixin_xiti/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="file/weixin_xiti/assets/js/jquery.dataTables.min.js"></script>
		<script src="file/weixin_xiti/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="file/weixin_xiti/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="file/weixin_xiti/assets/laydate/laydate.js" type="text/javascript"></script>
<title>万祖权</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Guestbook_style">
 <div class="search_style" style="border:1px solid #394a59;">
   <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">自动回复类型：</label>
       <select name="" id="selectidd"  class="text_add" style="width:100px;" class="col-xs-6">
       <option value="1">活动</option>
       <option value="2">帮助</option>
       <option value="3">推荐</option>
       <option value="4">健身锻炼</option>
       <option value="5">健身产品</option>
      
       </select>
       </li>
      
   <li style="width:90px;" onclick="select()"><button type="button" class="btn_search" style="background:#55cbd2 !important;"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
    
    <script type="text/javascript">
    
    	     //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        var k=parseInt(getUrlParam("article_type"));
        $("#selectidd").removeAttr("selected");
       $("#selectidd option[value='"+k+"']").attr("selected","selected");
        //  $("#selectidd").get(0).selectedindex=k;
 function select(){

 var article_type= $("#selectidd").find("option:selected").val();

    window.location.href="weixinAdminController/AutoReturn?article_type="+article_type; 
 //UEditorTemplateController/ArticleList?article_type=1
}



</script>
     
    <!--网页列表-->
    <div class="Guestbook_list">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead id="yhk">
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">ID</th>
          <th width="150px">标题</th>
          <th width="">内容简介</th>
          <th width="200px">时间</th>
           <th width="200">公众号图文图片</th>
          <th width="260">操作</th>
          </tr>
      </thead>
	<tbody id="tbodyiid">
		   
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>


<%
  // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
List<HashMap<String, Object>> listMap=null;
listMap=(List<HashMap<String, Object>>)request.getAttribute("listMap");

 for (Map<String, Object> m : listMap)
    {
 
 %>		   
		   
		   
		   
		   
		   
		   
		 
		   <tr>
     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td><%=m.get("article_id") %></td>
          <td><u style="cursor:pointer"  class="text-primary" onclick="member_show('张小泉','member-show.html','1031','500','400')"><%=m.get("title") %></u></td>
          <td class="text-l">
          <a href="javascript:;" onclick="Guestbook_iew('12')"><%=m.get("content_introduction") %></a>
          <td><%=m.get("modification_time") %></td>
          <td class="td-status"> <img style="width:100%" src='<%=m.get("pictures_url") %>'/></td> 
          <td class="td-manage">
      <a   href="UEditorTemplateController/SelectArticleDatail?article_id=<%=m.get("article_id") %>" title="查看"  class="btn btn-xs btn-success">查看</a>   
            <a  href="weixinAdminController/EditAutoReturn?article_id=<%=m.get("article_id") %>" title="编辑"  href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
              <a  onclick="qunfa(<%=m.get("article_id") %>)" title="编辑"  href="javascript:;"  class="btn btn-xs btn-info" >群发</a>           
     <a  href="javascript:;"  onclick="member_del(this,'<%=m.get("article_id") %>')" title="删除" class="btn btn-xs btn-warning" >删除<!-- <i class="fa fa-trash  bigger-120"></i> --></a>
          </td>
        </tr>
		   
		 <%  } %>
        </tbody>
      </table>
    </div>
 </div>
</div>
<style type="text/css">
#loading{
	position: fixed;
	_position:absolute;

	top: 50%;
	left: 50%;
	margin: -141px 0 0 -201px;
	width: 300px;
	background-color:#fff;

	line-height: 280px;
	text-align:center;
	font-size: 14px;

	overflow:hidden;
	 z-index: 9999;
}	
 #maskLayer{	position: fixed;
	_position:absolute;
	top: 0;
	left:0;
  margin:0;
   z-index: 9992;
   padding:0;width:100%; height:900px; background-color:#000000; opacity:0.3; -moz-opacity:0.5; filter:alpha(opacity=50);}

</style>

<img id="loading" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1519754561163&di=270ac80289e813fe36bed13e19588b9a&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F017027589992c1a801219c774452bb.gif"></img>
<div id="maskLayer">遮罩层</div>
</body>
</html>



	  <script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">

$("#loading").hide();
$("#maskLayer").hide();




function qunfa(article_id111){

  
  
  
  var article_id=article_id111;
  var paramData={article_id:article_id};    
  var object = JSON.stringify(paramData);
     $.ajax({
                                
	     // 
          url:"<%=basePath%>UEditorTemplateController/qunfaSend",
          type:"post",
          data:object,
          dataType: 'json',
           contentType: "application/json",
          timeout:0,
          beforeSend:function(XMLHttpRequest){
              //alert('远程调用开始...');
             // $("#loading").html('');
              $("#loading").show();
              $("#maskLayer").show();
              
         },
         success:function(data,textStatus){
            // alert('开始回调，状态文本值：'+textStatus+' 返回数据：'+data);
              //  $("#loading").empty();
                
                   $("#loading").hide();
                    $("#maskLayer").hide();
           alert("成功发送"+data.countOK+"条");
           alert("失败"+data.countNO+"条");
           
           },
          complete:function(XMLHttpRequest,textStatus){
              // alert('远程调用成功，状态文本值：'+textStatus);
            // $("#loading").empty();
             $("#loading").hide();
                    $("#maskLayer").hide();
           },
           error:function(XMLHttpRequest,textStatus,errorThrown){
              alert('error...状态文本值：'+textStatus+" 异常信息："+errorThrown);
             $("#loading").hide();
                    $("#maskLayer").hide();
          }
       });
   
  
  
  
  
       /* 
         var paramData={article_id:article_id};                               
	      var object = JSON.stringify(paramData);
	      ajaxPost("UEditorTemplateController/qunfaSend",object,"json","json",qunfaSend);

function qunfaSend(data){

alert("成功发送条数"+data.countOK);
alert("失败发送条数"+data.countNO);

}

*/

}
 /*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*网页-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
	var jsondata={article_id:id};
	  var object = JSON.stringify(jsondata);
  ajaxPost("<%=basePath%>UEditorTemplateController/DeleteConten",object,"json","json",DeleteConten);
  function	DeleteConten(data){
	if(parseInt(data)==1){
	
	$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	}else{
	layer.msg('删除失败，请稍后再试!',{icon:1,time:1000});
	return false;
	
	}
	
	
		}
	})
}

/*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Reply_style').css('display','block');
		}
	else{
		
		 $('.Reply_style').css('display','none');
		}	
	})
/*网页查看*/
function Guestbook_iew(id){
	var index = layer.open({
        type: 1,
        title: '网页信息',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:$('#Guestbook'),
		btn:['确定','取消'],
		yes: function(index, layero){		 
		  if($('input[name="checkbox"]').prop("checked")){			 
			 if($('.form-control').val()==""){
				layer.alert('回复内容不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			 }else{			
			      layer.alert('确定回复该内容？',{
				   title: '提示框',				
				   icon:0,	
				   btn:['确定','取消'],	
				   yes: function(index){					   
					     layer.closeAll();
					   }
				  }); 		  
		   }			
	      }else{			
			 layer.alert('是否要取消回复！',{
               title: '提示框',				
			icon:0,		
			  }); 
			  layer.close(index);      		  
		  }
	   }
	})	
};
	/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,5,6]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
</script>



