<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
input[name=hiddenCheck]{
	color:red;
}
</style>
<script>
var check = false;
var check2 = false;
function checkIt() {
	if(check){
		alert("전송되었습니다.");
		return true;
	}
	if(!check) {
		alert("이메일을 확인 해주세요.");
		return false;
	}
	if(!checzk2) {
		alert("올바른 이메일을 입력해주세요.")
		return false;
	}
}
function email(){
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  
	var emailList = "${emailList}";
	var email = document.getElementById("receEmail").value;
	
	if(regex.test(email) === false) {  
	    alert("잘못된 이메일 형식입니다.");  
	    check = true;
	    return false;
	}
	if(emailList.indexOf(email)>0){
		alert("해당 이메일을 사용하실 수 있습니다.")
		check = true;
		check2 = true;
	}
	else if(emailList.indexOf(email)==0){
		alert("이메일을 입력해주세요.")
		check = true;
	}
	else{
		alert("해당 이메일은 없는 이메일입니다.");
		check = true;
	}
	
}
</script>

</head>
<body>	

<div align="center">
<div><a href="MessageList.hash">쪽지함  </a> / <a href="#"> 쪽지보내기</a>

</div>
<hr>
<form method="post" action="MessagePro.hash" onsubmit="return checkIt()">
<hr>
<div>받는사람 : 
<input type="email" id="receEmail" name="receEmail">
<input type="button" onclick="email()" value="이메일검사">
</div>
<hr>

<div><textarea name="messagecontent" rows="10" cols="50"></textarea></div><br>

<div>
<input type="submit" value="보내기">
<input type="button" value="닫기" onclick="javascript:window.close()"/>
</div>

</form>
</div>

</body>
</html>