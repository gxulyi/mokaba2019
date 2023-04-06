//得到已购买的用户，subordinate为下属集合，orderStatus为订单完成的状态值
function getBuySubordinate(subordinate, orderStatus) {
	var length = 0;
	var buySubordinate = new Array();
	subordinate.forEach(function(value, index, array) {
		if(value.order_status == orderStatus) {
			buySubordinate[length] = value;
			length++;
		}

	});
	return buySubordinate;
}

//得到未购买的用户，subordinate为下属集合，orderStatus为订单完成的状态值
function getBuySubordinateNo(subordinate, orderStatus) {
	var length = 0;
	var buySubordinateNo = new Array();
	subordinate.forEach(function(value, index, array) {
		if(value.order_status != orderStatus || value.order_status == null) {
			buySubordinateNo[length] = value;
			length++;
		}

	});
	return buySubordinateNo;
}