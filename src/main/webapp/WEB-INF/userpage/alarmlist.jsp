<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<html>

<head>
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src='<c:url value="modal/jquery.magnific-popup.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="modal/magnific-popup.css"/>' >
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

#view_div{
	width:120%;
	height:1100px;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin-top:10px;
	}
</style>

<script type="text/javascript">
$('.img_link').magnificPopup({
    type:'ajax'
 });
 
$(window).scroll(function(){
	if($(window).scrollTop()==$(document).height()-$(winidow).height()){
		lastAddedLiveFunc();
		}
	});
</script>
<!-- 좋아요 기능 function -->

</head>

<body>
<div id ="view_div" class="box-shadow border-round white">
<!-- <a id="rigth" href="MessageList.hash"><spen class="fontawesome-envelope"> Received messages </a>
<br> 
<h2><spen id="heart" class="fontawesome-heart"></spen>Send Message<spen id="heart" class="fontawesome-heart"/></h2>
 -->

<!-- <div id="bar"> -->

<!-- </div> -->
<h2><span id="heart" class="fontawesome-heart"></span>Alarm<span id="heart" class="fontawesome-heart"/></h2>
<hr>
	<c:forEach var="list" items="${alarmlist}">
		<c:if test="${list!=null}">
		<div>
			<span><b id="fontsize">Sender |</b> <label id="fontsize">${list.comnick}</label></span><br> 
			<span><b id="fontsize">From time |</b> 
	<label id="fontsize"> ${list.alarmdate} </label>
			</span><br><hr>
			
			<c:if test="${list.kinds == 0}">
				<span>  <a href="ContentView.hash?connum=${list.connum}" class="img_link">
				<b>${list.comnick}</b>님이 회원님의 게시글에 댓글을 남겼습니다.</a>			
				<input type="button" id="buttonid" value="삭제" onclick="location.href='alarmdelete.hash?alarmnum=${list.alarmnum}'"> 
			</span><br>
			</c:if>
			
			<c:if test="${list.kinds == 1}">
				<span> <a href="ContentView.hash?connum=${list.connum}" class="img_link">
				<b>${list.comnick}</b>님이 회원님의 게시글을 좋아합니다.</a>		
				<input type="button" id="buttonid" value="삭제" onclick="location.href='alarmdelete.hash?alarmnum=${list.alarmnum}'"> 
			
			</span><br>
			</c:if>
			
		</div>
		</c:if>
		
		<c:if test="${list==null}">
		<div>알림이 없습니다.</div>
		</c:if>
	</c:forEach>
</div>
</body>
</html>