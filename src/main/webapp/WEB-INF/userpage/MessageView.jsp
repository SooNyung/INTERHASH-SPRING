<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>

<head>
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}
body{
font-family: 'Indie Flower', cursive;
}
#fontsize{
font-size:15px;}
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
<script>

function ReMessage(sendEmail,sendNick){
/* 	url="ReMessageForm.hash?check=y&sendEmail="+sendEmail+"&sendNickname="+sendNick; */
	location.href = "ReMessageForm.hash?check=y&sendEmail="+sendEmail+"&sendNickname="+sendNick;
	/* +"&sendNickname="+sendNick; */
	/* url="ReMessage.hash?sendEmail=sender&sendNickname=senderNick"; */
}
</script>
</head>

<body>	
<form method="post" action="deleteMessage.hash">
<input type="button" id="buttonid" value="답장" onclick="ReMessage('${messageone.sendEmail}','${messageone.sendNickname}')">
<input type="submit" id="buttonid" value="삭제"> 
<input type="button" id="buttonid" onclick="javascript:history.go(-1)" value="닫기">

<hr>
<input type="hidden" name="messageNum" value="${messageone.messageNum}">
<div><b id="fontsize">Sender</b> <label id="fontsize">${messageone.receNickname}(${messageone.receNickname})</label><spen id="heart" class="fontawesome-heart"></spen></div>
<div><b id="fontsize">From time</b> <label id="fontsize">${sdf.format(messageone.sendDate)}</label></div>

<hr>
<div>${messageone.messageContent}</div>


</form>

</body>
</html>