<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>������</title>
<script>
window.onload=function() {
document.getElementById('date').valueAsDate = new Date();
}
</script>
<style>
*{
color:#7A7A7A;
}
td{
width:100px; 
text-align:center;
}

#div1{ float:right; width:33%;}
#div2{ float:right; width:33%;}
</style>
</head>
<body>
<center>
<h3>���</h3>
<hr/>
<p>

<div id ="div1">
<table border="1">
<tr>
<td><b>HashTag</b></td>
<td><b>���ƿ� ��</b></td>
<td><b>�Խñ� ��</b></td>
</tr>
<c:forEach var="hash" items="${content}">
<tr>
<td>
${hash.hashName}
</td>
<td>
${hash.hashLikeCount}
</td>
<td>
${hash.hashContentCount}
</td>

</tr>
</c:forEach>
</table>
</div>

<div id ="div2">
<table border="1">
<tr height="30">
<td><b>�湮�� ��</b></td>
<td><b>�Խù� ��</b></td>
<td><b>���ƿ� ��</b></td>
</tr>
</table>
</div>


<hr/>
<div align="bottom"><input type="date" name="date" id="date"></div>
<p>

<input type="button" value="������������" onclick="javascript:window.location='ManagerPage.hash'">

</body>
</html>