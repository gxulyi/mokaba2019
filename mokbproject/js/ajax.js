document.write("<script language=javascript src='js/medicinefood/uitl/uitl-string.js'></script>");
function getAjax(url,resultType,functionName) {

		url = url ;

		//1.创建Ajax对象
		//js中,使用一个没有定义的变量会报错,使用一个没有定义的属性,是undefined
		//IE6下使用没有定义的XMLHttpRequest会报错,所以当做window的一个属性使用
		if (window.XMLHttpRequest) {
			//非IE6
			var ajax = new XMLHttpRequest();
		} else {
			//IE6
			var ajax = new ActiveXObject("Microsoft.XMLHTTP");
		}
		//2.连接到服务器
		ajax.open('GET', url, true);
		//3.发送请求
		ajax.send();
		//4.接收返回值
		ajax.onreadystatechange = function() {
			//0 － （未初始化）还没有调用send()方法  || (未初始化) 对象已建立，但是尚未初始化（尚未调用open方法） 
			//1 － （载入）已调用send()方法，正在发送请求  || (初始化) 对象已建立，尚未调用send方法 
			//2 － （载入完成）send()方法执行完成，已经接收到全部响应内容  || (发送数据) send方法已调用，但是当前的状态及http头未知 
			//　3 － （交互）正在解析响应内容  || (数据传送中) 已接收部分数据，因为响应及http头不全，
			//这时通过responseBody和responseText获取部分数据会出现错误， 
			//　4 － （完成）响应内容解析完成，可以在客户端调用了 || (完成) 数据接收完毕,此时可以通过通过
			//responseBody和responseText获取完整的回应数据 
			//oAjax.readyState--浏览器和服务器之间进行到哪一步了
			if (ajax.readyState == 4) { //读取完成

				if (ajax.status == 200) { //读取的结果是成功
                    var data=null;
                    if(resultType=="json"){
                    	data = JSON.parse(ajax.responseText);
                    }else{
                    	data=ajax.responseText;
                    }
                    
                    functionName(data);
				   

				} else {
					
				};
			};
		};
	}
function getAjaxSynchro(url,resultType,functionName) {

	url = url ;

	//1.创建Ajax对象
	//js中,使用一个没有定义的变量会报错,使用一个没有定义的属性,是undefined
	//IE6下使用没有定义的XMLHttpRequest会报错,所以当做window的一个属性使用
	if (window.XMLHttpRequest) {
		//非IE6
		var ajax = new XMLHttpRequest();
	} else {
		//IE6
		var ajax = new ActiveXObject("Microsoft.XMLHTTP");
	}
	//2.连接到服务器
	ajax.open('GET', url, false);
	//3.发送请求
	ajax.send();
	//4.接收返回值
	ajax.onreadystatechange = function() {
		//0 － （未初始化）还没有调用send()方法  || (未初始化) 对象已建立，但是尚未初始化（尚未调用open方法） 
		//1 － （载入）已调用send()方法，正在发送请求  || (初始化) 对象已建立，尚未调用send方法 
		//2 － （载入完成）send()方法执行完成，已经接收到全部响应内容  || (发送数据) send方法已调用，但是当前的状态及http头未知 
		//　3 － （交互）正在解析响应内容  || (数据传送中) 已接收部分数据，因为响应及http头不全，
		//这时通过responseBody和responseText获取部分数据会出现错误， 
		//　4 － （完成）响应内容解析完成，可以在客户端调用了 || (完成) 数据接收完毕,此时可以通过通过
		//responseBody和responseText获取完整的回应数据 
		//oAjax.readyState--浏览器和服务器之间进行到哪一步了
		if (ajax.readyState == 4) { //读取完成

			if (ajax.status == 200) { //读取的结果是成功
                var data=null;
                if(resultType=="json"){
                	data = JSON.parse(ajax.responseText);
                }else{
                	data=ajax.responseText;
                }
                
                functionName(data);
			   

			} else {
				
			};
		};
	};
}
function ajaxPost(url,paramData,paramType,resultType,functionname) {
	var resultdata;
	//1.创建Ajax对象
	if (window.XMLHttpRequest) {
		//非IE6
		var xhr = new XMLHttpRequest();
	} else {
		//IE6
		var xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	//2.连接到服务器
	xhr.open('post',url, true);
	//设置头信息
	if(paramType='json'){
		paramType="application/json";
	}else{
		paramType="application/x-www-form-urlencoded";
	}
	xhr.setRequestHeader("Content-Type",paramType);
	//3.发送请求，传递数据
	if(paramData==null||paramData==""||paramData==undefined){
		xhr.send();
	}else{
		xhr.send(paramData);
	}
	
	xhr.onreadystatechange = function() {
		
		if (xhr.readyState == 4) {
			
			if (xhr.status ==200) {//返回正确
				if(xhr.getResponseHeader("DENIED")!=null){//拒绝访问
					alert(uitl_trim(xhr.getResponseHeader("DENIED")));
					return;
				};
				if(resultType=="json"){
				   resultdata = eval('(' + xhr.responseText + ')');
				   functionname(resultdata);
                 }else{
                	 resultdata=xhr.responseText;
                 }
				// alert(resultdata.carData);
			} else {//返回错误
			//	alert('登录超时,请重新登录!');
			//alert("error");
             //alert( xhr.responseText );
			}
		}
	};
	
}
function ajaxpost(url,paramData,paramType,resultType,functionname,functionparam) {
	var resultdata;
	//1.创建Ajax对象
	if (window.XMLHttpRequest) {
		//非IE6
		var xhr = new XMLHttpRequest();
	} else {
		//IE6
		var xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	//2.连接到服务器
	xhr.open("POST", url, true);
	//设置头信息
	if(paramType='json'){
		paramType="application/json";
	}else{
		paramType="application/x-www-form-urlencoded";
	}
	xhr.setRequestHeader("Content-Type","application/json; charset=utf-8");
	//3.发送请求，传递数据
	if(paramData==null||paramData==""||paramData==undefined){
		//alert(paramData);
		xhr.send();
	}else{
		//alert(paramData);
		xhr.send(paramData);
	}
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			
			if (xhr.status ==200) {//返回正确
				 if(resultType=="json"){
				   resultdata = eval('(' + xhr.responseText + ')');
				   functionname(resultdata,functionparam);
                 }else{
                	 resultdata=xhr.responseText;
                 }
				// alert(resultdata.carData);
				return resultdata;
                 
			} else {//返回错误

			}
		}
	};
}