<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String idss=String.valueOf(request.getAttribute("order_id"));
String[] sid=idss.split(";");
String values="";
for(int i=0;i<sid.length;i++){
	values+=String.valueOf(request.getAttribute("s"+sid[i]))+";";
}
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>确认订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/confirmation-order.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
	</head>
	<body>
		<input id="order_id"  type="hidden" value="${ order_id}"> 
		<div class="mui-content" style="padding-bottom:50px;">
		<a href="javascript:void()">
			<div class="order-consignee">
				<div class="order-consignee-img">
					<img src="images/Commodity_details/dw.png" />
				</div>
				<div class="order-consignee-dz">
					<div class="order-consignee-span">
						<p>收货人：<label id="user_name"></label></p>
						<p id="tel_phone"></p>
					</div>
					<div class="order-consignee-span">
						<span>收货地址：<label id="order_addr"></label></span>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>
			</a>
			<div style="height: 15px;">
				<img style="width:100%;height: 10px;margin-bottom: 10px;" src="images/Commodity_details/orderimg.png" />
			</div>
			<div style="height: 25px;background: #FFFFFF;border-bottom: 1px solid #f1f1f1;"></div>
			<ul class="mui-table-view" id="storeList">
			<!-- 
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x91">
			            <div class="mui-media-body">
			              	 <div class="mui-media-body-wz">【日本·cosme用户评价满分全5星】cure水润去角质凝胶250g</div> 
			                <div class="mui-ellipsis" style="float: left;line-height: 20px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                </div>
			                <div style="clear: both;"></div>
			                <div class="mui-pull-left">
								<div class="mui-numbox" data-numbox-min="1"> 
									<button class="mui-btn mui-btn-numbox-minus" type="button">-</button> 
									<input id="test" class="mui-input-numbox" type="number" value="1"> 
									<button class="mui-btn mui-btn-numbox-plus" type="button">+</button> 
								</div>
							</div>
			            </div>
			        </a>
			    </li>
			    
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x91">
			            <div class="mui-media-body">
			              	 <div class="mui-media-body-wz">【日本·cosme用户评价满分全5星】cure水润去角质凝胶250g</div> 
			                <div class="mui-ellipsis" style="float: left;line-height: 20px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                </div>
			                <div style="clear: both;"></div>
			                <div class="mui-pull-left">
								<div class="mui-numbox" data-numbox-min="1"> 
									<button class="mui-btn mui-btn-numbox-minus" type="button">-</button> 
									<input id="test" class="mui-input-numbox" type="number" value="1"> 
									<button class="mui-btn mui-btn-numbox-plus" type="button">+</button> 
								</div>
							</div>
							<div class="mui-pull-right">
								<label>删除</label>
							</div>
			            </div>
			        </a>
			    </li>
			     -->
			</ul>
			<ul class="mui-table-view order-ul-li" style="">
				<li class="" style="height:40px;padding: 11px 15px 11px 0;border-bottom:1px solid #c8c7cc;margin-left:15px">
		            	提货方式：
		            	<select class="mui-pull-right"  id="ziti" style="width:auto;margin:0;padding:0;text-align: right;">
		            		<option value=0>请选择提货方式</option>
		            		<option value=1>邮寄</option>
		            		<option value=2>现场提货</option>
		            	</select>
		          </li>  	
		        <li class="mui-table-view-cell">
		            	运费：
		            <label class="mui-pull-right" id="freight" value="0.00">0.00</label>
		        </li>
		        <li class="mui-table-view-cell">
		            <a class="">
		                使用积分：
		                 <input id="jifen" onchange="useintegral(this.value)" type="text" class="mui-pull-right" style="height:20px;font-size:14px;padding-right: 20px;width:80%;margin:0;border:none;text-align: right;" value="0" /><!-- 0</label> -->
		            </a>
		            
		        </li>
		        <li class="mui-table-view-cell">
		            <a class="mui-navigate-right">
		                 使用满减券：
		                 <label class="mui-pull-right" style="padding-right: 20px;"><span id="manjian" value="0"></span></label>
		            </a>
		        </li>
		        <li class="mui-table-view-cell">
		        	  使用现金券：<select id="money_voucher" class="mui-pull-right" style="padding-right: 20px;width:auto;margin:0;padding:0" >
							</select>
		        </li>
		        <li class="mui-table-view-cell">
		                 	支付方式：
		            <a class="mui-pull-right" style="padding-right: 20px;color: #299f99;">微信</a>
		        </li>
		    </ul>
		</div>
		<div class="shopCart">
			<div class="left">
				<div class="price">
					<span id="sto_num"></span> <span id="total"></span> 
					<input type="hidden" id="all_price" value=""><!-- 订单积分后总价 -->
					<input type="hidden" id="pri_prive" value=""><!-- 订单原价总价 -->
					<input type="hidden" id="full_price" value=""><!-- 满的总价 -->
					<input type="hidden" id="required_integral" value=""><!-- 使用积分 -->
					<input type="hidden" id="required_integral1" value=""><!-- 最大可用积分 -->
					<input type="hidden" id="required_integral2" value=""><!-- 用户可用积分 -->
					<input type="hidden" id="jifen1" value="0">
				</div>
			</div>
			<div class="right" id="pay" onclick="settlement(this);"></div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
		var pri_prive=0.00;//总价
		var all_price1=0.00;//自提价格
		var jifen_price=0.00;//积分商品原价
		var endtime=0;
		$("#ziti").change(function(){
			var ziti=$(this).children('option:selected').val();
			if(ziti==2){
				var freight="0.00";
				document.getElementById("freight").setAttribute("value",freight);
				$("#freight").html(freight+"元");
				all_price2=Math.round(all_price1*100-10*100)/100;
				document.getElementById("pay").innerHTML="结算："+all_price2;
				document.getElementById("total").innerHTML="￥"+all_price2;
			}else{
				var freight="0.00";
				document.getElementById("freight").setAttribute("value",freight);
				$("#freight").html(freight+"元");
				document.getElementById("pay").innerHTML="结算："+all_price1;
				document.getElementById("total").innerHTML="￥"+all_price1;
			}
		});

		
		window.onload=function(){
	  		onloadd();
	  	};
		function onloadd(){
			// 可使用积分
			ajaxPost("<%=basePath%>HomeController/findIntegralConverNum", "", "json", "json", showConverNum); //卡巴积分
			
	    };
	    function showStores(data){
	    	var object = data.object;
	    	var htmlStr="";
	    	var full_price=0.00;//满价
	    	var all_price=0.00;
	    	
	    	
	    	var required_integral=0;//所需积分
	    	for(var i=0;i<object.length;i++){
	    		var sale_price=toDecimal2(object[i].store_price*object[i].store_num);
	    		pri_prive=toDecimal2(object[i].store_price*object[i].store_num);
	    		original_price=toDecimal2(object[i].prime_price*object[i].store_num);
	    		
	    		if(object[i].store_type==2){
	    			full_price+=sale_price;
	    		}
	    		if(object[i].store_type==3){
	    			pri_prive=toDecimal2(object[i].prime_price*object[i].store_num);//积分商品累加到总价
	    			jifen_price=toDecimal2(object[i].prime_price*object[i].store_num);//积分商品原价
	    			required_integral+=object[i].required_integral*object[i].store_num;
	    			var conver_num=document.getElementById("jifen1").value;//用户可使用积分
					if(required_integral!=0){
						if(required_integral>conver_num){
							document.getElementById("jifen").value=conver_num;
							document.getElementById("required_integral").value=conver_num;//使用积分
						}else{
							document.getElementById("jifen").value=required_integral;
							document.getElementById("required_integral").value=required_integral;//使用积分
						}
					}
					var max=document.getElementById("required_integral1").value;
	    			document.getElementById("required_integral1").value=required_integral+max;//最大可用积分
	    			var useinte=document.getElementById("jifen").value;//使用的积分
	    			sale_price=toDecimal2(object[i].prime_price*object[i].store_num-useinte*0.1);
	    		}
	    		if(object[i].store_type==4){
	    			var end_date=object[i].end_date;
	    			var timestamp = Date.parse(new Date());
	    			if(timestamp>end_date&&end_date!=null){
	    				endtime=1;
	    			}
	    		}
	    		all_price=toDecimal2((all_price*100+sale_price*100)/100);//销售价
	    		all_price=toDecimal2((all_price*100+document.getElementById("freight").getAttribute("value")*100)/100);
	    		
	    		htmlStr+="<li class='mui-table-view-cell mui-media'>"+
			     "   <a href='javascript:;' class='settlements'>"+
			      "    <img class='mui-media-object mui-pull-left' src='file/store/img/"+ object[i].store_picture.split(";")[0] +"'>"+
			       "   <div class='mui-media-body'>"+
			       "         <input type='hidden' value="+object[i].store_id+"> "+
			        "      	 <div class='mui-media-body-wz'>"+object[i].store_name+"</div> "+
			         "       <div class='mui-ellipsis' style='float: left;line-height: 20px;width: 60%;'>"+
						"		<label style='color: #D02368;font-size: 11px;'>￥</label>"+
						"   	<input type='hidden' value="+pri_prive+"> "+
						"   	<input type='hidden' value="+object[i].required_integral+"> "+
						"		<span style='color: #D02368 !important;font-size: 15px;'>"+pri_prive+"</span>"+
						"		<del style='font-size: 12px;color: #999;'><label style='font-size: 12px;'>￥</label>"+original_price+"</del>"+
			             "   </div>"+
			       	   "  	 <div style='clear: both;'></div>"+
			           "     <div class='mui-pull-left'>"+
			            "       <input type='hidden' value="+object[i].store_type+"> "+
						 "      <div class='mui-numbox' data-numbox-min='1'> "+
							"	    <button class='mui-btn mui-btn-numbox-minus' type='button' onclick='reduceNum(this);'>-</button> "+
							"	    <input id='test' class='mui-input-numbox' type='number' value="+object[i].store_num+"> "+
							"	    <button class='mui-btn mui-btn-numbox-plus' type='button' onclick='addNum(this);'>+</button> "+
						   "    </div>"+
					  "	     </div>"+
			      "    </div>"+
			     "   </a>"+
			    "</li>";
	    	}
	    	document.getElementById("storeList").innerHTML=htmlStr;
	    	document.getElementById("sto_num").innerHTML="合计("+object.length+"):";
	    	document.getElementById("total").innerHTML="￥"+all_price;
	    	document.getElementById("pay").innerHTML="结算："+all_price;
	    	document.getElementById("all_price").value=all_price;
	    	document.getElementById("full_price").value=full_price;
	    	document.getElementById("required_integral").value=required_integral;
	    	show();
	    	all_price1=all_price;
	    }
	    function settlements(data){
	    	var arrChk=$(".mui-media-body"); 
                if(arrChk.length<=0){
                	//alert('请先勾选数据,在进行批量清档！');
               	}else{
               		var integrals=0;//最大所需积分
               		var prices=0.00;//订单总价
               		var fullprice=0.00;//满的价格
               		for(var i=0;i<arrChk.length;i++){
               			
               			var pri_prive=$(arrChk[i]).children("div").eq(1).children("input").eq(0).val();//积分商品（单件原价总价），其他为销售价
               			var snum=$(arrChk[i]).children("div").eq(3).children("div").children("input").val();//商品数量
               			$(arrChk[i]).children("div").eq(1).children("span").html(pri_prive*snum);
               			prices=prices+pri_prive*snum;
               				
               			
               			var stype=$(arrChk[i]).children("div").eq(3).children("input").val();//商品类型
               			if(stype==2){//满减的满价
               				fullprice=fullprice+pri_prive*snum;
               			}
               			if(stype==3){//商品类型为积分商品
               				var one_integral=$(arrChk[i]).children("div").eq(1).children("input").eq(1).val();//单件所需积分
               				integrals=integrals+one_integral*snum;
               				
               			}
               			
               		}
               		
               		var conver_num=document.getElementById("jifen1").value;//用户可用积分
               		debugger;
                	document.getElementById("required_integral1").value=integrals;//最大可用积分
                	document.getElementById("full_price").value=fullprice;//满减的满价
                	if(data==0){
                		if(integrals>conver_num){
							document.getElementById("jifen").value=conver_num;
						}else{
							document.getElementById("jifen").value=integrals;
						}
                	}else{
                		
                	}
                	var jifen=document.getElementById("jifen").value;
					prices=prices-toDecimal2(jifen*0.1);
					
	    			document.getElementById("all_price").value=prices;
	    			document.getElementById("total").innerHTML="￥"+prices;
	    			document.getElementById("pay").innerHTML="结算："+prices;
					
              	}
              	
	    }
	    //减少商品数量
	    function reduceNum(obj){
	    	var num=$(obj).parent().children("input").val();//数量
	    	if(num<=1){
	    		return;
	    	}
	    	num--;
	    	$(obj).parent().children("input").val(num);
	    	settlements(0);
	    }
	    //添加商品数量
	    function addNum(obj){
	    	var num=$(obj).parent().children("input").val();//数量
	    	num++;
	    	$(obj).parent().children("input").val(num);
	    	settlements(0);
	    }
	    //查询默认地址:
		var paramData1 = {};
		var object11 = JSON.stringify(paramData1);
		ajaxPost("<%=basePath%>order_weixin/findOrderAddrDef", object11, "json", "json", findOrderAddrDef);
		function findOrderAddrDef(data) {
			var reg = new RegExp(";", "g"); //g,表示全部替换。
			var orderAddr = data.orderAddrData.orderAddr;
			var str="";
			if(orderAddr!=null){
				var user_name=orderAddr.user_name;
				var tel_phone=orderAddr.tel_phone;
				var order_addr=orderAddr.order_addr.replace(reg, "");
				document.getElementById("user_name").innerHTML=user_name;
				document.getElementById("tel_phone").innerHTML=tel_phone;
				document.getElementById("order_addr").innerHTML=order_addr;
				
				
			}else{
				window.location="<%=basePath%>order_weixin/address";
			}
				
		}
		function showConverNum(conver_num){
			conver_num=conver_num.object.integral_basics;
			document.getElementById("jifen1").value=conver_num;
			var ids= "<%=idss%>";
			var vas= "<%=values%>";
			var ids1=[];
			var vas1=[];
			ids1=ids.split(";");
			vas1=vas.split(";");
			var jsonArray=[];
			for(var i=0;i<ids1.length;i++){
				var order_id=ids1[i];
				var num=vas1[i];
				var data={};
            	data={order_id:order_id,num:num};
           		jsonArray.push(data);
			}
			jsonArray=JSON.stringify(jsonArray);
	    	ajaxPost("<%=basePath%>wenxin_store/findStoress",jsonArray,"json","json",showStores);
		}
		function show(){
		
		
		
		//查询个人券:
		var paramData1 = {};
		//var manjian=document.getElementById("manjian").getAttribute("value");
		var object11 = JSON.stringify(paramData1);
		ajaxPost("<%=basePath%>weixin_voucher/findUserVoucher", object11, "json", "json", showUserVoucher);
		function showUserVoucher(data){
			var full_price=document.getElementById("full_price").value;
	    	var object = data.object;
	    	var full=10000;
	    	var index;
	    	for(var i=0;i<object.length;i++){
	    		//满减券
	    		if(object[i].voucher_type==2){
	    			if(full_price-object[i].full_money>0){
	    			    var p=full_price-object[i].full_money;
	    				if(full>p){
	    					full=p;
	    					index=i;
	    				}
	    			}
	    		}
	    		//现金券
	    		var typeStr="";
	    		if(object[i].voucher_type==6){
	    			typeStr+="<option value="+object[i].user_voucher_id+">"+object[i].reduce_money+"</option>";
	    		}
	    	}
	    	if(typeStr==""){
	    		document.getElementById("money_voucher").innerHTML="<option value=0>无可使用的现金券</option>";
	    	}else{
	    		document.getElementById("money_voucher").innerHTML=typeStr;
	    	}
	    	if(index==null){
	    		document.getElementById("manjian").innerHTML="无可用的满减券";
	    	}else{
	    		document.getElementById("manjian").setAttribute("value",object[index].user_voucher_id);
	    		document.getElementById("manjian").innerHTML="-￥"+object[index].give_money;
	    	};
	    	
	    	
		};
		}
		function settlement(one1){
		
			$(this).attr("disabled","disabled"); //只能点一次
			var jifen=document.getElementById("jifen").value;//使用的积分
			var manjian=document.getElementById("manjian").getAttribute("value");//满减券编号
			var freight_money=document.getElementById("freight").getAttribute("value");//运费
			var user_name=document.getElementById("user_name").innerHTML;//收货人姓名
			var tel_phone=document.getElementById("tel_phone").innerHTML;//收货人电话
			var order_addr=document.getElementById("order_addr").innerHTML;//收货人地址
			var money_voucher=$('#money_voucher option:selected') .val();//选中的现金券
			var maxjif=document.getElementById("required_integral1").value;//最大使用积分
			var conver_num=document.getElementById("jifen1").value;//用户可用积分
			if(jifen>maxjif){
				alert("输入积分过大，无法使用，请重新输入！");
				return;
			}
			if(jifen>conver_num){
				alert("积分不足，请重新输入！");
				return;
			}
			money_voucher=3;
			if(order_addr.substring(0,2)=="西藏"||order_addr.substring(0,2)=="青海"||order_addr.substring(0,2)=="内蒙"||order_addr.substring(0,2)=="香港"
				||order_addr.substring(0,2)=="澳门"||order_addr.substring(0,2)=="台湾"||order_addr.substring(0,2)=="新疆"){
				alert("部分地区无法邮寄，请联系管理员！");
					return;
			}
			/* var str="manjian="+manjian+"&freight_money="+freight_money+"&user_name="+user_name+"&order_addr="+order_addr+"&tel_phone="+tel_phone+"&money_voucher="+money_voucher+"&jifen="+jifen+"";
 */			
 			
 			var jsonArray=[];
			var object2={};
			var arrChk=$(".mui-media-body"); 
			var object1 = {
						jifen:jifen,
						manjian: manjian,
						freight_money: freight_money,
						user_name: user_name,
						order_addr: order_addr,
						tel_phone: tel_phone,
						money_voucher: money_voucher
					};
			jsonArray.push(object1);	
                if(arrChk.length<=0){
                	alert("未选择商品！");
                	return;
               	}else{
               		for(var i=0;i<arrChk.length;i++){
               			var sid=$(arrChk[i]).children("input").val();//商品编号
               			var num=$(arrChk[i]).children("div").eq(3).children("div").children("input").val();//商品数量
               			var object={store_id:sid,num:num};
               			jsonArray.push(object);
               			/* str+="&store_id="+sid+"&"+sid+"="+num+""; */
               		}
               		
               		
               	}
				
			
			jsonArray=JSON.stringify(jsonArray);
			if(order_addr==""||order_addr==null){
				alert("请先添加地址！");
				window.location.href="<%=basePath%>order_weixin/address";
			}	
			if(endtime==1){
				alert("包含活动期外的商品，请重新下单！");
				return;
			}
			ajaxPost("<%=basePath%>order_weixin/weixinAddOrder?", jsonArray, "json", "json", goPay);
		}
		function goPay(data) {
		//alert(JSON.stringify(data));
				if(data.state!=0){
					alert(data.message);
				}else{
					var orderBasics = data.object;
					var weixin_id = $.cookie('weixin_id');
					var price = $("#money").text();
					window.location.href = "<%=basePath%>payController/toPay?userId=" + orderBasics.user_basics_id + "&orderNo=" + orderBasics.order_id + "&money=" + price + "&openId=" + weixin_id + "&store_id=" + orderBasics.store_id;
				}
				
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
function useintegral(jifen){
	var maxjif=document.getElementById("required_integral1").value;//最大使用积分
	var conver_num=document.getElementById("jifen1").value;//用户可用积分
	if(jifen>maxjif){
		alert("输入积分过大，无法使用，请重新输入！");
	}
	if(jifen>conver_num){
		alert("积分不足，请重新输入！");
	}
	settlements();
}
		</script>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
		</script>
	</body>

</html>