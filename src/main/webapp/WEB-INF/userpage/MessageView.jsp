<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>

<head>
<style>
#fontsize{
font-size:15px;}
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
<input type="button" value="답장" onclick="ReMessage('${messageone.sendEmail}','${messageone.sendNickname}')">
<input type="submit" value="삭제"> 
<input type="button" onclick="javascript:history.go(-1)" value="닫기">
<hr>
<input type="hidden" name="messageNum" value="${messageone.messageNum}">
<div><b id="fontsize">보낸사람</b> <label id="fontsize">${messageone.receNickname}(${messageone.receNickname})</label></div>
<div><b id="fontsize">받은날짜</b> <label id="fontsize">${sdf.format(messageone.sendDate)}</label></div>

<hr>
<div>${messageone.messageContent}</div>


</form>

</body>
</html>