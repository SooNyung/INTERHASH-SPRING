<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
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

#div1{ float:left; width:50%;}
#div2{ float:right; width:50%;}



</style>
</head>
<body>
<center>
<h3>통계</h3>
<hr/>
<div align="bottom"><input type="date" name="date" id="date"></div>
<p>

<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">

<p>

<div id ="div1">
<table border="1">
<tr height="30">
<td><b>HashTag</b></td>
<td><b>좋아요 수</b></td>
<td><b>게시글 수</b></td>
</tr>
<c:forEach var="hash" items="${content}">
<tr>
<td>
${hash.conhash}

</td>
<td>
${hash.hashlike}

</td>
<td>
${hash.hashcontent}

</td>

</tr>
</c:forEach>
</table>
</div>

<div id ="div2">
<table border="1">
<tr height="30">
<td><b>방문자 수</b></td>
<td><b>게시물 수</b></td>
<td><b>좋아요 수</b></td>
</tr>
</table>
</div>


</body>
</html>