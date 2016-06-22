<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<style>
*{
color:#7A7A7A;
}
p{
padding:3px;
}
/* td{
width:100px; 
} */

#view_div{
	width:580px;
	height:640px;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin:auto;
	}

</style>

</head>
<body>
<div id="view_div">
<center>
<h3>회원관리</h3>
<hr/>

<form method="post" action="ManagerPageMemberPro.hash">
<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">
<br>
<table border="1">
<tr>
<td><b>email</b></td>
<td><b>nickname</b></td>
<td><b>신고횟수</b></td>
<td><b>회원삭제</b></td>
</tr>
<c:forEach var="member" items="${array}">
<tr>
<td>
${member.email}
</td>
<td>
${member.nickname}
</td>
<td>
${member.reportcount}
</td>
<td><input type="checkbox" name="delete" value="${member.email}"></td>
</tr>
</c:forEach>
</table>
<div align="center"><input type="submit" value="회원삭제"></div>
</form>


<br>
<!-- <button type="button" onclick="exportToExcel();">엑셀출력</button> -->
<a href="toExcel.hash"><img src='<c:url value="/image/logo/엑셀.PNG" ></c:url>' width='50' height="50"></a>
</div>
</body>
</html>