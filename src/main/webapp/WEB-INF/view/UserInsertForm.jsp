<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript">
	function checkpassword(){
		if(document.userinfo.password.value == document.userinfo.password1.value){
			document.getElementById("check_area").value="비밀번호가 일치합니다.";
		}else{
			document.getElementById("check_area").value="비밀번호가 불일치합니다.";
		}
	}
	function checkpassword1(){
		if(document.getElementById("check_area").value == "비밀번호가 일치합니다."){
			return true;
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
	function searchZipcode(){
	    window.open("Zipcode.do?area4=", "주소찾기", "width=500, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=no" ); 
	}
	$(document).ready(function(){
		$('#div_ex').css('background-color','#d0e4fe');
		$('#ptag').text('asdasdfsadf');
	});
	
	
	
</script>
<style>
	#div_ex{
		width:100px;
		height:100px;
	}
</style>
</head>
<body>
<div id="div_ex"><p id="ptag"></p></div> 
<form action="UserInsertPro.do" method="post" name="userinfo" onsubmit="return checkpassword1()">
	이메일<input type="text" name="email" required="required"><br>
	비밀번호<input type="password" name="password" onkeyup="checkpassword()" required="required"><br>
	비밀번호확인<input type="password" name="password1" onkeyup="checkpassword()" required="required"><input type="text" id="check_area" value="" readonly="readonly"></input><br>
	나이<input type="text" name="age" required="required"><br>
	핸드폰번호<input type="text" name="phonenumber" required="required"><br>
	주소<input type="text" name="zipcode" required="required"> 
	<input type="text" name="address" required="required">
	<input value="주소찾기" type="button" onclick=searchZipcode()><br>
	<input type="submit" value="회원가입"><input onclick= "location.href ='index.do'" type="button" value="취소"><br>
</form>
</body>
</html>