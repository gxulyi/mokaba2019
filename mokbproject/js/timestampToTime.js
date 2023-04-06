/**
 * @description 时间戳转化为时间
 * @param {Object} timestamp
 */
var timestampToTime = function (timestamp){
	var timestampObj = new Date(timestamp);
	var year = timestampObj.getFullYear();
	var month = timestampObj.getMonth()+1;
	var day = timestampObj.getDate(); 
	var hour = timestampObj.getHours(); 
	var minute = timestampObj.getMinutes(); 
	var second = timestampObj.getSeconds();
	// 补0操作
	month < 10 ? month = '0' + month : month;
	day < 10 ? day = '0' + day : day;
	return year + "-" + month + "-" + day;
};