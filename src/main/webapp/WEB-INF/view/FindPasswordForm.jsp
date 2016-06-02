<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>

<c:if test="${password==null }">
<form action="FindPasswordPro.do" method="post" name="userinfo">
이메일<input type="text" name="email" required="required"><input type="submit" value="비밀번호찾기"><br>
</form>
</c:if>
<c:if test="${password!=null }">
비밀번호 : ${password}
</c:if>
</body>
</html>