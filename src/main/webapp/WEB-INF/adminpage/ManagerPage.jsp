<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>������</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
#view_div{
	width:120%;
	height:85%;
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

a:link,a:hover{text-decoration:none; font-size:16px;}
a:hover{font-weight:bold; color:#ff6088;}
a{color:#FDFEFE; font-weight:bold;}
#bar{background-color:#ffcccc; border-radius:7px; width:60%; }
b{font-family: 'Nanum Gothic Coding', serif; font-size:20px;}
</style>
</head>

<body>
<div id ="view_div" class="box-shadow border-round white">
<center>
<b>������������</b>
<br>
<div id= "bar"><a href="ManagerPageCount.hash">���</a></div><br>
<div id= "bar"><a href="ManagerPageReport.hash">�Ű�Խù�</a></div><br>
<div id= "bar"><a href="ManagerPageMember.hash">ȸ������</a></div><br>
<div id= "bar"><a href="ManagerPageDeleteMember.hash">Ż��ȸ������</a></div><br>
</div>
</body>
</html>