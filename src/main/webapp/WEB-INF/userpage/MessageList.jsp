<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<html>

<head>


</head>

<body>

		<c:forEach var="list" items="${messageList}">
			<div>
			<span>글번호 :${list.messageNum}</span>
				<span>수신자 : ${list.sendNickname}(${list.sendEmail})</span> 
				<span>보낸날짜: ${sdf.format(list.sendDate)}</span><br> 
				<span>
				<a href="MessageView.hash?messageNum=${list.messageNum}">${list.messageContent}</a> 
				</span><br>
				<hr>
	</div>
	</c:forEach>

</body>
</html>