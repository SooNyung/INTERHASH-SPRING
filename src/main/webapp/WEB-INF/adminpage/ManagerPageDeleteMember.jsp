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

.white {
   color: #000 !important;
   background-color: #fff !important;
}

.box-shadow {
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19) !important;
   margin-top: 0px;
}

.border-round {
   border-radius: 7px !important
}

#view_div{
	width:120%;
	height:90%;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin-top:10px;
	}

#text{text-align:center;}
</style>
</head>
<body>
<div id="view_div" class="box-shadow border-round white">
<center>
<h3>Å»ÅðÈ¸¿ø°ü¸®</h3>
<hr/>
<input type="button" value="°ü¸®ÀÚÆäÀÌÁö" onclick="javascript:window.location='ManagerPage.hash'">
<table id="text">
<tr bgcolor="#ffcccc">
<td><b>email</b></td>
<td><b>Å»Åð³¯Â¥</b></td>
<td><b>Å»Åð»çÀ¯</b></td>
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
<a href="toExcelWithdrawl.hash"><img src='<c:url value="/image/logo/¿¢¼¿.PNG" ></c:url>' width='50' height="50"></a>
</div>
</body>
</html>