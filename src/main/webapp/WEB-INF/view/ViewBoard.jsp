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

번호 : ${content.num }<br>
작성자:${content.email }<br>
제목: ${content.subject }<br>
내용 : ${content.content }<br>

</body>
</html>