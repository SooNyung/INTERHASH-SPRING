<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Bad+Script'
	rel='stylesheet' type='text/css'>
<style>
html, body {
	font-family: "Open Sans", sans-serif;
	font: 400 0.875rem/1.5 "Open Sans", sans-serif;
}

body {
	padding: 0px;
	margin: 0px;
	width: 100%;
	height: 100%;
}
</style>
<head>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href='<c:url value="modal/magnific-popup.css"/>' >


<script src='<c:url value="modal/jquery.magnific-popup.min.js"/>'></script>
<decorator:head />
<meta charset="utf-8">
<title>에벌레</title>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://weloveiconfonts.com/api/?family=typicons);
[class*="typicons-"]:before {
  font-family: 'typicons', sans-serif;
}
h2 {
	font-family: 'Bad Script', cursive;
}

.w3-theme-l5 {
	color: #000 !important;
	background-color: #f5f7f8 !important
}

.w3-theme-l4 {
	color: #000 !important;
	background-color: #dfe5e8 !important
}

.w3-theme-l3 {
	color: #000 !important;
	background-color: #becbd2 !important
}

.w3-theme-l2 {
	color: #000 !important;
	background-color: #9eb1bb !important
}

.w3-theme-l1 {
	color: #fff !important;
	background-color: #7d97a5 !important
}

.w3-theme-d1 {
	color: #fff !important;
	background-color: #cccccc !important
}

.w3-theme-d2 {
	color: #fff !important;
	background-color: #4d636f !important
}

.w3-theme-d3 {
	color: #fff !important;
	background-color: #ffcccc !important
}

.w3-theme-d4 {
	color: #fff !important;
	background-color: #3a4b53 !important
}

.w3-theme-d5 {
	color: #fff !important;
	background-color: #303e45 !important
}

.padding {
	margin-top: 0px;
	margin-left: 0px;
	padding: 0px;
}

.account-right {
	margin-left: 80%;
	float: left;
}

.w3-right {
	text-align: right
}

.navbar {
	top: 0;
	list-style-type: none;
	float: left;
	width: 100%;
	height: 70px;
	position: absolute;
	text-decoration: none;
	text-align: center;
	display: block;
}

.margin-right {
	margin: 20px 0px 0px 30px;
}

.color1 {
	background-color: #FFCCCC
}

.color2 {
	background-color: #FFCCCC
}

.left-align {
	text-align: left !important
}

.font-size {
	font-size: 18px !important
}

.small {
	display: inline !important;
	float: left;
}

.circle {
	border-radius: 50%
}

.padding-large {
	padding: 0px 5px 0px 5px;
}

.closebtn.hover-text.dropdown-hover.hover-white {
	-webkit-transition: background-color .3s, #white .15s, box-shadow .3s,
		opacity 0.3s;
	transition: background-color .3s, #white .15s, box-shadow .3s, opacity
		0.3s
}

.btn-block.accordian-content.dropdown-hover {
	min-width: 100%;
	display: block;
	z-index: 1;
	cursor: auto;
	color: #000;
	background-color: #fff;
	display: none;
	position: absolute;
	min-width: 160px;
	margin: 0;
	padding: 0;
	padding: 6px 16px;
	display: block;
	background-color: #ccc;
	position: relative;
	text-decoration: none !important;
}

.dropdown-hover {
	display: inline-block;
	cursor: pointer
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

.container {
	content: "";
	display: table;
	clear: both;
	padding: 0px 16px;
	margin: 0px;
	margin-left: 0px;
	width: 270px;
}

.count {
	padding: 0px 5px 0px 5px;
}

.container1 {
	content: "";
	display: table;
	clear: both;
	padding: 0.01em 16px;
	margin-left: 0px;
	width: 320px;
}

.center {
	text-align: center
}

.text-theme {
	color: #607d8b !important
}

.accordian {
	width: 100%;
	cursor: pointer
}

.accordian-content {
	cursor: auto;
	display: none;
	position: relative;
	width: 100%;
	margin: 0;
	padding: 0
}

.btn-block {
	border: none;
	display: inline-block;
	outline: 0;
	padding: 6px 16px;
	vertical-align: middle;
	overflow: hidden;
	text-decoration: none !important;
	color: #fff;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	white-space: nowrap;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	width: 100%;
}

.theme-l1 {
	color: #fff !important;
	background-color: #FFCCCC !important
}

/* button:hover{background-color: #B3B6B7 !important} */
.left-align {
	text-align: left
}

.tag {
	display: inline-block;
	padding-left: 1px;
	padding-right: 1px;
	text-align: center;
	margin: 0px 10px 10px 0px;
}

.font-small {
	font-size: 20px
}

.border {
	border: 1px solid #ccc !important
}

.theme-border {
	border-color: #607d8b !important
}

.hover-theme:hover {
	color: #fff !important;
	background-color: #607d8b !important
}

.closebtn:hover, .w3-closebtn:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer
}

