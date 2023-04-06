function uitl_trim(str){//去除字符串的前后空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}