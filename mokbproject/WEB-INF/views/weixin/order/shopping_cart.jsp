<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>购物车</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
 		<link rel="stylesheet" href="css/Shopping_Cart.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery-form.js" ></script> 
  		<script type="text/javascript" src="js/ajax.js"></script>
  		<style type="text/css">
			.mui-icon-home:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/chadao.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-email:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/tcld.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-contact:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/cpws.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-gear:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/huiyuan.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">我的购物车</h1>
		</header>
		
		<div class="mui-content" style="padding-bottom: 100px;height:100%;">
			<form class="mui-input-group">
				<div id="commList">
				<!-- 
					<div class="mui-input-row mui-checkbox mui-left">
						<a href="javascript:;"> <img class=" mui-pull-left" src="http://via.placeholder.com/100x100">
							<div class="mui-media-body"> 
								<span class="mui-ellipsis-2 name">庄园红茶</span>
								<p class="mui-ellipsis not-content">净含量：120g</p> 
								<span class="money">￥9.9</span>
								<p class="mui-pull-right">
									<div class="mui-numbox" data-numbox-min="1"> 
										<button class="mui-btn mui-btn-numbox-minus" type="button">-</button> 
										<input id="test" class="mui-input-numbox" type="number" value="1"> 
										<button class="mui-btn mui-btn-numbox-plus" type="button">+</button>
									</div>
								</p>
							</div>
						</a> <input name="checkbox" value="Item 1" type="checkbox"> 
					</div>
						
					
					 -->
				</div>
			</form>
			<div class="shopCart">
				<div class="left">
					<div class="price" style="padding-left:10px;">
						<span>合计:￥</span> <span id="total_price">0</span> 
					</div>
				</div>
				<div class="right" id="pay" onclick="confirmation_order(this);">去结算</div>
			</div>
		</div>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" href="javascript:ovid()" onclick="window.location='HomeController/home'">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">茶道</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='weixin_news/article'">
				<span class="mui-icon mui-icon-email"></span>
				<span class="mui-tab-label">谈茶论道</span>
			</a>
			<a class="mui-tab-item mui-active" onclick="window.location='order_weixin/shopping_cart'">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">焙茶屋</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='HomeController/memberCenter'">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">会员</span>
			</a>
		</nav>
	<script type="text/javascript">
	$(function() {
		//获取url中的参数
		function getUrlParam(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg); //匹配目标参数
			if(r != null) return unescape(r[2]);
			return null; //返回参数值
		}
		var paramData={"1":"1"};                               
	   	var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>order_weixin/findShoppingCart",object,"json","json",showCar);
	    });
		 function showCar(data){
	    	if(data.state!=0){
	    		alert("登录已超时,请重新登录!");
	    		return;
	    	}
	    	var object=data.object;
	    	if(object==null){
	    		return;
	    	}
	    	var html="";
	    	for(var i=0;i<object.length;i++){
	    		var store_pictures=object[i].store_picture.split(";");
	    		var store_picture=store_pictures[0];
	    		html+="<div class='mui-input-row mui-checkbox mui-left'style='position: relative;'>"+
					"		<a href='javascript:;'> <img class=' mui-pull-left' src='<%=basePath%>file/store/img/"+store_picture+"'>"+
					"			<input type='hidden' value='"+object[i].store_id+"'> "+
					"			<div class='mui-media-body'> "+
					"				<span class='mui-ellipsis-2 name'>"+object[i].store_name+"</span>"+
					"				<p class='mui-ellipsis not-content'>净含量："+object[i].net_weight+"g</p> "+
					"				<input type='hidden' value='"+object[i].store_price+"' type='text'>"+
					"				<span class='money'>￥"+object[i].store_price+"</span>"+
					"				<div class='mui-pull-right'>"+
					"					<div class='mui-numbox' data-numbox-min='1'> "+
					"						<button class='mui-btn mui-btn-numbox-minus' type='button' onclick='reduceNum(this);'>-</button> "+
					"						<input id='test' class='mui-input-numbox' type='number' value=1 > "+
					"						<button class='mui-btn mui-btn-numbox-plus' type='button' onclick='addNum(this);'>+</button>"+
					"					</div>"+
					"				</div>"+
					"			</div>"+
					"		</a> "+
					"		<input name='checkbox' value='"+object[i].store_price+"' type='checkbox' onclick='allprice(this)'> "+
					"		<span style='position: absolute;top: 5px;right:5px;color:#666;font-size:14px;' onclick='deleteOne("+object[i].store_id+");'>删除</span>"+
					"	</div>";
	    	}
	    	document.getElementById("commList").innerHTML=html; 
	    }
	
	
	   
	    function reduceNum(obj){
	    	var num=$(obj).parent().children("input").val();
	    	var unit_price=$(obj).parent().parent().parent().children("input").val()*1;//单价
	    	if(num<=1){
	    		return;
	    	}else{
	    		num--;
	    	}
	    	var price=unit_price*num;
	    	price=toDecimal2(price);
	    	$(obj).parent().children("input").val(num);
	    	$(obj).parent().parent().parent().children("span:last").html("￥"+price);
	    	$(obj).parent().parent().parent().parent().parent().children("input").val(price);//复选框
	    	var all_price=settlement();
	    	$("#total_price").html(all_price);
	    }
	    function addNum(obj){
	    	var num=$(obj).parent().children("input").val();//数量
	    	var unit_price=$(obj).parent().parent().parent().children("input").val()*1;//单价
	    	num++;
	    	var price=unit_price*num;
	    	price=toDecimal2(price);
	    	$(obj).parent().children("input").val(num);
	    	$(obj).parent().parent().parent().children("span:last").html("￥"+price);
	    	$(obj).parent().parent().parent().parent().parent().children("input").val(price);
	    	var all_price=settlement();
	    	$("#total_price").html(all_price);
	    }
	    function allprice(check){
	    	if(check.checked == true){
	    		var all_price=settlement();
	    		all_price=toDecimal2(all_price);
	    		$("#total_price").html(all_price);
	    		all_price=all_price*1;
	    	}else{
	    		var all_price=settlement();
	    		all_price=toDecimal2(all_price);
	    		$("#total_price").html(all_price);
	    	}
	    }
	    function settlement(){
	    
	    	var arrChk=$("input[name='checkbox']:checked"); 
				var price=0;
                if(arrChk.length<=0){
                	//alert('请先勾选数据,在进行批量清档！');
               	}else{
               		var i=0;
               		$(arrChk).each(function(){
               		var thisprice=this.value*1;
               		price=price*1;
               		price=price+thisprice;
               		price=toDecimal2(price);
                    i++;
                	}); 
              	}
            return price;
	    }