.closebtn {
	text-decoration: none;
	float: right;
	font-size: 24px;
	font-weight: bold;
	color: inherit;
}

#head {
	position: fixed;
	width: 100%;
	height: 70px;
	z-index: 5;
}

#main {
	width: 100%;
	padding-top: 70px;
}

#jb-header {
	padding: 20px;
	height: 120px;
	margin-bottom: 20px;

	/*  border: 1px solid #bcbcbc; */
}

#jb_search {
	margin-top: 20px;
	margin-right: 100px;
	padding-right: 10px;
	float: right;
	width: 210px;
	height: 30px;
	/*    border:1px solid #bcbcbc; */
}

#jb-right {
	margin-right: 60px;
	width: 20%;
	height: 100%;
	float: right;
}

#jb-content {
	width: 50%;
	height: 100%;
	margin: auto 120px;
	float: right;
}

#jb-sidebar {
	position: absolute;
	height: 500px;
	width: 25%;
	margin: 10px;
	padding: 0px;
	padding-left: 15px;
	float: left;
	/*      border: 1px solid #bcbcbc; */
}

#jb-footer {
	width: 100%;
	height: 60px;
	clear: both;
}

/*    position:absolute;
   height:60px;
   clear: both;
/*   
    position:absolute;
   bottom:0;
   left:0;
   */
/* border: 1px solid #bcbcbc; */
}
#jb-logo {
	float: left;
	width: 401px;
	height: auto;
}

#jb-logon {
	float: right;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100px;
	background-color: #f1f1f1;
}

li a {
	display: block;
	color: #000;
	padding: 8px 0 8px 16px;
	text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
	background-color: #ffcccc;
	border-radius: 7px;
}

/* ----------------------------------------------------------------------- */
ul.menu li {
	float: right;
	width: 179px;
	height: 48px;
	background-color: #555;
	position: relative;
}

ul.menu li a {
	display: block;
	width: 100%;
	height: 100%;
	line-height: 48px;
	text-indent: 30px;
	font-weight: bold;
	color: #eee;
	text-decoration: none;
}

ul.menu li a:hover {
	background-color: #333;
}

ul.menu li ul.sub {
	position: absolute;
}

ul.menu {
	zoom: 1;
}

ul.menu:after {
	height: 0;
	visibility: hidden;
	content: ".";
	display: block;
	clear: both;
}

.navbar li .account {
	display: none;
	width: 120px;
	border-radius: 7px;
}

.navbar li .sub {
	background: rgb(255, 240, 245);
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: 250px;
	padding: 0px;
	margin: 0px;
	margin-left: 0px;
	border: 0px;
	border-radius: 7px;
	position: absolute;
	width: 200px;
	overflow: hidden;
	z-index: 500;
}

.navbar li .al {
	background: rgb(255, 240, 245);
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: 280px;
	padding: 0px;
	margin: 0px;
	margin-left: 0px;
	border: 0px;
	border-radius: 7px;
	position: absolute;
	width: 200px;
	overflow: hidden;
	z-index: 500;
}

/*  .navbar li:hover ul {
   display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}
* /


.badge {
	color: #b2b2b2;
	margin-top: 4px;
	text-align: center;
}

.right {
	float: right;
}

.pink {
	background-color: #ff6088 !important
}

#a:link {
	text-decoration: none;
	color: #f9ffff;
}

#a:visited {
	text-decoration: none;
	color: #f9ffff;
}

#a:active {
	text-decoration: none;
	color: #f9ffff;
}

#a:hover {
	text-decoration: none;
	color: #f9ffff;
	border-radius: 7px;
	background-color: #ff6088;
}

#up {
	width: 90%;
	height: 350px;
	margin-top: 10px;
	padding: 10px 0px 20px 0px;
}

#down {
	width: 90%;
	height: 400px;
	padding: 10px 0px 20px 0px;
}

/* -----------------------------해시태그버튼 css---------------------------------- */
.button {
	position: relative;
	display: inline-block;
	vertical-align: top;
	height: 20px;
	line-height: 20px;
	padding: 0 10px;
	font-size: 12px;
	color: #8C8C8C;
	text-align: center;
	text-decoration: none;
	text-shadow: 0 -1px rgba(0, 0, 0, 0.4);
	background-clip: padding-box;
	border: 1px solid;
	border-radius: 2px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0
		1px rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 0 0 1px
		rgba(255, 255, 255, 0.08), 0 1px 2px rgba(0, 0, 0, 0.25);
}

