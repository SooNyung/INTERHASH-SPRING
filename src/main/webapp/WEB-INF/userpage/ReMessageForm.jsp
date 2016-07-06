<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}
#fontsize{
font-size:15px;
}
body{
font-family: 'Indie Flower', cursive;
}
#buttonid {
	color: white;
	background-color: #FFCCCC;
	border-radius: 7px !important;
	padding:5px;
}
#buttonid:hover {
	color: white;
	background-color: #FF9090;
	border-radius: 7px !important;
	padding:5px;
}
#heart{
	color:#ea4c88;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
function checkIt() {
		alert("전송되었습니다.");
		
}

</script>

</head>
<body>

<div align="center">
<form method="post" action="ReMessagePro.hash" onsubmit="checkIt()">
<div><b id="fontsize">Email : </b> 
<span readonly="readonly">${sendNick}(${sender})</span><spen id="heart" class="fontawesome-heart"></spen>
</div>
<hr>
<input type="hidden" name="sender" value="${sender}">
<input type="hidden" name="sendNick" value="${sendNick}">

<div><textarea name="messagecontent" rows="10" cols="50">[답장]</textarea></div><br>

<div>
<input type="submit" id="buttonid" value="Send">
<input type="button" id="buttonid" value="Close" onclick="javascript:history.go(-1)"/>
</div>
</form>
</div> 

</body>
</html>