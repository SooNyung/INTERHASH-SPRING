<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>

<head>
<script>

function ReMessage(sendEmail,sendNick){
	url="ReMessageForm.hash?check=y&sendEmail="+sendEmail+"&sendNickname="+sendNick;
	open(url);
	/* +"&sendNickname="+sendNick; */
	/* url="ReMessage.hash?sendEmail=sender&sendNickname=senderNick"; */
}
</script>
</head>

<body>	
<form method="post" action="deleteMessage.hash">
<input type="hidden" name="messageNum" value="${messageone.messageNum}">
<div>보낸사람:${messageone.receNickname}(${messageone.receNickname})</div>
<div>${sdf.format(messageone.sendDate)}</div>

<div>내용</div>
<div>${messageone.messageContent}</div>
<input type="submit" value="삭제"> 
<input type="button" value="답장하기" onclick="ReMessage('${messageone.sendEmail}','${messageone.sendNickname}')">
</form>

</body>
</html>