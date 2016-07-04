<%@ page contentType="text/html; charset=EUC-KR"%>
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
</head>
<body>
<div id ="view_div" class="box-shadow border-round white">
회원삭제가 완료되었습니다.
잠시후 관리자페이지로 이동합니다.
<meta http-equiv="Refresh" content="2;url=/INTERHASH-SPRING/ManagerPage.hash" >
</div>
</body>
</html>