.button:before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	pointer-events: none;
	background-image: -webkit-radial-gradient(center top, farthest-corner, rgba(255, 255, 255,
		0.08), rgba(255, 255, 255, 0));
	background-image: -moz-radial-gradient(center top, farthest-corner, rgba(255, 255, 255,
		0.08), rgba(255, 255, 255, 0));
	background-image: -o-radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08
		), rgba(255, 255, 255, 0));
	background-image: radial-gradient(center top, farthest-corner, rgba(255, 255, 255, 0.08),
		rgba(255, 255, 255, 0));
}

.button:hover:before {
	background-image: -webkit-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: -moz-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: -o-radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
	background-image: radial-gradient(farthest-corner, rgba(255, 255, 255, 0.18),
		rgba(255, 255, 255, 0.03));
}

.button:active {
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2);
}

.button:active:before {
	content: none;
}

.button-pink {
	background: #BDBDBD;
	border-color: #EAEAEA #EAEAEA #8C8C8C;
	background-image: -webkit-linear-gradient(top, #EAEAEA, #BDBDBD 66%, #8C8C8C);
	background-image: -moz-linear-gradient(top, #EAEAEA, #BDBDBD 66%, #8C8C8C);
	background-image: -o-linear-gradient(top, #EAEAEA, #BDBDBD 66%, #8C8C8C);
	background-image: linear-gradient(to bottom, #EAEAEA, #BDBDBD 66%, #8C8C8C);
}

.button-pink:active {
	background: #BDBDBD;
	border-color: #5D5D5D #8C8C8C #BDBDBD;
}

.pro {
	/*    font-size: 16px; */
	border: 0px;
	font-family: 'Nanum Pen Script', serif;
	font-size: 20px;
}

.pro1 {
	/*    font-size: 16px; */
	border: 0px;
	font-family: 'Nanum Pen Script', serif;
	font-size: 25px;
}

#profileImg {
	width: 50px;
	height: 50px;
}

#buttonid {
	color: white;
	background-color: #FFCCCC;
	border-radius: 7px !important;
	padding: 5px;
}

#buttonid:hover {
	color: white;
	background-color: #FF9090;
	border-radius: 7px !important;
	padding: 5px;
}

#pop_link {
text-decoration: none;
font-weight:bold;
color:#FF809F;
}

