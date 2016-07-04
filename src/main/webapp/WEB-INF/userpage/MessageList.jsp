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
#fontsize{
font-size:15px;
}


#message{
overflow: hidden;
text-overflow: ellipsis;
width: 300px;
border:0;
}

#message:hover{
	text-decoration: underline; 
  color:#ea4c88;
   cursor:pointer;
}

body{
background-color:white;
font-family: 'Indie Flower', cursive;
}
#heart{
	color:#ea4c88;
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

#rigth{
	float: right;
}
a {
color:#8C8C8C;
text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline; 
  color:#ea4c88;
  
}
h2{
text-align: center;
}
#buttonid {
	color: white;
	background-color: #FFCCCC;
	border-radius: 7px !important;
	padding:5px;
}
</style>

</head>

<body>

<!-- <a id="rigth" href="MessageList.hash"><spen class="fontawesome-envelope"> Received messages </a>
<br> 
<h2><spen id="heart" class="fontawesome-heart"></spen>Send Message<spen id="heart" class="fontawesome-heart"/></h2>
 -->

<!-- <div id="bar"> -->

<a id="rigth" href="MessageForm.hash"><spen class="fontawesome-envelope">Send Message</a><br>
<!-- </div> -->
<h2><spen id="heart" class="fontawesome-heart"></spen>Received messages<spen id="heart" class="fontawesome-heart"/></h2>
<hr>
	<c:forEach var="list" items="${messageList}">
		<c:if test="${list!=null}">
		<div>
			<span><b id="fontsize">Sender |</b> <label id="fontsize">${list.sendNickname}(${list.sendEmail})</label></span><br> 
			<span><b id="fontsize">From time |</b> <label id="fontsize">${sdf.format(list.sendDate)}</label></span><br><hr>
				<span> <a href="MessageView.hash?messageNum=${list.messageNum}">
				<input type="text" id="message" value="${list.messageContent}"></a>
				<input type="hidden" name="messageNum" value="${list.messageNum}">
				<input type="button" id="buttonid" value="삭제" onclick="location.href='deleteMessage.hash?messageNum=${list.messageNum}'"> 
			</span><br>
		</div>
		</c:if>
		
		<c:if test="${list==null}">
		<div>쪽지가 없습니다.</div>
		</c:if>
	</c:forEach>

</body>
</html>