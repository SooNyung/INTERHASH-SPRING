<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인정보 : ${memId} <br>
<a href="UserInsertForm.do">회원가입</a><br>
<a href="LoginForm.do">로그인</a><br>
<a href="LogOut.do">로그아웃</a><br>
<c:if test="${memId!=null}">
	<a href="UserModifyForm.do">정보수정</a><br>
</c:if>
<c:if test="${memId==null }">
	<a href="FindPasswordForm.do">비밀번호 찾기</a><br>
</c:if>
<a href="pageRanks.do">목록 엑셀로 뽑기</a><br>
<a href="Board.do">게시판 보기</a>
</body>
</html>