#pop_link:hover{
color:#FF6088;
	text-decoration: underline;
}
#pop_pop{
	color:gray;
}
</style>

    <script>
    
    /*
       conphoto 는 contentInputForm.jsp 파일 안에 있는 파일 업로드 부분
       이곳이 변경되면, 파일을 읽어 들이는 함수 동작
    */
    
    
    
    $(function() {
        $("#conphoto").on('change', function(){
             readURL(this); 
        });
    });

    /*
       사진 미리 보기 부분
       자바스립트의 FileReader() 를 통해 임시 경로에 사진을 업로드 함.
       또한 attr 을 통해 사진의 크기를 강제로 조정함.
    */

    function fileUploadPreview(thisObj, preViewer) {

      // 형식 체크
      if (!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value)) {
         alert("이미지 형식의 파일을 선택하십시오");
         $(thisObj).val('');
         return;
      }

      var preViewer = $('.preViewImg:last');//(typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
      var ua = window.navigator.userAgent;

      // 렌더링 버전 알아내기
      var rv = -1;

      // ie 브라우저이며 ie10 미만 버전
      if (ua.indexOf("MSIE") > -1 && rv < 10) {
         var img_path = "";
         if (thisObj.value.indexOf("\\fakepath\\") < 0) {
            img_path = thisObj.value;
         } else {
            thisObj.select();
            var selectionRange = document.selection.createRange();
            img_path = selectionRange.text.toString();
            thisObj.blur();
         }
         $(preViewer).css(
               'filter',
               "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi"
                     + "le://" + img_path + "', sizingMethod='scale')")
               .show();

         var cloneHtml = $('.photo_list:last').clone();
         cloneHtml.find('input').val('');
         cloneHtml.find('img').removeAttr('src', 'style').hide();
         $(thisObj).parents('.photoBox:first').append(cloneHtml);
      } else { // 그외 브라우저
         var reader = new FileReader();
         reader.readAsDataURL(thisObj.files[0]);
         reader.onload = function(e) {
            $('.preViewImg:last').attr('src', e.target.result).show();

            var cloneHtml = $('.photo_list:last').clone();
            cloneHtml.find('input').val('');
            cloneHtml.find('img').attr('src', '').hide();
            $(thisObj).parents('.photoBox:first').append(cloneHtml);
         }
      }
   }

   function tagCheck() {

      url = "TagCheck.hash?check=y";
      newwindow = window
            .open(
                  url,
                  "post",
                  "toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");

   }


   function Message(){
      url="MessageForm.hash";
      window.open(url,"post","toolbar=no ,width=400 ,height=350,directories=no,status=yes,menubar=no,scrollbars=no");
      } 
   
   function MessageList(){
      url="MessageList.hash?check=y";
      window.open(url,"post","toolbar=no ,width=400 ,height=350,directories=no,status=yes,menubar=no,scrollbars=no");
      } 
   
   function alarmList(){
         url="alarmlist.hash?check=y";
         location.href="alarmlist.hash?check=y";
         //window.open(url,"post","toolbar=no ,width=500 ,height=400,directories=no,status=yes,menubar=no,scrollbars=no");
         }

   $(document).ready(function() {
	   $('.img_link').magnificPopup({
	        type:'ajax'
	     });
	   if ($('#jb-content').outerHeight(true) < 800) {
         $("#jb-content").css("height", "800px");
      }else{
         var g = $('#jb-content').outerHeight(true);
         $('#main').css("height", g);
         
      }
      /* alert($('#jb-content').outerHeight(true)); */
      // alert(document.getElementById("main").currentStyle.width);
   });
   
   
   $(document).ready(function(){  
         
        $(".topnav").click(function() {                    //마우스를 topnav에 오버시
         $(this).parent().find(".account").slideDown('normal').show();                   //subnav가 내려옴.
         $(this).parent().hover(function() {  
         }, function(){  
          $(this).parent().find(".account").slideUp('fast');                 //subnav에서 마우스 벗어났을 시 원위치시킴  
         });  
        });  
         
       });  
   

   $(document).ready(function(){           
        $(".message").click(function() {//마우스를 topnav에 오버시
         $("a span").hide();      
         $(this).parent().find(".sub").slideDown('normal').show();                   //subnav가 내려옴.
         $(this).parent().hover(function() {  
         }, function(){  
          $(this).parent().find(".sub").slideUp('fast');                 //subnav에서 마우스 벗어났을 시 원위치시킴  
         });  
        });  
        
        $(".alarm").click(function() {//마우스를 topnav에 오버시
            $(this).parent().find("a span").hide();      
            $(this).parent().find(".al").slideDown('normal').show();                   //subnav가 내려옴.
            $(this).parent().hover(function() {  
            }, function(){  
             $(this).parent().find(".al").slideUp('fast');                 //subnav에서 마우스 벗어났을 시 원위치시킴  
            });  
           });
       }); 
   
   
    $(document).ready(function(){  
         var check = "${memberinfo.checked}";
         
             $('.profile').each(function() {
               var tt = $(this).attr("id");
              if(check.indexOf(tt)!=-1){ 
                   $(this).attr("style","inline");
             } 
            });  
      });
      
    $(document).ready(function(){  
         
         var check = "${memberinfo.checked}"; //hasharr에 저장됨
         /* var hi = $(".pro").attr("id"); */
         
         $('.pro').each(function() {
             var eachh = $(this).attr("id");
             /* alert(eachh); */
              if(check.indexOf(eachh)!=-1){
                $(this).attr("type","font");
             } 
           });
         
          
         });


   /* $(window).load(function(){
       alert($('#jb-content').attr('height'));
   }); */


	/*
	   conphoto 는 contentInputForm.jsp 파일 안에 있는 파일 업로드 부분
	   이곳이 변경되면, 파일을 읽어 들이는 함수 동작
	 */

	$(function() {
		$("#conphoto").on('change', function() {
			readURL(this);
		});
	});

	/*
	   사진 미리 보기 부분
	   자바스립트의 FileReader() 를 통해 임시 경로에 사진을 업로드 함.
	   또한 attr 을 통해 사진의 크기를 강제로 조정함.
	 */

	function fileUploadPreview(thisObj, preViewer) {

		// 형식 체크
		if (!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value)) {
			alert("이미지 형식의 파일을 선택하십시오");
			$(thisObj).val('');
			return;
		}

		var preViewer = $('.preViewImg:last');//(typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
		var ua = window.navigator.userAgent;

		// 렌더링 버전 알아내기
		var rv = -1;

		// ie 브라우저이며 ie10 미만 버전
		if (ua.indexOf("MSIE") > -1 && rv < 10) {
			var img_path = "";
			if (thisObj.value.indexOf("\\fakepath\\") < 0) {
				img_path = thisObj.value;
			} else {
				thisObj.select();
				var selectionRange = document.selection.createRange();
				img_path = selectionRange.text.toString();
				thisObj.blur();
			}
			$(preViewer).css(
					'filter',
					"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi"
							+ "le://" + img_path + "', sizingMethod='scale')")
					.show();

			var cloneHtml = $('.photo_list:last').clone();
			cloneHtml.find('input').val('');
			cloneHtml.find('img').removeAttr('src', 'style').hide();
			$(thisObj).parents('.photoBox:first').append(cloneHtml);
		} else { // 그외 브라우저
			var reader = new FileReader();
			reader.readAsDataURL(thisObj.files[0]);
			reader.onload = function(e) {
				$('.preViewImg:last').attr('src', e.target.result).show();

				var cloneHtml = $('.photo_list:last').clone();
				cloneHtml.find('input').val('');
				cloneHtml.find('img').attr('src', '').hide();
				$(thisObj).parents('.photoBox:first').append(cloneHtml);
			}
		}
	}

	function tagCheck() {

		url = "TagCheck.hash?check=y";
		newwindow = window
				.open(
						url,
						"post",
						"toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");

	}

	function Message() {
		url = "MessageForm.hash";
		window
				.open(
						url,
						"post",
						"toolbar=no ,width=400 ,height=350,directories=no,status=yes,menubar=no,scrollbars=no");
	}

	function MessageList() {
		url = "MessageList.hash?check=y";
		window
				.open(
						url,
						"post",
						"toolbar=no ,width=400 ,height=350,directories=no,status=yes,menubar=no,scrollbars=no");
	}
