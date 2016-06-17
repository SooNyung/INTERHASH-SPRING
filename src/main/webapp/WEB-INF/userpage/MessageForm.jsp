<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>

<body>	

<h3>메시지 보내기 Form</h3>
<form method="post" action="MessagePro.hash">
<div>받는사람 : <input type="text" name="receEmail"></div><br>
<div>제목  : <textarea name="messagecontent" rows="3" cols="50"></textarea></div><br>

<div>
<input type="submit" value="보내기">
<input type="button" value="닫기" onclick="javascript:window.close()"/>

</div>

</form>

</div>

</body>
</html>