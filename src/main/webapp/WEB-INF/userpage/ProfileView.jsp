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
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

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
/*   font: 400 0.875rem/1.5 "Open Sans", sans-serif; */
  margin: 0;
  min-height: 100%;
  	
	
font-family: 'Nanum Brush Script', serif;
font-size: 20px;
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
	width:80%;
  
}

.form input[type="text"], .form input[type="date"] {
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
.form--login input[type="password"]{
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
/* .form--login input[type="submit"] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
} */
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

.circle {
   border-radius: 50%;
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

#idd {
	color: white;
	background-color: #BDBDBD;
	border-radius: 7px !important;
	padding:5px;
}
/* h1{
font-family: 'Indie Flower', cursive;
} */

</style>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 
<script>
$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
    
    
});

$(document).ready(function(){  
    var check = "${c.checked}";
        $('.profile').each(function() {
          var tt = $(this).attr("id");
         if(check.indexOf(tt)!=-1){ 
              $(this).attr("style","inline");
        } 
       });  
 });
 
$(document).ready(function(){  
    
    var check = "${c.checked}"; //hasharr에 저장됨
    /* var hi = $(".pro").attr("id"); */
    
    $('.pro').each(function() {
        var eachh = $(this).attr("id");
        /* alert(eachh); */
         if(check.indexOf(eachh)!=-1){
           $(this).attr("type","font");
        } 
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
<h1>${c.nickname}'s PROFILE</h1>
    <div class="grid__container">
    <form action="MessageForm.hash?email=${c.email}" name="userinput" method="post" class="form form--login" enctype="multipart/form-data">
   		 <center>
   		 <p class="center">
 			
               <img id="blah" src='<c:url value="/upload/${path}" />' 
                  style="height: 130px; width: 130px" class="circle"
                     alt="Avatar">
                   
               </p>
               <hr color="#eee">
               
               <p>
                  <i class="fa fa-pencil fa-fw margin-right text-theme"></i>
                  ${c.nickname}
                  <span><input type="submit" value="Send Message" id="buttonid" style="cursor:pointer"> </span>
                </p>
               

               
                <p>
                  <i class="fa fa-birthday-cake fa-fw margin-right text-theme profile" id="birthday" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="birthday" value="${c.birthday}" readonly="readonly">
               </p>
               <p>
                  <i class="fa fontawesome-phone fa-fw margin-right text-theme profile" id="phone" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="phone" value="${c.phone}" readonly="readonly">
               </p>
               <p>
                  <i class="fa fa-home fa-fw margin-right text-theme profile" id="location" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="location" value="${c.location}" readonly="readonly">
               </p>

               <p>
                  <i class="fa fontawesome-tint fa-fw margin-right text-theme profile" id="bloodgroups" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="bloodgroups" value="${c.bloodgroups}" readonly="readonly">
               </p>
               <p>
                  <i class="fa fontawesome-book fa-fw margin-right text-theme profile" id="middleschool" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="middleschool" value="${c.middleschool}" readonly="readonly">
               </p>
               <p>
                  <i class="fa fontawesome-book fa-fw margin-right text-theme profile" id="highschool" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="highschool" value="${c.highschool}" readonly="readonly">
               </p>
               <p>
                  <i class="fa fontawesome-book fa-fw margin-right text-theme profile" id="university" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="university" value="${c.university}" readonly="readonly">
               </p>
               
               <p>
                  <i class="fa fontawesome-briefcase fa-fw margin-right text-theme profile" id="job" style="display: none;"></i>
                  <input type="hidden" name="pro" class="pro" id="job" value="${c.job}에서 근무" readonly="readonly">
               </p>
               
               <p>
               <input type="button" value="Close" onClick="window.close()" style="cursor:pointer">
               </p>
               
               </form>
               </div>
               </div>
 		
 		

</body>
</html>