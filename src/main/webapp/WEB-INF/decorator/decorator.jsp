<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<style>
html,body,div{font-family: "Open Sans", sans-serif; font: 400 0.875rem/1.5 "Open Sans", sans-serif;}
body{padding:0px;margin:0px;width:100%;height:100%;}
</style>
<head>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<decorator:head/>
    <meta charset="utf-8">
    <title>에벌레</title>
    <style>
     
      .w3-theme-l5 {color:#000 !important; background-color:#f5f7f8 !important}
	  .w3-theme-l4 {color:#000 !important; background-color:#dfe5e8 !important}
	  .w3-theme-l3 {color:#000 !important; background-color:#becbd2 !important}
	  .w3-theme-l2 {color:#000 !important; background-color:#9eb1bb !important}
	  .w3-theme-l1 {color:#fff !important; background-color:#7d97a5 !important}
	  .w3-theme-d1 {color:#fff !important; background-color:#cccccc !important}
	  .w3-theme-d2 {color:#fff !important; background-color:#4d636f !important}
	  .w3-theme-d3 {color:#fff !important; background-color:#ffcccc !important}
	  .w3-theme-d4 {color:#fff !important; background-color:#3a4b53 !important}
	  .w3-theme-d5 {color:#fff !important; background-color:#303e45 !important}
      .padding{margin-top:50px; margin-left:30px;}
      .account-right{margin-left:650px; float:left;}
      .w3-right{text-align:right}
      .navbar{top:0;list-style-type:none; float:left;
      		width:100%;
      		height:60px;
			position:absolute;
			text-decoration:none;
			text-align:center;
			display:block;
			
			}
    
	  .margin-right{margin:10px 0px 0px 10px;}
      .color1{background-color:#FFCCCC}
      .color2{background-color:#FFCCCC}
      .left-align{text-align:left!important}
      .font-size{font-size:18px!important}
      .small{display: inline!important; float:left;}
      .circle{border-radius:50%}
      .padding-large{padding:10px 5px 0px 5px;}
      .closebtn.hover-text.dropdown-hover.hover-white{-webkit-transition:background-color .3s,#white .15s,box-shadow .3s,opacity 0.3s;transition:background-color .3s,#white .15s,box-shadow .3s,opacity 0.3s}
      .btn-block.accordian-content.dropdown-hover{min-width:100%;
		display:block;z-index:1;
		cursor:auto;color:#000;background-color:#fff;display:none;position:absolute;min-width:160px;margin:0;padding:0;
		padding:6px 16px;display:block;
		background-color:#ccc;
		position:relative;
		text-decoration:none!important;}
	  .dropdown-hover{display:inline-block;cursor:pointer}
      .white{color:#000!important;background-color:#fff!important;}
      .box-shadow{box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important;margin-top:0px;}
      .border-round{border-radius:7px!important}
      .container{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;width:270px;}
      .container1{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px; width:320px;}
      .center{text-align:center}
      .text-theme{color:#607d8b !important}
      .accordian{width:100%;cursor:pointer}
      .accordian-content{cursor:auto;display:none;position:relative;width:100%;margin:0;padding:0}
      .btn-block{border:none;display:inline-block;outline:0;padding:6px 16px;vertical-align:middle;overflow:hidden;text-decoration:none!important;color:#fff;background-color:#000;text-align:center;cursor:pointer;white-space:nowrap;
		box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		width:100%;}
	  .theme-l1{color:#fff !important; background-color:#FFCCCC !important}
	  .left-align{text-align:left}
      .tag{display:inline-block; padding-left:1px; padding-right:1px; text-align:center; margin:0px 10px 10px 0px;}
      
      .font-small{font-size:20px}
	  .border{border:1px solid #ccc!important}
      .theme-border {border-color:#607d8b !important}
      .hover-theme:hover {color:#fff !important; background-color:#607d8b !important}
      .closebtn:hover,.w3-closebtn:focus{color:#000;text-decoration:none;cursor:pointer}
      .closebtn{text-decoration:none;float:right;font-size:24px;font-weight:bold;color:inherit;}


	  #main{width:100%;}


      #jb-container {
        width: 2000px;
        padding-left: 0px;
        float:left;
        /* border: 1px solid #bcbcbc; */
      }
      
      #jb-header {
        padding: 20px;
        height: 120px;
        margin-bottom: 20px;
        
       /*  border: 1px solid #bcbcbc; */
      }
      #jb_search{
      	position:absolute;
      	margin-top:20px;
      	margin-left:1000px;
      	float:left;
      	width: 250px;
      	height:auto;
      /* 	border:1px solid #bcbcbc; */
      }
       #jb-content {
        width: 50%;
        padding: 0px;
        margin-left:350px;
        margin-bottom: 50px;
        margin-top:50px;
        float: left;
        /* border: 1px solid #bcbcbc; */
      } 
      #jb-sidebar {
      	position:absolute;
      	height:600px;
        width: 25%;
        margin-top:60px;
        padding-left:15px;   	
        float: left;
   /*      border: 1px solid #bcbcbc; */
      }
      #jb-footer {
      	width:100%;
		height:60px;
		clear: both;
/* 	position:absolute;
	height:60px;
	clear: both;
/*	
 	position:absolute;
	bottom:0;
	left:0;
	*/
        /* border: 1px solid #bcbcbc; */
      }
      #jb-logo{
      	float:left;
      	width:401px;
      	height:auto;
      }
      #jb-logon{
      	float:right;
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
    	background-color: #b2b2b2;
	    
	}
	

	
	/* ----------------------------------------------------------------------- */

 ul.menu li{ 
	     float: right;
		 width: 179px;
		 height: 48px;
		 background-color: #555;
		 position: relative;
		 }
      ul.menu li a{
	     display: block;
		 width: 100%;
		 height: 100%;
		 line-height: 48px;
		 text-indent: 30px;
		 font-weight: bold;
		 color: #eee;
		 text-decoration: none;
		 }
      ul.menu li a:hover{
	     background-color: #333;
		 }
      ul.menu li ul.sub{
	     position: absolute;
		 }
      ul.menu{
	     zoom: 1;
		 }
      ul.menu:after{
	     height: 0;
		 visibility: hidden;
		 content: ".";
		 display: block;
		 clear: both;
		 }
 		 
 /* 	 .navbar li .account{background: rgb(255,240,245);
				display:none; 
				height:200;
				padding:0px;
				margin:0px;
				margin-left:650px;
				border:0px;
				position:absolute;
				width:200px;
				z-index:500;
				}   */ 
	
				
	.navbar li .message{background: rgb(255,240,245);
				display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
				height:250px;
				padding:0px;
				margin:0px;
				margin-left:0px;
				border:0px;
				position:absolute;
				width:200px;
				overflow:hidden;
				z-index:500;}
				
	.navbar li:hover ul{display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */}
	
	
	.badge{background-color:#000;color:#fff;display:inline-block;padding-left:5px;padding-right:5px;text-align:center; margin:0px 0px 0px 5px; 
			border-radius:70%;}
	.right{float:right; margin-right:250px;}
	.green{background-color:#4CAF50!important}
		
	#a:link {text-decoration: none; color: #f9ffff;}
	#a:visited {text-decoration: none; color: #f9ffff;}
	#a:active {text-decoration: none; color: #f9ffff;}
	#a:hover {text-decoration: none; color: #f9ffff; background-color:#ff6088; border-radius:7px;} 

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
     function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        	reader.onload = function (e) {
 
                 $('#blah').attr('src', e.target.result); 
                 $('#blah').attr('height', '100px');
                 $('#blah').attr('width', '100px');
            }

          reader.readAsDataURL(input.files[0]);
        }
    } 
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
		newwindow=window.open(url,"post","toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");

	}

	function Message(){
	url="MessageForm.hash?check=y";
	window.open(url,"post","toolbar=no ,width=400 ,height=150,directories=no,status=yes,menubar=no,scrollbars=no");
	} 
	

	$(document).ready(function(){
		if ($('#jb-content').outerHeight(true) < 1000){
			$("#jb-content").attr("height" , "1000px");
		}
	     /* alert($('#jb-content').outerHeight(true)); */ 
	   // alert(document.getElementById("main").currentStyle.width);
	});
	/* $(window).load(function(){
	    alert($('#jb-content').attr('height'));
	}); */
	

    </script> 

<!--      <script type="text/javascript">
         $(function(){
	     $(".sm").hide();
	     /*
	     	hover 이벤트
	     	mouseover 와 mouseout 시의 이벤트 정의
	     	첫번째는 mouseover, 두번째는 mouseout
	     	또한 slideDown과 slideUp은 toggle로 대체 가능
	     	$(".small").slideToggle("fast");
	     	콜백함수의 조건절 없이 하나의 콜백함수로 표현가능
	     	
	     */
		 $(".small").hover(
			function(){ 
				$(".small:not(:animated)",this).slideDown("fast");},
			function(){
			   	$(".small",this).slideUp("fast");
			});
      });	
   </script> -->

  </head>
  <body style="background-color:#f5f7f8">

<!-- navbar -->

<div>
 <ul class="navbar color1">
  <li class="small"><a href="Board.hash" class="padding-large margin-right"><b>I N T E R H A S H #</b></a></li>
  <li class="small"><a href="messageView.hash" class="padding-large margin-right" title="Messages"><i class ="fa fa-envelope"></i><span class="badge right small green">${messagecount}</span> </a>
   <ul class="message">
   <table><tr><td>쪽지</td><td class="w3-right"><a href="MessageForm.hash">쪽지보내기</a></td></tr>
   			<tr class="left-align"><td colspan="2"><c:forEach var="message" items="${mesagelist}" begin="0" end="2">
			<li><a href="messageView.hash?messageNum=${message.messageNum}"><img src="image/logo/img_avatar5.png" class="left-align circle " width="15%" height="15%">${message.sendNickname} ${message.messageContent}</a></li>
			</c:forEach>
			</td></tr>
			
			<tr><Td colspan="2"><a href="#"><hr>모든 쪽지 보기</a></Td></tr>
	</table>
	</ul>
  </li> 
  <li class="small"><a href="#" class="margin-right padding-large left-align" title="Alarm"><i class="fa fa-bell"></i></a></li>

	<li class="small right"><a href="#"  class="padding-large" title="MyAccount"><img src="image/logo/사람.PNG" class="circle" width="30%" height="30%">${nickName}님</a>	
 		<ul class="account">
			<li><a href="UserInfoModifyForm.hash">회원정보수정</a></li>
			<li><a href="#">프로필수정</a></li>
			<li><a href="LogOut.hash">로그아웃</a></li>
		</ul> 
		
	</li>

      	<div id="jb_search">
      		<form method="post" action="Board.hash">
      			<input type="text" name="hash"/>
      			<input type="submit" value="검색"/>
      		</form>
      	</div>

</ul>
</div>
	      			<!-- <input type = "text"><br>
      			<input type = "password"><br>
      			<input type = "button" value="회원가입"><input type="submit" value="로그인">
      			<input type="button" value="정보수정" onclick="window.location.href='UserInfoModifyForm.hash';"> -->
      			
<%--       			<table>
					<tr>
						<c:if test="${memId!=null}">
							<td align="left">${nickName}님</td>
							<td align="right"><input type="button" value="로그아웃" onclick="window.location.href='LogOut.hash';"></td>
							<td align="left"><input type="button" value="정보수정"	onclick="window.location.href='UserInfoModifyForm.hash';"></td>
						</c:if>
      			</tr>
      			<c:if test="${sessionScope.memId=='admin@admin.com' }">
      			<tr>
     
      				<td colspan=3 align="right"><input type="button" value="관리자페이지" onclick="window.location.href='ManagerPage.hash'"></td>
      				</tr>
      			</c:if>
					
				</table> --%>

    <br>

      
      <!-- main -->
   <div id = "main">
      
      <div id="jb-content"> 
       <decorator:body/>      
      </div>
      
      <div id="jb-sidebar">
      
      <!-- Profile -->
       <div class="box-shadow border-round white">
        <div class="container">
         <h4 class="center">My Profile</h4>
         <p class="center"><img src="image/logo/사람.PNG"  style="height:106px;width:106px" alt="Avatar"></p>
        <hr color="#eee">
         <p><i class="fa fa-pencil fa-fw margin-right text-theme"></i> ${memberinfo.nickname}</p>
         <p><i class="fa fa-home fa-fw margin-right text-theme"></i> London, UK</p>
         <p><i class="fa fa-birthday-cake fa-fw margin-right text-theme"></i>${memberinfo.birthday}</p>      
        </div>
      </div>
      <br>
      
      <!-- menu -->
      <div class="box-shadow border-round">
        <div class="accordion white border-round">
          <button onclick="myFunction();" class="btn-block theme-l1 left-align border-round"><i class="fa fa-circle-o-notch fa-fw margin-right"></i> 내 글 보기</button>     
          <button onclick="myFunction();" class="btn-block theme-l1 left-align"><i class="fa fa-calendar-check-o fa-fw margin-right"></i> 최신 글 보기</button>     
          <button onclick="myFunction();" class="btn-block theme-l1 left-align border-round"><i class="fa fa-users fa-fw margin-right"></i> 인기 글 보기</button>
        <script>
        	function myFunction(){
        		alert("버튼을 누르셨습니다.");
        	}
        </script>
        </div>      
      </div>
       <br>
      
      <!-- Interests --> 
      <div class="box-shadow border-round white small">
        <div class="container1">
          <p><b>Interests</b> <input type="button" onclick="javascript:window.location='ModifyHash.hash'" value="hashtag 수정"></p>
          <p>
            
        	<c:forEach var="tagname" items="${hashlist}">
       		
         	 <!-- <li><a href='Board.hash?hash=사랑'>#사랑</a></li>
          	<li><a href="Board.hash?hash=돈">#돈</a></li>
          	<li><a href="Board.hash?hash=컴퓨터">#컴퓨터</a></li>
          	<li><a href="Board.hash?hash=커피">#커피</a></li>
          	<li><a href="Board.hash?hash=책">#책</a></li>
          	<li><a href="Board.hash?hash=반려동물">#반려동물</a></li>
          	<li><a href="Board.hash?hash=독도">#독도</a></li>
          	<li><a href="Board.hash?hash=맥주">#맥주</a></li> -->   
            <span class="tag font-small w3-theme-d1 border-round">
            <a id ="a" href="Board.hash?hash=${tagname}" >#${tagname}</a></span>    
            </c:forEach>            
          </p>
        </div>
      </div>
      <br>
      
    </div>
   </div>
       <div id="jb-footer" class="w3-theme-d3">
        <p>Copyright</p>
      </div> 

      
     
  </body>
</html>