<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>INTERHASH#</title>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://weloveiconfonts.com/api/?family=entypo);
@import url(http://weloveiconfonts.com/api/?family=maki);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);


[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

.box-shadow {
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19) !important;
   
}



.border-round {
   border-radius: 7px !important
}


.white {
   color: #000 !important;
   background-color: #fff !important;
   
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
/*    padding: 1rem 0; */
	padding-bottom: 10px;
	width:100%;
  
}

.form input[type="text"], .form input[type="submit"], .form input[type="date"] {
  width: 100%;
}
.form--login #pwdchecked{
	font-size:13px;
	color: red;
	/* padding-left: 100px; */
	width: 100%;
}

.form--login #pwdchecked2{
	font-size:13px;
	color: green;
	/* padding-left: 100px; */
	width: 100%;
}


.form--login {
   color: #606468;  
	/* color:#FFFFFF;  */
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
  /* background-color:#DBDBDB; */
  
/*   border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem; */
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
  margin-bottom: 0.5rem;
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
/*    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19) !important;
   margin-top: 0px;
   border-radius: 7px !important
   color: #000 !important;
   background-color: #fff !important; */
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
 /*   max-width: 25rem; */
 width: 80%;
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

#test2 {
/*  	padding-left : 25.5%;
	padding-right : 24%; */
	 border: 1px solid #d9d9d9;
	 border-top-left-radius: 0rem;
	 border-bottom-left-radius:0;
}

#radio {
	padding-right: 6px;
}

#fa{
	margin:0px;
	margin-right: 2.4%;
}
 #ra{
	margin-right: 16%;
} 

#pu{
	color: #FF6088;
	padding-left: 65%;
}

:checked+label {
	color: #ea4c88;
}
.circle {
   border-radius: 50%;
}
</style>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 
<script>
$(document).ready(function(){ 
	var hasharr = "${c.checked}"; //hasharr에 저장됨
	var hash=document.getElementsByName("checked"); //해쉬체크박스 배열 가져옴
	
	for(i=0;i<hash.length;i++){
		 if(hasharr.indexOf(hash[i].value)!=-1){ 
			hash[i].checked=true;
		}
	}  
	
});
$(document).ready(function(){
		var rad = "${c.bloodgroups}";
		var blood=document.getElementsByName("bloodgroups"); 
		
	 	for(i=0;i<blood.length;i++){
			if(rad.indexOf(blood[i].value)!=-1){
				blood[i].checked=true;
			}
		} 
});

$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}



</script>
</head>

<body class ="align">

  <div class="site__container box-shadow border-round white">
<h1>PROFILE</h1>
    <div class="grid__container">
    <form action="profilePro.hash" name="userinput" method="post" class="form form--login" onSubmit="return checkedIt()" enctype="multipart/form-data">
   		 <p class="center">
    
              <img id="blah" src="image/logo/사람.PNG" class="circle" style="height: 106px; width: 106px"
                     alt="Avatar">
                   
               </p>
               <p class="center">
               <input type='file' id="imgInp" name="photo">
               
               </p>
               <hr color="#eee">

      

		<div class="form__field">
			<label class="fontawesome-ok" id="pu">공개</label>
			<label class="fontawesome-ok">비공개</label>
		</div>
					
        <div class="form__field">
          <label class="fa fa-birthday-cake fa-fw margin-right text-theme" id="fa" for="login__username"><span class="hidden">birth</span></label>
          <label id="test2"><input id="login__username" name="birthday" type="date" value="${c.birthday}" class="form__input"></label>
           <input type="checkbox" name="checked" value="birthday" id="birth" style="display:none">
				<label for="birth" class="fontawesome-ok"></label>
				
	
        </div>
        
         <div class="form__field">
          <label class="fontawesome-phone" for="login__username"><span class="hidden">phone number</span></label>
          <input id="login__username" name="phone" type="text" class="form__input" placeholder="Phone number" value="${c.phone}">
        <input type="checkbox" name="checked" value="phone" id="pho" style="display:none">
				<label for="pho" class="fontawesome-ok"></label>
        </div>

        
        <div class="form__field">
          <label class="fontawesome-home" for="login__password"><span class="hidden">Location</span></label>
          <input type="text" id="login__password" name="location" class="form__input" placeholder="Location" value="${c.location}">
        <input type="checkbox" name="checked" value="location" id="locat" style="display:none">
				<label for="locat" class="fontawesome-ok"></label>
        </div>
        
 
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">middle</span></label>
          <input id="login__username" name="middleschool" type="text" class="form__input" placeholder="Middle school" value="${c.middleschool}">
        <input type="checkbox" name="checked" value="middleschool" id="middle" style="display:none">
				<label for="middle" class="fontawesome-ok"></label>
        </div>
        
       
        
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">highschool</span></label>
          <input id="login__username" name="highschool" type="text" class="form__input" placeholder="High school" value="${c.highschool}">
        <input type="checkbox" name="checked" value="highschool" id="high" style="display:none">
				<label for="high" class="fontawesome-ok"></label>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">university</span></label>
          <input id="login__username" name="university" type="text" class="form__input" placeholder="University" value="${c.university}">
       <input type="checkbox" name="checked" value="university" id="univer" style="display:none">
				<label for="univer" class="fontawesome-ok"></label>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-briefcase" for="login__username"><span class="hidden">job</span></label>
          <input id="login__username" name="job" type="text" class="form__input" placeholder="Workplace" value="${c.job}">
       <input type="checkbox" name="checked" value="job" id="jo" style="display:none">
				<label for="jo" class="fontawesome-ok"></label>
        </div>
        
        
        <div class="form__field">
          <label class="fontawesome-tint" for="login__username"><span class="hidden">blood</span></label>
    
         <label id="ra">
          <label id="radio"><input type="radio" name="bloodgroups" value="A형">A형</label>
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="B형">B형</label>  
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="O형">O형</label>
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="AB형">AB형</label>
		   </label> 
		  <input type="checkbox" name="checked" value="bloodgroups" id="blood" style="display:none">
				<label for="blood" class="fontawesome-ok"></label>
        
        </div>
        
        <input type="hidden" name="email" value="${c.email}">       
        

        <div class="form__field">
          <input type="submit" value="MODIFY PROFILE">
        </div>

      </form>


    </div>

  </div>


</body>
</html>