/* 
	function alarmList() {
		url = "alarmlist.hash?check=y";
		window
				.open(
						url,
						"post",
						"toolbar=no ,width=500 ,height=400,directories=no,status=yes,menubar=no,scrollbars=no");
	} */

	$(document).ready(function() {
		if ($('#jb-content').outerHeight(true) < 800) {
			$("#jb-content").css("height", "800px");
		} else {
			var g = $('#jb-content').outerHeight(true);
			$('#main').css("height", g);

		}
		/* alert($('#jb-content').outerHeight(true)); */
		// alert(document.getElementById("main").currentStyle.width);
	});

	$(document).ready(function() {

		$(".topnav").click(function() { //마우스를 topnav에 오버시
			$(this).parent().find(".account").slideDown('normal').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {
			}, function() {
				$(this).parent().find(".account").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});
		});

	});

	$(document).ready(function() {
		$(".message").click(function() {//마우스를 topnav에 오버시
			$(this).parent().find("a span").hide();
			$(this).parent().find(".sub").slideDown('normal').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {
			}, function() {
				$(this).parent().find(".sub").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});
		});

		$(".alarm").click(function() {//마우스를 topnav에 오버시
			$(this).parent().find("a span").hide();
			$(this).parent().find(".al").slideDown('normal').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {
			}, function() {
				$(this).parent().find(".al").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});
		});
	});

	$(document).ready(function() {
		var check = "${memberinfo.checked}";

		$('.profile').each(function() {
			var tt = $(this).attr("id");
			if (check.indexOf(tt) != -1) {
				$(this).attr("style", "inline");
			}
		});
	});

	$(document).ready(function() {

		var check = "${memberinfo.checked}"; //hasharr에 저장됨
		/* var hi = $(".pro").attr("id"); */

		$('.pro').each(function() {
			var eachh = $(this).attr("id");
			/* alert(eachh); */
			if (check.indexOf(eachh) != -1) {
				$(this).attr("type", "font");
			}
		});

	});

	/* $(window).load(function(){
	    alert($('#jb-content').attr('height'));
	}); */
	function modal_close(){
		   var e = $.Event("keyup");
		   e.which = 27;
		   e.keyCode = 27;
		   $(document).trigger(e);
		}
</script>

</head>

