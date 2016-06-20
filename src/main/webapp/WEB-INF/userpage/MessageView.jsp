<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="declare/assets/css/main.css" />

</head>

<body>

	
<form method="post" action="deleteMessage.hash">
<input type="hidden" name="messageNum" value="${messageone.messageNum}">
<div>보낸사람:${messageone.receNickname}(${messageone.receNickname})</div>
<div>${sdf.format(messageone.sendDate)}</div>

<div>내용</div>
<div>${messageone.messageContent}</div>
<input type="submit" value="삭제"> 
</form>

</body>
</html>