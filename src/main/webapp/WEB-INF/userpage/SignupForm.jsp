<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>INTERHASH#</title>
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
#hdc{
display: none;
}
#hdc2{
width: 100%;
padding-left: 10px;
}
#pwd{
display: none;
}
#pwd2{
color:red;
background-color: white;
padding-left: 60px;
}
#pwd3{
color:green;
background-color: white;
padding-left: 60px;
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

.form input[type="password"], .form input[type="text"], .form input[type="submit"] {
  width: 100%;
}
.form--login #pwdcheck{
	font-size:13px;
	color: red;
	/* padding-left: 100px; */
	width: 100%;
}

.form--login #pwdcheck2{
	font-size:13px;
	color: green;
	/* padding-left: 100px; */
	width: 100%;
}


.form--login {
/*   color: #606468;  */
	color:#FFFFFF; 
}
.form--login label,
.form--login input[type="text"],
.form--login input[type="password"],
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
.form--login input[type="text"]:focus,.form--login input[type="password"]:focus {
  /* background-color: #434A52; */
  border: 1px solid #B0B0B0;
  
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

font{
	font-size:3px;
	color:red;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script>
var checkEmail=false;
var checkNickname=false;
var checkEmailNum=false;

	
function checkIt(){
	
	var key = '${key}';
	var userinput = eval("document.userinput");
	var passwdCheck = $('input[name=hiddenCheck]').val();
	if((passwdCheck=='비밀번호가 동일하지 않습니다')){
		alert("비밀번호가 동일하지 않습니다. 다시 한번 확인해주세요:-)");
		return false;
	}
	if(!userinput.email.value){
		alert("Email을 입력하세요.");
		return false;
	}
	if(!userinput.emailnumber.value){
		alert("Email을 인증해주세요");
		return false;
	}
	if(!userinput.passwd.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(!userinput.passwd1.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(!userinput.nickname.value){
		alert("닉네임을 입력하세요.");
		return false;
	}
	
/* 	if(userinput.getElementById('pass').value != userinput.getElementById('pass1').value){
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	} */
	if(!checkEmail){
		alert("이메일 중복확인을 해주세요");
		return false;
	}
	if(!checkNickname){
		alert("닉네임 중복확인을 해주세요");
		return false;
	}
	if(!checkEmailNum){
		alert("이메일 인증번호를 확인해주세요");
		return false;
	}
/* 	if(userinput.passwd.value!=!userinput.passwd1.value){
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	} */
	
/*    		if(userinput.emailnumber.value != '${key}'){
		alert("이메일이 인증되지 않았습니다.");
		return false;
	} */
/*  		if(userinput.emailnumber.value != key){
		alert("이메일이 인증되지 않았습니다.");
		return false;
	} */
/* 		if(key != 'success'){
		alert("이메일이 인증되지 않았습니다.");
		return false;
	} */

	
	return true;
};

	
function confirmnickname() {
	var userinput = eval("document.userinput");
	if(userinput.nickname.value=="") {
		alert("닉네임을 입력해 주세요");
		return false;
	}
	url="/INTERHASH-SPRING/ConfirmNickname.hash?nickname=" + userinput.nickname.value;
	open(url, "confirmnik", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	checkNickname=true;
}

function confirmemail(){
	var userinput = eval("document.userinput");
	if(userinput.email.value=="") {
		alert("Email을 입력해주세요");
		return false;
	}
	url="/INTERHASH-SPRING/ConfirmEmail.hash?email=" + userinput.email.value;
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	checkEmail=true;
}
function keyCheck(){
/* 		var userinput = eval("document.userinput");
	if(userinput.emailnumber.value==""){
		alert("키를 입력해 주세요");
		return false;
	} */
	url="/INTERHASH-SPRING/ConfirmKey.hash?inputkey=" + userinput.emailnumber.value;
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	checkEmailNum=true;
}


var checkflag = "false";

function check(field) {
if (checkflag == "false") {
  for (i = 0; i < field.length; i++) {
   field[i].checked = true;
  }
  checkflag = "true";
} else {
  for (i = 0; i < field.length; i++) {
   field[i].checked = false; 
  }
  checkflag = "false"; 
	}
};
</script>
<script>
$(function(){
	  $('input[name=passwd]').keyup(function(){
	   $('input[name=hiddenCheck]').text('');
	  }); //#user_pass.keyup

	  $('input[name=passwd1]').keyup(function(){
	   if($('input[name=passwd]').val()!=$('input[name=passwd1]').val()){
		   $('input[name=hiddenCheck]').attr("type", "font");
		   $('input[name=hiddenCheck]').attr("id","pwdcheck");
		   $('#pwd').attr("id","pwd2");
		   $('#hdc').attr("id","hdc2");
		   	if($('#pwd3')){
		   		$('#pwd3').attr("id","pwd2");
		   		$('#pwd2').attr("class","fontawesome-lock");
		   	}
		   
	   	 $('input[name=hiddenCheck]').val("비밀번호가 동일하지 않습니다");
	   	 
	   }else{
		$('input[name=hiddenCheck]').attr("type", "font")
		$('input[name=hiddenCheck]').attr("id","pwdcheck2");
		$('#hdc').attr("id","hdc2");
		$('#pwd').attr("id","pwd3");
		$('#pwd2').attr("id","pwd3");
		$('#pwd3').attr("class","fontawesome-unlock");
	    $('input[name=hiddenCheck]').val("비밀번호가 동일합니다");
	   }
	  }); //#chpass.keyup
	 });

</script>
</head>

<body class="align">
  <div class="site__container">
<h1>SIGN UP</h1>
    <div class="grid__container">


      <form action="SignupPro.hash" name="userinput" method="post" class="form form--login" onSubmit="return checkIt()">

        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">User email</span></label>
          <input id="login__username" name="email" type="text" class="form__input" placeholder="User email" required>
          <input type="button" value="CONFIRM" onClick="confirmemail()"/>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">Email number</span></label>
          <input id="login__username" name="emailnumber" type="text" class="form__input" placeholder="Confirm email number" required>
          <input type="button" value="C H E C K " onClick="keyCheck()"/>          
        </div>





        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input type="password" id="login__password" name="passwd" class="form__input" placeholder="Password" required>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password1</span></label>
          <input type="password" id="login__password" name="passwd1" class="form__input" placeholder="Password check" required>
        </div>

		<div class="form__field">
		<span id="pwd" class="fontawesome-lock"> </span>
		<span id="hdc"><input type="hidden" id="pwdcheck" name="hiddenCheck" readonly="readonly"></span>
       </div>
        
        
        
        
        
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">User nickname</span></label>
          <input id="login__username" name="nickname" type="text" class="form__input" placeholder="Nickname" required>
          <input type="button" value="CONFIRM" onClick="confirmnickname()"/>
        </div>
        
               
        

        <div class="form__field">
          <input type="submit" value="NEXT →">
        </div>

      </form>

<!--       <p class="text--center">Not a member? <a href="SignupForm.hash">Sign up now</a> <span class="fontawesome-arrow-right"></span></p>
      <p class="text--center">Forgot password? <a href="FindPasswordForm.hash">Find password</a> <span class="fontawesome-arrow-right"></span></p> -->

    </div>

  </div>


</body>
</html>