<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${count==0}">
알림이 없습니다.
</c:if>
<c:if test="${count>0}">
${nickname}님이 회원님의 게시물에 댓글을 남겼습니다.
</c:if>
</body>
</html>