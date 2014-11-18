
String.prototype.replaceAll = function (s1, s2) {
	return this.replace(new RegExp(s1, "\uff0c"), s2);
};
/**
*校验字符串是否为小数
*返回值：
*如果为空，定义校验通过，		返回true
*如果字串为为小数，校验通过，	返回true
*如果校验不通过，				返回false     参考提示信息：输入域必须为小数！
*/
function checkIsDouble(s) {
	if (s == "") {
		return true;
	}
	var seenDecimalPoint = false;
	if (s == ".") {
		return false;
	}
	var i;
	for (i = 0; i < s.length; i++) {
		var c = s.charAt(i);
		if ((c == ".") && !seenDecimalPoint) {
			seenDecimalPoint = true;
		} else {
			if (!((c >= "0") && (c <= "9"))) {
				return false;
			}
		}
	}
	return true;
}
/**
*校验字符串是否为整型
*返回值：
*如果为空，定义校验通过，      返回true
*如果字串全部为数字，校验通过，返回true
*如果校验不通过，              返回false     参考提示信息：输入域必须为数字！
*/
function checkIsInteger(str) {
    //如果为空，则通过校验
	if (str == "") {
		return true;
	}
	var exp = /^\s*[-\+]?\d+\s*$/;
	if (str.match(exp) == null) {
		return false;
	} else {
		return true;
	}
}
/**
*校验字符串是否为IP地址型
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function n(x) {
	return ((!isNaN(x)) && x <= 255 && x >= 0);
}
function checkIsIp(str) {
	if (str == "") {
		return true;
	}
	var ip = str.split(".");
	if (ip[3] == "*" || ip[3] == "?") {
		ip[3] = 1;
		myform.q.value = ip[0] + "." + ip[1] + "." + ip[2] + "." + ip[3];
	}
	if (!((ip.length == 4) ? (n(ip[0]) && n(ip[1]) && n(ip[2]) && n(ip[3])) : false)) {
		return false;
	}
	return true;
}
/**
*校验字符串是否为手机号码
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkMobileNumber(str) {
	if (str == "") {
		return true;
	}
	var arrayStr = new Array();
	if (str.indexOf(",") > 0) {
		str = str.replace(/\,/g, "\uff0c");
		arrayStr = str.split("\uff0c");
	} else {
		arrayStr = str.split("\uff0c");
	}
	if (arrayStr.length > 0) {
		for (i = 0; i < arrayStr.length; i++) {
			var exp = /^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
			if (arrayStr[i].match(exp) == null) {
				return false;
			}
		}
	} else {
		var exp = /^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if (str.match(exp) == null) {
			return false;
		}
	}
	return true;
}
/**
*校验字符串是否为电话号码
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkPhoneNumber(phone) {
	if (phone == "") {
		return true;
	}
	var arrayStr2 = new Array();
	if (phone.indexOf(",") > 0) {
		phone = phone.replace(/\,/g, "\uff0c");
		arrayStr2 = phone.split("\uff0c");
	} else {
		arrayStr2 = phone.split("\uff0c");
	}
	if (arrayStr2.length > 0) {
		for (j = 0; j < arrayStr2.length; j++) {
			var regPhone = /(^[0,8][0-9]{2,4}\-[1-9][0-9]{6,7}$)|(^[1-9][0-9]{6,7}$)/;
			if (!regPhone.test(arrayStr2[j])) {
				return false;
			}
		}
	} else {
		var regPhone = /(^[0,8][0-9]{2,4}\-[1-9][0-9]{6,7}$)|(^[1-9][0-9]{6,7}$)/;
		if (!regPhone.test(phone)) {
			return false;
		}
	}
	return true;
}
/**
*校验字符串是否为红机号码
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkRedPhone(phone) {
	if (phone == "") {
		return true;
	}
	var arrayStr2 = new Array();
	if (phone.indexOf(",") > 0) {
		phone = phone.replace(/\,/g, "\uff0c");
		arrayStr2 = phone.split("\uff0c");
	} else {
		arrayStr2 = phone.split("\uff0c");
	}
	if (arrayStr2.length > 0) {
		for (j = 0; j < arrayStr2.length; j++) {
			var regPhone = /(^[0,8][0-9]{2,4}\-[1-9][0-9]{3}$)|(^[1-9][0-9]{3}$)/;
			if (!regPhone.test(arrayStr2[j])) {
				return false;
			}
		}
	} else {
		var regPhone = /(^[0,8][0-9]{2,4}\-[1-9][0-9]{3}$)|(^[1-9][0-9]{3}$)/;
		if (!regPhone.test(phone)) {
			return false;
		}
	}
	return true;
}
/**
*校验字符串是否为邮编
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkZipCode(code) {
	if (code == "") {
		return true;
	}
	var regZipCode = /^[1-9]\d{5}$/;
	return regZipCode.test(code);
}
/**
*校验字符串是否为电子邮件
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkEmail(str) {
	if (str == "") {
		return true;
	}
	var arrayStr3 = new Array();
	if (str.indexOf(",") > 0) {
		str = str.replace(/\,/g, "\uff0c");
		arrayStr3 = str.split("\uff0c");
	} else {
		arrayStr3 = str.split("\uff0c");
	}
	if (arrayStr3.length > 0) {
		for (k = 0; k < arrayStr3.length; k++) {
			var regEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if (!regEmail.test(arrayStr3[k])) {
				return false;
			}
		}
	} else {
		var regEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if (!regEmail.test(str)) {
			return false;
		}
	}
	return true;
}
/**
*校验字符串是否为身份证号
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkCardNo(str) {
	if (str == "") {
		return true;
	}
	var exp = /(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)/;
	if (str.match(exp) == null) {
		return false;
	}
	return true;
}
/*
*校验字符串是否包含非法字符
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkChar(str) {
	if (str == "") {
		return true;
	}
	for (var loop_index = 0; loop_index < str.length; loop_index++) {
		if (str.charAt(loop_index) == "/" || str.charAt(loop_index) == "!" || str.charAt(loop_index) == "$" || str.charAt(loop_index) == "^" || str.charAt(loop_index) == "&" || str.charAt(loop_index) == "+" || str.charAt(loop_index) == "{" || str.charAt(loop_index) == "}" || str.charAt(loop_index) == "|" || str.charAt(loop_index) == "<" || str.charAt(loop_index) == ">" || str.charAt(loop_index) == "?" || str.charAt(loop_index) == "`" || str.charAt(loop_index) == "=" || str.charAt(loop_index) == "[" || str.charAt(loop_index) == "]" || str.charAt(loop_index) == "\\" || str.charAt(loop_index) == ";" || str.charAt(loop_index) == "," || str.charAt(loop_index) == "'") {
			return false;
		}
	}
	return true;
}
/*
*校验位次输入
*返回值：
*如果为空，定义校验通过，      返回true
*如果校验通过，                返回true
*如果校验不通过，              返回false
*/
function checkLocation(str) {
	var exp = /(^[1-9]\d{0,2}[.]\d{0,2}[0-9]$)|(^[1-9]\d{0,2}$)/;
	if (str.match(exp) == null) {
		return false;
	}
	return true;
}
/**
*校验字符串是否为日期型
*返回值：
*如果为空，定义校验通过，           返回true
*如果字串为日期型，校验通过，       返回true
*如果日期不合法，                   返回false    参考提示信息：输入域的时间不合法！（yyyy-MM-dd）
*/
function checkIsDate(str) {
    //如果为空，则通过校验
	if (str == "") {
		return true;
	}
	var myRegex = new RegExp("^[0-9]{4}-([1-9]|[0][1-9]|[1][0-2])-([1-9]|[0-2][0-9]|[3][0-1])$");
	if (str.match(myRegex)) {
		var theDay = Math.round(str.substr(8, 2));
		var theMonth = Math.round(str.substr(5, 2));
		var theYear = Math.round(str.substr(0, 4));
		if ((theYear % 4 == 0) && (theDay > 29) && (theMonth == 2)) {
			return false;
		} else {
			if ((theYear % 4 != 0) && (theDay > 28) && (theMonth == 2)) {
				return false;
			} else {
				if ((theDay > 30) && (theMonth == 4 || theMonth == 6 || theMonth == 0 || theMonth == 11)) {
					return false;
				} else {
					return true;
				}
			}
		}
	} else {
		return false;
	}
}
/*
校验字符串是否为日期+时间型
*/
function checkIsDateTime(inputValue) {
	if (inputValue == "") {
		return true;
	}
	var reg = /^(\d{1,4})(-|\/|\.)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
	var r = inputValue.match(reg);
	if (r == null) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[4], r[5], r[6], r[7]);
	if (r[1] != d.getFullYear() || r[3] != d.getMonth() + 1 || r[4] != d.getDate() || r[5] != d.getHours() || r[6] != d.getMinutes() || r[7] != d.getSeconds()) {
		return false;
	}
	return true;
}

//展开
function showArea(areaid, pic1, pic2) {
	document.getElementById(areaid).style.display = "";
	document.getElementById(pic1).style.display = "";
	document.getElementById(pic2).style.display = "none";
}

//关闭
function closeArea(areaid, pic1, pic2) {
	document.getElementById(areaid).style.display = "none";
	document.getElementById(pic2).style.display = "";
	document.getElementById(pic1).style.display = "none";
}
function replaceAll(s1, s2, key) {
	String.prototype.replaceAll = function (s1, s2) {
		return this.replace(new RegExp(s1, key), s2);
	};
}

//打开单位树菜单
	function openDeptTree(url){
		window.open(url,'','width=300,height=500,toolbar=no, menubar=no, scrollbars=yes, resizable=yes, location=no, status=yes');

	}
	
	


	