<body style="background-color: #f5f7f8">


   <!-- navbar -->

   <div id=head>
      <ul class="navbar color1">
         <li class="small"><a href="Board.hash"
            class="padding-large margin-right"><h2>I N T E R H A S H #</h2></a></li>
         <li class="small">
         <div class="message">
         <a href="#" 
         class="padding-large margin-right"  title="Messages">
           <img src ="image/logo/message .png" onmouseover="this.src='image/logo/message2.png'" onmouseout="this.src='image/logo/message .png'" width="30px" height="30px"/>
           <span class="count badge right small circle pink">${messagecount}</span>
         </a>
         </div>
      
            <ul class="sub">
               <table>   
                  <tr>
                     <td>쪽지</td>
                     <td class="w3-right"><button id="buttonid" onclick="Message()">쪽지보내기</button></td>
                  </tr>
                  <tr class="left-align">
                     <td colspan="2"><c:forEach var="message"
                           items="${sessionScope.mesagelist}" begin="0" end="2">
                           <li><a 
                              href="#"
                              onclick="window.open('MessageView.hash?messageNum=${message.messageNum}','new','width=400 height=350');return false"><img
                                 src="image/logo/img_avatar5.png" class="left-align circle "
                                 width="15%" height="15%">${message.sendNickname}:
                                 ${message.messageContent}</a></li>
                        </c:forEach></td>
                  </tr>

                  <tr>
                     <Td colspan="2"><hr><button id="buttonid" onclick="MessageList()">모든 쪽지 보기</button></Td>
                  </tr>
               </table>
            </ul></li>
          
         <li class="small">

          <div class="alarm">
          <a href="#" 
          class="margin-right padding-large" title="Alarm">         
           <img src="image/logo/alarm1.png" onmouseover="this.src='image/logo/alarm.png'" onmouseout="this.src='image/logo/alarm1.png'" width="30px" height="30px"/>
           <span class="count badge right small circle pink">${count}</span></a>
          </div>
          <ul class="al">
               <table>   
                  <tr>
                     <td style="color:#8C8C8C;">Alarm</td>
                     
                  </tr>
                  <tr class="left-align">
                     <td colspan="2">
                     <c:forEach var="alarm"    items="${sessionScope.alarmlist}" begin="0" end="2">
                           <c:if test="${alarm.kinds == 0}">
                           <li><a href="ContentView.hash?connum=${alarm.connum}" class= "img_link">
                              <img  src="image/logo/img_avatar5.png" class="left-align circle " 
                                 width="15%" height="15%"><b>${alarm.comnick}</b>님이 회원님의 게시글에 댓글을 남겼습니다.</a></li>
                            </c:if>
                            
						  <c:if test="${alarm.kinds == 1}">
                           <li><a href="ContentView.hash?connum=${alarm.connum}" class= "img_link">
                              <img  src="image/logo/img_avatar5.png" class="left-align circle" 
                                 width="15%" height="15%"><b>${alarm.comnick}</b>님이 회원님의 게시글을 좋아합니다.</a></li>
                            </c:if>
                        </c:forEach></td>
                  </tr>

                  <tr>
                     <Td colspan="2"><hr><button id="buttonid" onclick="alarmList()">All Alarm</button></Td>
                  </tr>
               </table>
            </ul>
          
      </li>

         <li class="small right">
         <div class="topnav">   <a href="#" title="MyAccount"><img id ="profileImg" src='<c:url value="/upload/${sessionScope.profilePhoto}" />' class="circle" width="10%" height="10%">
           ${memberinfo.nickname}님</a></div>
            <ul class="account">
               <li><a href="UserInfoModifyForm.hash">회원정보수정</a></li>
               <li><a href="profile.hash">프로필수정</a></li>
               <li><a href="LogOut.hash">로그아웃</a></li>
            </ul></li>

         <div id="jb_search">
            <form method="post" action="Search.hash">
              <div style="float:left">
               <input type="text" name="searchname" />
               </div>
               <div style="float:right;">
                <input type="image" src ="image/logo/search.png" class="circle" width="30px" height="30px"/>
            </div>
            </form>
         </div>

      </ul>
   </div>


                  <!-- <input type = "text"><br>
	<!-- navbar -->

	<div id=head>
		<ul class="navbar color1">
			<li class="small"><a href="Board.hash"
				class="padding-large margin-right"><h2>I N T E R H A S H #</h2></a></li>
			<li class="small">
				<div class="message">
					<a href="#" class="padding-large margin-right" title="Messages">
						<img src="image/logo/message .png"
						onmouseover="this.src='image/logo/message2.png'"
						onmouseout="this.src='image/logo/message .png'" width="30px"
						height="30px" /> <span class="count badge right small circle pink">${messagecount}</span>
					</a>
				</div>

				<ul class="sub">
					<table>
						<tr>
							<td>쪽지</td>
							<td class="w3-right"><button id="buttonid"
									onclick="Message()">쪽지보내기</button></td>
						</tr>
						<tr class="left-align">
							<td colspan="2"><c:forEach var="message"
									items="${sessionScope.mesagelist}" begin="0" end="2">
									<li><a href="#"
										onclick="window.open('MessageView.hash?messageNum=${message.messageNum}','new','width=400 height=350');return false"><img
											src="image/logo/img_avatar5.png" class="left-align circle "
											width="15%" height="15%">${message.sendNickname}:
											${message.messageContent}</a></li>
								</c:forEach></td>
						</tr>

						<tr>
							<Td colspan="2"><hr>
								<button id="buttonid" onclick="MessageList()">모든 쪽지 보기</button></Td>
						</tr>
					</table>
				</ul>
			</li>

			<li class="small">

				<div class="alarm">
					<a href="#" class="margin-right padding-large" title="Alarm"> <img
						src="image/logo/alarm1.png"
						onmouseover="this.src='image/logo/alarm.png'"
						onmouseout="this.src='image/logo/alarm1.png'" width="30px"
						height="30px" /> <span class="count badge right small circle pink">${count}</span></a>
				</div>
				<ul class="al">
					<table>
						<tr>
							<td style="color: #8C8C8C;">Alarm</td>

						</tr>
						<tr class="left-align">
							<td colspan="2"><c:forEach var="alarm"
									items="${sessionScope.alarmlist}" begin="0" end="2">
									<c:if test="${alarm.kinds == 0}">
										<li><a href="ContentView.hash?connum=${alarm.connum}" class="img_link">
												<img src="image/logo/img_avatar5.png"
												class="left-align circle " width="15%" height="15%"><b>${alarm.comnick}</b>님이
												회원님의 게시글에 댓글을 남겼습니다.
										</a></li>
									</c:if>

									<c:if test="${alarm.kinds == 1}">
										<li><a href="ContentView.hash?connum=${alarm.connum}" class="img_link">
												<img src="image/logo/img_avatar5.png"
												class="left-align circle " width="15%" height="15%"><b>${alarm.comnick}</b>님이
												회원님의 게시글을 좋아합니다.
										</a></li>
									</c:if>
								</c:forEach></td>
						</tr>

						<tr>
							<Td colspan="2"><hr>
								<button id="buttonid" onclick="alarmList()">All Alarm</button></Td>
						</tr>
					</table>
				</ul>

			</li>

			<li class="small right">
				<div class="topnav">
					<a href="#" title="MyAccount"><img id="profileImg"
						src='<c:url value="/upload/${sessionScope.profilePhoto}" />'
						class="circle" width="10%" height="10%">
						${memberinfo.nickname}님</a>
				</div>
				<ul class="account">
					<li><a href="UserInfoModifyForm.hash">회원정보수정</a></li>
					<li><a href="profile.hash">프로필수정</a></li>
					<li><a href="LogOut.hash">로그아웃</a></li>
				</ul>
			</li>

			<div id="jb_search">
				<form method="post" action="Search.hash">
					<div style="float: left">
						<input type="text" name="searchname" />
					</div>
					<div style="float: right;">
						<input type="image" src="image/logo/search.png" class="circle"
							width="30px" height="30px" />
					</div>
				</form>
			</div>

		</ul>
	</div>


	<!-- <input type = "text"><br>