//保留两位小数  
function toDecimal2(num) { 
      var f = parseFloat(num); 
      if (isNaN(f)) { 
        return false; 
      } 
      var f = Math.round(num*100)/100; 
      var s = f.toString(); 
      var rs = s.indexOf('.'); 
      if (rs < 0) { 
        rs = s.length; 
        s += '.'; 
      } 
      while (s.length <= rs + 2) { 
        s += '0'; 
      } 
      return s; 
} 

function confirmation_order(one1){
	$(this).attr("disabled","disabled"); //只能点一次
	var arrChk=$("input[name='checkbox']:checked");
	if(arrChk.length<=0){
        //alert('请先勾选数据,在进行批量清档！');
        return;
    }else{
    	var jsonArray=[];
    	var str="";
        $(arrChk).each(function(){
        	var id=$(this).parent().children("a").children("input").val();
        	var num=$(this).parent().children("a").children("div").children("div").children("div").children("input").val();
            if(str==""){
            	str+="order_id="+id+"&"+id+"="+num+"";
            }else{
            	str+="&order_id="+id+"&"+id+"="+num+"";
            }
        }); 
        
        window.location="<%=basePath%>order_weixin/confirmation-order?"+str;
        
    };
}
function deleteOne(store_id){
	var objects={store_id:store_id};                               
	var object = JSON.stringify(objects);
	ajaxPost("<%=basePath%>order_weixin/deleteShoppingCartOne",object,"json","json",deleteSuccess);
}
function deleteSuccess(data){
	alert(data.message);
	if(data.state==0){
		location.reload();
	}
}
	</script>
	<script src="js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		mui('body').on('tap','a',function(){
			// 获取onclick
		    var str = this.onclick;
		    // 强制转换为字符串
		    str = String(str);
		    var functionString = str.substr(26,str.length - 27);
		    // 执行就好了
		    eval(functionString);
		});
		mui('body').on('tap','button',function(){
			// 获取onclick
		    var str = this.onclick;
		    // 强制转换为字符串
		    str = String(str);
		    var functionString = str.substr(26,str.length - 27);
		    // 执行就好了
		    eval(functionString);
		});
	</script>
	</body>

</html>