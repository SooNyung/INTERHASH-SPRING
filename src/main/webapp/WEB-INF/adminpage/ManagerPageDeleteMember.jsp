<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
p{
padding:3px;
}

*{
color:#7A7A7A;
}

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
<div class="view_div">
<center>
<h3>Ż��ȸ������</h3>
<hr/>
<input type="button" value="������������" onclick="javascript:window.location='ManagerPage.hash'">
<table border="1">
<tr>
<td><b>email</b></td>
<td><b>Ż��¥</b></td>
<td><b>Ż�����</b></td>
</tr>
<c:forEach var="member" items="${array}">
<tr>
<td>
${member.drawalemail}
</td>
<td width="150">
${member.drawaldate}
</td>
<td width="230">
${member.drawalcause}
</td>
</tr>
</c:forEach>
</table>

<br>
<a href="toExcelWithdrawl.hash"><img src='<c:url value="/image/logo/����.PNG" ></c:url>' width='50' height="50"></a>
</div>
</body>
</html>