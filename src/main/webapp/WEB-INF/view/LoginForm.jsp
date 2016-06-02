<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="LoginPro.do" method="post" name="logininfo">
	이메일<input type="text" name="email"><br>
	비밀번호<input type="password" name="password"><br>
	<input type="submit" value="로그인"><br>
</form>
</body>
</html>