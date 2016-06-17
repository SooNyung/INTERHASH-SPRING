<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<style>
#view_div{
	width:780px;
	height:640px;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin:auto;
	}
</style>
</head>
<body>
<div id ="view_div">
<center>
<p>관리자페이지입니다.</p>
    
<a href="ManagerPageCount.hash">통계</a><br>
<a href="ManagerPageReport.hash">신고게시물</a><br>
<a href="ManagerPageMember.hash">회원관리</a><br>
<a href="ManagerPageDeleteMember.hash">탈퇴회원관리</a><br>
</div>
</body>
</html>