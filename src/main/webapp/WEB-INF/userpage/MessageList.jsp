<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<html>

<head>
<style>
#fontsize{
font-size:15px;
}


#message{
overflow: hidden;
text-overflow: ellipsis;
width: 300px;
border:0;
}
</style>

</head>

<body>
<div id="bar"><a href="#">받은쪽지  </a> | <a href="MessageForm.hash"> 쪽지쓰기</a></div><br>

	<c:forEach var="list" items="${messageList}">
	
		<div>
			<span><b id="fontsize">보낸사람 </b> <label id="fontsize">${list.sendNickname}(${list.sendEmail})</label></span><br> 
			<span><b id="fontsize">받은시간 </b> <label id="fontsize">${sdf.format(list.sendDate)}</label></span><br><hr>
				<span> <a href="MessageView.hash?messageNum=${list.messageNum}">
				<input type="text" id="message" value="${list.messageContent}"></a><br>
			</span><br>
		</div>
		
	</c:forEach>


</body>
</html>