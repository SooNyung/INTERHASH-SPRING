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

#text{text-align:center;}


a:hover{color:#ff6088; font-weight: bold;}
a:link{text-decoration:none; }

</style>


</head>
<body>
<div id="view_div" class="box-shadow border-round white">
<center>
<h3>회원관리</h3>
<hr/>
전체 회원 수:${count}
<form method="post" action="ManagerPageMemberPro.hash">
<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">
<br>
<table id ="text">
<tr bgcolor="#ffcccc">
<td width="150"><b>email</b></td>
<td width="150"><b>nickname</b></td>
<td width="150"><b>가입 날짜</b></td>
<td width="100"><b>회원삭제</b></td>
</tr>
<c:forEach var="member" items="${array}">
<tr>
<td>
${member.email}
</td>
<td>
<a target="_blank" href="#" onclick="window.open('ProfileView.hash?nickname=${member.nickname}','new','resizable=no width=700 height=500');return false">${member.nickname}</a>

</td>
<td>
${member.createddate}
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