<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<style>
#view_div{
	width:120%;
	height:90%;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin-top:10px;
	}
	

.box-shadow {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19) !important;
	margin-top: 0px;
}



.border-round {
	border-radius: 7px !important;
}


.white {
	color: #000 !important;
	background-color: #fff !important;
}
</style>
</head>
<body>
<div id ="view_div" class="box-shadow border-round white">
<center>
<p>관리자페이지입니다.</p>
    
<a href="ManagerPageCount.hash">통계</a><br>
<a href="ManagerPageReport.hash">신고게시물</a><br>
<a href="ManagerPageMember.hash">회원관리</a><br>
<a href="ManagerPageDeleteMember.hash">탈퇴회원관리</a><br>
</div>
</body>
</html>