<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

#text {text-align:center;}
</style>

</head>
<body>
<div id ="view_div" class="box-shadow border-round white">
<center>
<h3>신고 게시물</h3>
<hr/>
<form method="post" action="ManagerPageMemberPro.hash">
<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">
<table id ="text">
<tr bgcolor="#ffcccc">
<td><b>구분</b></td>
<td><b>게시물</b></td>
<td><b>게시물내용</b></td>
<td><b>게시물계정</b></td>
<td><b>신고내용</b></td>
<td><b>신고자</b></td>
</tr>

<c:forEach var="member" items="${report}">
<tr>
<td width="150">
<c:if test="${ member.redistinction == '1' }" >댓글</c:if >
<c:if test="${ member.redistinction == '0' }" >게시물</c:if >
</td>
<td width="150">

<a onclick="window.open('ContentView.hash?connum=${member.connum }','new','width=1000 height=700') " >${member.connum }</a>
</td>
<td width="150">
${member.reportcontent }
</td>
<td width="150">
${member.email}
</td>
<td width="150">
${member.report}
</td>
<td width="150">
${member.reporter}
</td>
</tr>
</c:forEach>
</table>

</form>

</div>
</body>
</html>