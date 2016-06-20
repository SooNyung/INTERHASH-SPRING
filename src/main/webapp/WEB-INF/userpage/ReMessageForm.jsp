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

</script>

</head>
<body>

<div align="center">
<form method="post" action="ReMessagePro.hash">

<hr>
<div>받는사람 : 
<input type="text" id="receEmail" name="receEmail" readonly="readonly" value="${sendNick}(${sender})">
</div>
<hr>
<input type="hidden" name="sender" value="${sender}">
<input type="hidden" name="sendNick" value="${sendNick}">

<div><textarea name="messagecontent" rows="10" cols="50">[답장]</textarea></div><br>


<div>
<input type="submit" value="보내기">
<input type="button" value="닫기" onclick="javascript:window.close()"/>
</div>

</form>
</div> 

</body>
</html>