>>>>>>> b5180d80a45a24cd95f9c43f18b718046d954b87
               <input type = "password"><br>
               <input type = "button" value="회원가입"><input type="submit" value="로그인">
               <input type="button" value="정보수정" onclick="window.location.href='UserInfoModifyForm.hash';"> -->

	<%--                <table>
               <tr>
                  <c:if test="${memId!=null}">
                     <td align="left">${nickName}님</td>
                     <td align="right"><input type="button" value="로그아웃" onclick="window.location.href='LogOut.hash';"></td>
                     <td align="left"><input type="button" value="정보수정"   onclick="window.location.href='UserInfoModifyForm.hash';"></td>
                  </c:if>
               </tr>
               <c:if test="${sessionScope.memId=='admin@admin.com' }">
               <tr>
     
                  <td colspan=3 align="right"><input type="button" value="관리자페이지" onclick="window.location.href='ManagerPage.hash'"></td>
                  </tr>
               </c:if>
               
            </table> --%>


	<!-- main -->
	<div id="main">
		<div id=sidebar_content style="float: left; width: 75%">
			<div id="jb-sidebar">
				<!-- Profile -->
				<div class="box-shadow border-round white padding">
					<div class="container">
						<h4 class="center">My Profile</h4>
						<p class="center">
							<img src='<c:url value="/upload/${sessionScope.profilePhoto}" />'
								style="height: 130px; width: 130px" class="circle" alt="Avatar">
						</p>
						<hr color="#eee">
						<p>

							<i class="fa fa-pencil fa-fw margin-right text-theme"></i> <i
								class="pro"> ${memberinfo.nickname}</i>
						</p>
						<p>
							<i
								class="fa fa-birthday-cake fa-fw margin-right text-theme profile"
								id="birthday" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="birthday"
								value="${memberinfo.birthday}" readonly="readonly">
						</p>
						<p>
							<i
								class="fa fontawesome-phone fa-fw margin-right text-theme profile"
								id="phone" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="phone" value="${memberinfo.phone}"
								readonly="readonly">
						</p>
						<p>
							<i class="fa fa-home fa-fw margin-right text-theme profile"
								id="location" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="location"
								value="${memberinfo.location}" readonly="readonly">
						</p>

						<p>
							<i
								class="fa fontawesome-tint fa-fw margin-right text-theme profile"
								id="bloodgroups" style="display: none;"></i> <input
								type="hidden" name="pro" class="pro" id="bloodgroups"
								value="${memberinfo.bloodgroups}" readonly="readonly">
						</p>
						<p>
							<i
								class="fa fontawesome-book fa-fw margin-right text-theme profile"
								id="middleschool" style="display: none;"></i> <input
								type="hidden" name="pro" class="pro" id="middleschool"
								value="${memberinfo.middleschool}" readonly="readonly">
						</p>
						<p>
							<i
								class="fa fontawesome-book fa-fw margin-right text-theme profile"
								id="highschool" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="highschool"
								value="${memberinfo.highschool}" readonly="readonly">
						</p>
						<p>
							<i
								class="fa fontawesome-book fa-fw margin-right text-theme profile"
								id="university" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="university"
								value="${memberinfo.university}" readonly="readonly">
						</p>

						<p>
							<i
								class="fa fontawesome-briefcase fa-fw margin-right text-theme profile"
								id="job" style="display: none;"></i> <input type="hidden"
								name="pro" class="pro" id="job" value="${memberinfo.job}에서 근무"
								readonly="readonly">
						</p>

					</div>
				</div>
				<br>

				<!-- menu -->
				<div class="box-shadow border-round">
					<div class="accordion white border-round">
						<button onclick="myContent();"
							class="btn-block theme-l1 left-align border-round">
							<i class="fa fa-circle-o-notch fa-fw"></i> <b>내 글 보기</b>
						</button>
						<button onclick="updateContent();"
							class="btn-block theme-l1 left-align">
							<i class="fa fa-calendar-check-o fa-fw"></i> <b>최신 글 보기</b>
						</button>
						<button onclick="myFunction();"
							class="btn-block theme-l1 left-align border-round">
							<i class="fa fa-users fa-fw"></i> <b>인기 글 보기</b>
						</button>
						<script>
							function myContent() {
								location.href = "myContent.hash";
							}

							function updateContent() {
								location.href = "Board.hash";
							}
						</script>
					</div>
				</div>
				<br>

				<!-- Interests -->
				<div class="box-shadow border-round white small">
					<div class="container1">
						<p>
							<b>Interests</b> <a href="ModifyHash.hash"
								class="button button-pink"> 수 정 </a>
						</p>
						<p>

							<c:forEach var="tagname" items="${sessionScope.hashlist}">

								<!-- <li><a href='Board.hash?hash=사랑'>#사랑</a></li>
             <li><a href="Board.hash?hash=돈">#돈</a></li>
             <li><a href="Board.hash?hash=컴퓨터">#컴퓨터</a></li>
             <li><a href="Board.hash?hash=커피">#커피</a></li>
             <li><a href="Board.hash?hash=책">#책</a></li>
             <li><a href="Board.hash?hash=반려동물">#반려동물</a></li>
             <li><a href="Board.hash?hash=독도">#독도</a></li>
             <li><a href="Board.hash?hash=맥주">#맥주</a></li> -->
								<span class="tag font-small w3-theme-d1 border-round"> <a
									id="a" class="pro1" href="hashLike.hash?conhash=${tagname}">#${tagname}</a></span>
							</c:forEach>
						</p>
					</div>
				</div>

			</div>
			<div id="jb-content">
				<decorator:body />
			</div>
		</div>

		<div id="jb-right">
			<div style="width: 100%; height: 400px;">
				<div id="up" class="box-shadow border-round white padding"
					style="position: fixed;">
					<p>인기글</p>
					<c:forEach var="pop_con" items="${popcontent }">
						<div>
							<a style="display:inline;" href="ContentView.hash?connum=${pop_con.connum}"
								class="img_link" id="pop_link"> ${pop_con.content } </a>
								<span id="pop_pop">작성자 : ${pop_con.connickname} &nbsp;
								<label class="typicons-thumbsUp"></label>${pop_con.conlike}
								</span>
								<hr align="center" style="border: dashed 0.5px #D8D8D8;">
						</div>
					</c:forEach>
				</div>
			</div>
			<div style="width: 100%;">
				<div id="down" class="box-shadow border-round white padding"
					style="position: fixed;">
					<div style="height: 100%">
						<iframe style="height: 100%"
							src="http://192.168.50.42:8080/?id=${sessionScope.nickName }">
						</iframe>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="jb-footer" class="w3-theme-d3">
		<p>Copyright</p>
	</div>




</body>
</html>