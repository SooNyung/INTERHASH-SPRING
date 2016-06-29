<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
   /* background-color: #2c3338; */
   background-color: #FFFFFF; 
   color: #606468; 
	/* color:#EAEAEA; */
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}

a {
  color: #C2C2C2;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline; 
  color:#ea4c88;
  
}

input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}

.site__container {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 3rem 0;
}

.form input[type="text"], .form input[type="submit"] {
  width: 100%;
}
.form--login {
 /*  color: #606468; */
 color:#FFFFFF;
}
.form--login label,
.form--login input[type="text"],
.form--login input[type="submit"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  /* background-color: #363b41; */
  background-color:#DBDBDB;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"], .form--login input[type="password"] {
  /* background-color: #3b4148; */
 /*  background-color:#FFFFFF; */
  color:#606468;
  display: block;
  background: transparent;
  border: 1px solid #d9d9d9;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}

.form--login input[type="submit"] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #d44179;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}

.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 25rem;
  width: 90%;
}
h1 {
  font-size: 30px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}

</style>
<title> #PasswordFind </title>
<c:set var="email" value='${email}' />
<script>
	function checkIt(){
		var userinfo = eval("document.useremail");
		
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		
		if(!userinfo.email.value){
			alert("이메일주소를 입력해주세요.");
			userinfo.email.focus();
			return false;
		}
		
		if(regex.test(userinfo.email.value) === false) 
		{  
		    alert("잘못된 Email 형식입니다.");  
		    userinput.email.focus(); 
		    return false; 
		}
		
		return true;
	}
</script>

</head>

<body class="align">
	<div class="site__container">
		<h1>FIND</h1>
			<div class="grid__container">
<c:if test="${email==null }">

	<form class="form form--login" method="post" name="useremail" action="FindPasswordPro.hash" onSubmit="return checkIt()">
		<div class="form__field">
			<label class="fontawesome-user" for="login__username">
				<span class="hidden">User Email</span>
			</label>
				<input id="login__username"	name="email" type="text" class="form__input" placeholder="User email" required>
		</div>
		
		<div class="form__field">
			<input type="submit" value="FIND →" name="confirm">
		</div>
		
		<div class="form__field">
			<input type="submit" value="CANCEL →" onClick="location.href='Main.hash'" />
		</div>
				
	</form>
</c:if>


	<%--<c:if test="${email != null}">
email ::: ${email} <br>
password ::: ${password} <br>
tempPassword ::: ${key}<br>
</c:if> --%>

	<c:if test="${email!=null}">
		<center>
			<h3>해당 이메일로 임시 비밀번호가 전송되었습니다!</h3>
			<hr align="center" style="border: dashed 0.5px #D8D8D8; width: 50%;">
			<br>
			<br> ♡잠시후 페이지가 이동합니다♡
		</center>
		<meta http-equiv="Refresh" content="4;url=Main.hash">
	</c:if>
		</div>
</div>

</body>
</html>