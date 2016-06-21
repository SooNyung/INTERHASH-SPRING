<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>INTERHASH#</title>
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
#test1 {
	margin: 0px;
	padding-left : 20px;
	padding-right : 20px;
	 border: 1px solid #d9d9d9;
}
#test2 {
	margin: 0px;
	padding-left : 55px;
	padding-right : 56px;
	 border: 1px solid #d9d9d9;
}

#radio {
	margin-right: 10px;
	padding-right: 10px;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script>
window.onload=function checked(){
 	var rad = "${dto.blood}";
	var blood=document.getElementsByName("blood"); 
	
 	for(i=0;i<blood.length;i++){
		if(rad.indexOf(blood[i].value)!=-1){
			blood[i].checked=true;
		}
	}  
	
}
</script>
</head>

<body class="align">

  <div class="site__container">
<h1>PROFILE</h1>
    <div class="grid__container">


      <form action="profilePro.hash" name="userinput" method="post" class="form form--login" onSubmit="return checkIt()">

        <div class="form__field"><span class="hidden">birth</span>
          <label class="fontawesome-star" for="login__username"><span class="hidden">birth</span></label>
          <label id="test1">Birthday</label><label id="test2"><input id="login__username" name="birthday" type="date" value="${c.birthday}" class="form__input"></label>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-phone" for="login__username"><span class="hidden">phone number</span></label>
          <input id="login__username" name="phone" type="text" class="form__input" placeholder="Phone number" value="${c.phone}">
        </div>

        
        <div class="form__field">
          <label class="fontawesome-home" for="login__password"><span class="hidden">Location</span></label>
          <input type="text" id="login__password" name="location" class="form__input" placeholder="Location" value="${c.location}">
        </div>
        
 
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">elementaryschool</span></label>
          <input id="login__username" name="middleschool" type="text" class="form__input" placeholder="Middle school" value="${c.middleschool}">
        </div>
        
       
        
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">highschool</span></label>
          <input id="login__username" name="highschool" type="text" class="form__input" placeholder="High school" value="${c.highschool}">
        </div>
        
        <div class="form__field">
          <label class="fontawesome-book" for="login__username"><span class="hidden">university</span></label>
          <input id="login__username" name="university" type="text" class="form__input" placeholder="University" value="${c.university}">
        </div>
        
        
        <div class="form__field">
          <label class="fontawesome-tint" for="login__username"><span class="hidden">blood</span></label>
          <!-- <input id="login__username" name="graduateschool" type="radio" class="form__input"> -->
          <label id="radio"><input type="radio" name="bloodgroups" value="A형">A형</label>
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="B형">B형    </label>  
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="O형">O형     </label>
		  <label id="radio"><input type="radio" id="radio" name="bloodgroups" value="AB형">AB형    </label> 
        </div>
        
               
        

        <div class="form__field">
          <input type="submit" value="MODIFY PROFILE">
        </div>

      </form>


    </div>

  </div>


</body>
</html>