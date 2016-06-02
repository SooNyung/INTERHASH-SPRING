<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: solid 1px;
	}
	td,tr {
		border: solid 1px;
	}

</style>
<script>
	function sessionCheck() {
		if ("${sessionScope.memId}" == "") {
			alert("로그인 하셔야 글을 작성 할 수 있습니다.");
			return false;
		}else{
			location.href=("InsertBoard.do");
		}
	}
	function view_Board(num){
		location.href=("ViewBoard.do?num=" + num);
	}
</script>
</head>
<body>
게시판입니다.<br>
<table>
	<c:forEach var="obj" items="${list }">
	<tr style="border: solid 1px">
		<td>${obj.num }</td><td><a href="javascript:view_Board(${obj.num })"> ${obj.subject} </a></td>
	</tr>
	</c:forEach>
</table>
	<input type="button" onclick=sessionCheck() value="게시물작성" />
</body>
</html>