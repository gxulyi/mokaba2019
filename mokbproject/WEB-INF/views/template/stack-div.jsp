<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 String stackDivTemplate = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"html/stackdiv/";
 %>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl/uitl-string.js"></script>
<script type="text/javascript">
	function loadStackHtmlDefault() { //加载层叠div的默认内容
		loadStackHtmlDefaultTop(); //加载div的顶部默认内容
		loadStackHtmlDefaultBottom(); //加载div的底部默认内容
	}

	function loadStackHtmlDefaultTop() { //层叠div的顶部默认内容
		var stackHtmlTopDiv = document.getElementById("stackHtmlTopDiv");
		var button = document.createElement("span");
		button.innerHTML = '<img style="width:20px;height:20px;position: absolute;top:5px;right:5px; cursor: pointer;" src="images/guanbi.png" />';
		button.onclick = function() {
			hideStackHtml(); //隐藏层叠div
		};
		stackHtmlTopDiv.appendChild(button);

	}

	function loadStackHtmlDefaultBottom() { //层叠div的底部默认内容
	}

	function isLoadStackHtml(htmlText) { //判断层叠div是否已加载并且内容相同  true已经加载 false未加载
		if(document.getElementById(htmlText) == null) { //显示的内容不为上次加载的内容
			document.getElementById("stackHtmlTextDiv").innerHTML = ""; //清空已加载的内容
			return false;
		}
		if(uitl_trim(document.getElementById("stackHtmlTopDiv").innerHTML) != '') {
			return true;
		}
		if(uitl_trim(document.getElementById("stackHtmlTextDiv").innerHTML) != '') {
			return true;
		}
		if(uitl_trim(document.getElementById("stackHtmlBottomDiv").innerHTML) != '') {
			return true;
		}
		return false;
	}
	//加载层叠div内容 支持dom对象 html格式的字符串 与静态模板template （静态模板路径在html/stackdiv下这里传入的是模板名字必须以template开始 如template-1） loadAccomplishFunction 页面加载完成后执行的方法
	//loadStackHtmlWidth层叠div的宽  loadStackHtmlHeight层叠div的高 loadAccomplishFunction加载完成后的回调方法
	function loadStackHtml(htmlText, loadStackHtmlWidth, loadStackHtmlHeight, loadAccomplishFunction) { //加载层叠div内容
		if(loadStackHtmlWidth !== loadStackHtmlWidth || loadStackHtmlWidth == null || loadStackHtmlWidth == "") { //宽默认为300px;
			loadStackHtmlWidth = '300px';
		}
		if(loadStackHtmlHeight !== loadStackHtmlHeight || loadStackHtmlHeight == null || loadStackHtmlHeight == "") { //高默认为200px;
			loadStackHtmlHeight = '200px';
		}
		if(isLoadStackHtml(htmlText)) { //判断层叠div是否已加载
			showStackHtml(); //显示层叠div
			//loadAccomplishFunction();
			return;
		}
		var stackHtmlMainDiv = document.getElementById("stackHtmlMainDiv");
		stackHtmlMainDiv.style.width = loadStackHtmlWidth == 0 || '' ? '' : loadStackHtmlWidth;
		stackHtmlMainDiv.style.height = loadStackHtmlHeight == 0 || '' ? '' : loadStackHtmlHeight;
		var stackHtmlTextDiv = document.getElementById("stackHtmlTextDiv");
		if(typeof(htmlText) == 'string') { //层叠div内容是以字符串形式传入
			if(htmlText.indexOf("template") >= 0) { //使用模板内容
				var templateUrl = "<%=stackDivTemplate%>" + htmlText + ".html";
				getAjax(templateUrl, '', function(data) {
					var div = document.createElement("div"); //创建包含层叠div的容器
					div.innerHTML = data; //将返回的html内容加入容器
					var dataScript = div.getElementsByTagName('script'); //获取data里面包含的js标签
					for(var i = 0; i < dataScript.length; i++) {
						var script = document.createElement("script");
						script.innerHTML = uitl_trim(dataScript[i].innerHTML);
						script.type = "text/javascript";
						document.body.appendChild(script);
					}
					stackHtmlTextDiv.appendChild(div); //将容器内容加载进层叠div主体
					loadAccomplishFunction();
				});
			} else {
				stackHtmlTextDiv.innerHTML = htmlText;
			}
		} else { //层叠div内容以doc对象形式传入 
			stackHtmlTextDiv.appendChild(htmlText);
		}
		loadStackHtmlDefault(); //加载层叠div的默认内容
		showStackHtml(); //显示层叠div
	}

	function emptystackHtmlTextDiv() { //清楚层叠div加载的内容
		document.getElementById("stackHtmlTopDiv").innerHTML = "";
		document.getElementById("stackHtmlTextDiv").innerHTML = "";
		document.getElementById("stackHtmlBottomDiv").innerHTML = "";
	}

	function showStackHtml() { //显示层叠div
		document.getElementById("stackHtml").style.display = "block"; //div隐藏和显示之间切换
		document.body.style.overflow = "hidden"; //body能否滚动之间切换hidden为不可滚动
		try {
			document.getElementById("mainAdminDiv").style.opacity = 0.3; //div透明与不透明之间切换
		} catch(err) {
			//catchCode - 捕获错误的代码块
		} finally {}
	}

	function hideStackHtml() { //隐藏层叠div
		document.getElementById("stackHtml").style.display = "none"; //div隐藏和显示之间切换
		document.body.style.overflow = ""; //body能否滚动之间切换hidden为不可滚动
		try {
			document.getElementById("mainAdminDiv").style.opacity = ''; //div透明与不透明之间切换
		} catch(err) {
			//catchCode - 捕获错误的代码块
		} finally {}
	}
</script>

<div id="stackHtml" style="width: 100%;height: 100%; z-index:99999; position:fixed;display:none;">
	<div id="stackHtmlMainDiv" style="background-color: #f5f5f5;   z-index:99999;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%); border:1px solid #55cbd2;border-radius:5px;">
		<div id="stackHtmlTopDiv" style="position: relative;">

		</div>
		<div id="stackHtmlTextDiv">
		</div>
		<div id="stackHtmlBottomDiv">
		</div>
	</div>
</div>