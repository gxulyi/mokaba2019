function handleFileSelectUitl(evt) {
	var files = evt.target.files; // FileList object
	for ( var i = 0, f; f = files[i]; i++) {
		var reader = new FileReader();
		reader.onload = (function(theFile) {
			return function(e) {
				var span = document.createElement('span');
				span.innerHTML = e.target.result;
				document.getElementById('list').insertBefore(span, null);
			};
		})(f);
		reader.readAsText(f);
	}
}
function isIE() {// 判断浏览器是否为ie
	if (window.navigator.userAgent.indexOf("MSIE") >= 1)
		return true;
	else
		return false;
}
// js暂停函数
function Pause(obj, iMinSecond) {
	if (window.eventList == null)
		window.eventList = new Array();
	var ind = -1;
	for ( var i = 0; i < window.eventList.length; i++) {
		if (window.eventList[i] == null) {
			window.eventList[i] = obj;
			ind = i;
			break;
		}
	}
	if (ind == -1) {
		ind = window.eventList.length;
		window.eventList[ind] = obj;
	}
	setTimeout("GoOn(" + ind + ")", iMinSecond);
}
// js继续函数
function GoOn(ind) {
	var obj = window.eventList[ind];
	window.eventList[ind] = null;
	if (obj.NextStep)
		obj.NextStep();
	else
		obj();
}
function formatDateTimeStr(DataTime, cod) {// 将13位数时间戳转换为字符串，cod为1显示时分秒
	var date = new Date(DataTime);// 创建时间对象，DataTime为13位时间戳
	var y = date.getFullYear();// 获取年份
	var m = date.getMonth() + 1;// 获取月份
	m = m < 10 ? ('0' + m) : m;// 月份不足10在前面加0
	var d = date.getDate();// 获取天数日期
	d = d < 10 ? ('0' + d) : d;// 天数不足10在前面加0
	switch (parseInt(cod)) {
    case 1:// 显示时分秒
		var h = date.getHours();
		h = h < 10 ? ('0' + h) : h;
		var minute = date.getMinutes();
		var second = date.getSeconds();
		minute = minute < 10 ? ('0' + minute) : minute;
		second = second < 10 ? ('0' + second) : second;
		return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;

		break;
	case 2:
		return y + '-' + m + '-' + d;
	default:
		return y + '-' + m + '-' + d;
		break;
	}

};

function util_formatStrDateTime(DataStr){
	//将yyyy-MM-dd HH:mm:ss时间格式字符串转换为13位时间戳
	var date = (new Date(Date.parse(DataStr))).getTime();
	return date;
	
}


// checkChief点击触发的复选框id,checkName设置选中状态的的复选框name
function util_checkAll(checkChief,checkName){// 点击复选框趣全选按钮（全选与全不选）
      var checks=document.getElementsByName(checkName);
	  if(document.getElementById(checkChief).checked){// 将所有复选框选中
	   for(index in checks){
		   checks[index].checked=true;
	    }
	  }else{
	     for(index in checks){
	    	 checks[index].checked=false;
	    }
	  }
	  }
function util_getUrlInParam (){// 获取请求url中所带的参数。将请求参数转换为对象返回
	  var url=location.search;
	  var request = new Object();
	  if(url.indexOf("?")!=-1){
	  var str = url.substr(1); 
	  var strs = str.split("&");
	  for(var i=0;i<strs.length;i++){
	    request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	  };
	  };
	  return request;
 }
function util_isNotNull(object){// 判断变量是否不为空
	var str=object.toString;
	if(object!=null&&object!=''&&object!='0'){
		return true;
		}else{
			return false;
		}
	}

function uitl_domStringTransform(domOrString){//dom对象与字符串相互转换
	if(typeof(domOrString)=='string'){
		  var objE = document.createElement("div");

		  objE.innerHTML = domOrString;

		  return objE.childNodes;
	}else{
		var domParent=document.createElement('div');
		domParent.appendChild(dom);
		return domParent.innerHTML;
	}
	
}
function uilt_getDomIndexToChild(elt){//判断子类元素在父类元素中的下标
	var index = [].indexOf.call(elt.parentNode.querySelectorAll(elt.tagName),elt);
	return index;
	};
	/**
	 * 
	 * @param str 字符串
	 * @param cha 查找的字符
	 * @param num 第几次出现
	 * @returns
	 */
function findStrIndesOf(str,cha,num){//查询字符在字符串中出现的位置索引
	var x=str.indexOf(cha);
	for(var i=0;i<num;i++){
		 x=str.indexOf(cha,x+1);
	}
	return x;
}
function getBasePath(){//获取basePath
	var url = window.location.href;
	var num=findStrIndesOf(url,'/',3);
	var basePath=url.substring(0,num+1);
}
function util_sleep(numberMillis) {//暂停函数
	   var now = new Date();//获取当前时间
	   var exitTime = now.getTime() + numberMillis;//得到暂停后运行的时间值
	   while (true) {
	      now = new Date();
	      if (now.getTime() > exitTime)//当前时间大于需要运行的时间
	        return;//终止运行方法
	      }
	   };		  
