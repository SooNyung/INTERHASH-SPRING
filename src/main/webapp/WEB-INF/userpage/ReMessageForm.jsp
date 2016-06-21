<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
function checkIt() {
		alert("전송되었습니다.");
		
}

</script>

</head>
<body>

<div align="center">
<form method="post" action="ReMessagePro.hash" onsubmit="checkIt()">
<div>받는사람 : 
<input type="text" id="receEmail" name="receEmail" readonly="readonly" value="${sendNick}(${sender})">
</div>
<hr>
<input type="hidden" name="sender" value="${sender}">
<input type="hidden" name="sendNick" value="${sendNick}">

<div><textarea name="messagecontent" rows="10" cols="50">[답장]</textarea></div><br>

<div>
<input type="submit" value="보내기">
<input type="button" value="닫기" onclick="javascript:history.go(-1)"/>
</div>
</form>
</div> 

</body>
</html>