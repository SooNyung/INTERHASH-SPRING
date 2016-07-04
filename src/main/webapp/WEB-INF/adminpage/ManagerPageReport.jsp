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

#view_div{
	width:120%;
	height:90%;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin:2%;
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
</style>
</style>
</head>
<body>
<div id ="view_div" class="box-shadow border-round white">
<center>
<h3>신고 게시물</h3>
<hr/>
<form method="post" action="ManagerPageMemberPro.hash">
<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">
<table>
<tr>
<td><b>email</b></td>
<td><b>nickname</b></td>
<td><b>신고횟수</b></td>
<td><b>회원삭제</b></td>
</tr>

<c:forEach var="member" items="${report}">
<tr>
<td>
${member.email}
</td>
<td>
${member.connickname}
</td>
<td>
${member.conreportcount}
</td>
<td><input type="checkbox" name="delete" value="${member.email}"></td>
</tr>
</c:forEach>
</table>
<div align="center"><input type="submit" value="회원삭제"></div>
</form>

</div>
</body>
</html>