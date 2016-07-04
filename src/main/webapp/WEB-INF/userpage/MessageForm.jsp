<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}
input[name=hiddenCheck]{
	color:red;
}

body{
background-color:white;
font-family: 'Indie Flower', cursive;
}

a {
color:#8C8C8C;
text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline; 
  color:#ea4c88;
  
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
</style>
<script>
var check = false;
var check2 = false;
function checkIt() {
	if(check){
		alert("전송되었습니다.");
		window.close();
		return true;
	}
	if(!check) {
		alert("이메일을 확인 해주세요.");
		return false;
	}
	if(!checzk2) {
		alert("올바른 이메일을 입력해주세요.")
		return false;
	}
}
function email(){
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  
	var emailList = "${emailList}";
	var email = document.getElementById("receEmail").value;
	
	if(regex.test(email) === false) {  
	    alert("잘못된 이메일 형식입니다.");  
	    check = true;
	    return false;
	}
	if(emailList.indexOf(email)>0){
		alert("해당 이메일을 사용하실 수 있습니다.")
		check = true;
		check2 = true;
	}
	else if(emailList.indexOf(email)==0){
		alert("이메일을 입력해주세요.")
		check = true;
	}
	else{
		alert("해당 이메일은 없는 이메일입니다.");
		check = false;
	}
	
}
</script>

</head>
<body>	

<div align="center">
<div>
<a id="rigth" href="MessageList.hash"><spen class="fontawesome-envelope"> Received messages </a>
<br> 
<h2><spen id="heart" class="fontawesome-heart"></spen>Send Message<spen id="heart" class="fontawesome-heart"/></h2>

<!-- <a href="#"> Send message   </a><br><br> -->	


</div>

<form method="post" action="MessagePro.hash" onsubmit="return checkIt()">
<div>Email : 
<input type="email" id="receEmail" name="receEmail" value="${email}">
<input type="button" id="buttonid" onclick="email()" value="Confirm email">

</div>
<hr>

<div><textarea name="messagecontent" rows="10" cols="50"></textarea></div><br>

<div>
<input type="submit" id="buttonid" value="Send">
<input type="button" id="buttonid" value="Close" onclick="javascript:window.close()"/>
</div>

</form>
</div>

</body>
</html>