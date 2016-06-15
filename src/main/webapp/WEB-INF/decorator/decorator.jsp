<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<style>
html,body,div{font-family: "Open Sans", sans-serif}
</style>
<head>
<decorator:head/>
    <meta charset="utf-8">
    <title>에벌레</title>
    <style>
     
      .w3-theme-l5 {color:#000 !important; background-color:#f5f7f8 !important}
	  .w3-theme-l4 {color:#000 !important; background-color:#dfe5e8 !important}
	  .w3-theme-l3 {color:#000 !important; background-color:#becbd2 !important}
	  .w3-theme-l2 {color:#000 !important; background-color:#9eb1bb !important}
	  .w3-theme-l1 {color:#fff !important; background-color:#7d97a5 !important}
	  .w3-theme-d1 {color:#fff !important; background-color:#57707d !important}
	  .w3-theme-d2 {color:#fff !important; background-color:#4d636f !important}
	  .w3-theme-d3 {color:#fff !important; background-color:#435761 !important}
	  .w3-theme-d4 {color:#fff !important; background-color:#3a4b53 !important}
	  .w3-theme-d5 {color:#fff !important; background-color:#303e45 !important}
      .padding{margin-top:50px; margin-left:30px;}
      .account-right{margin-right:0px; float:right;}
      .top{top:0; padding:0px; height:60px; margin-bottom:0px;}
      .w3-right{text-align:right}
      .navbar{top:0;list-style-type:none;margin:0;padding:0;float:left;
      		width:100%!important;
      		height:60px;
			position:static;
			text-decoration:none;
			text-align:center;
			display:block;
			
			}
      .hover-text:hover{color:#757575!important}
	  .margin-right{margin-right:8px}
      .color1{background-color:#4d636f}
      .color2{background-color:#3a4b53}
      .left-align{text-align:left!important}
      .font-size{font-size:18px!important}
      .small{display: inline!important; float:left;}
      .circle{border-radius:50%}
      .padding-large{padding:18px 5px 6px 5px}
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
      .border-round{border-radius:4px!important}
      .container{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;width:270px;}
      .container1{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;}
      .center{text-align:center}
      .text-theme{color:#607d8b !important}
      .accordian{width:100%;cursor:pointer}
      .accordian-content{cursor:auto;display:none;position:relative;width:100%;margin:0;padding:0}
      .btn-block{border:none;display:inline-block;outline:0;padding:6px 16px;vertical-align:middle;overflow:hidden;text-decoration:none!important;color:#fff;background-color:#000;text-align:center;cursor:pointer;white-space:nowrap;
		box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		width:100%;}
	  .theme-l1{color:#fff !important; background-color:#7d97a5 !important}
	  .left-align{text-align:left}
      .tag{background-color:#000;color:#fff;display:inline-block;padding-left:8px;padding-right:8px;text-align:center;}
      .font-small{font-size:8px}
	  .border{border:1px solid #ccc!important}
      .theme-border {border-color:#607d8b !important}
      .hover-theme:hover {color:#fff !important; background-color:#607d8b !important}
      .closebtn:hover,.w3-closebtn:focus{color:#000;text-decoration:none;cursor:pointer}
      .closebtn{text-decoration:none;float:right;font-size:24px;font-weight:bold;color:inherit;}

	  #main{
	  	top:0; padding:0px; height:780px; margin-bottom:0px;
	  }
	  
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
      	margin-top:20px;
      	margin-left:740px;
      	float: left;
      	width: 250px;
      	height:auto;
      /* 	border:1px solid #bcbcbc; */
      }
       #jb-content {
        width: 910px;
        height:300px;
        padding: 20px;
        margin-bottom: 50px;
        float: right;
        /* border: 1px solid #bcbcbc; */
      } 
      #jb-sidebar {
      	position:fixed;
      	height:800px;
        width: 300px;
        padding: 20px;
        padding-left:0px;
        margin-bottom: 0px;
        float: left;
   /*      border: 1px solid #bcbcbc; */
      }
      #jb-footer {
      	width:1250px;
        clear: both;
        padding: 40px 0px 0px 0px;
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
    	width: 230px;
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
    	background-color: #555;
	    color: white;
	}
	
	
	
	/* ----------------------------------------------------------------------- */

	
    </style>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script>
    $(function() {
        $("#conphoto").on('change', function(){
             readURL(this); 
        });
    });

    
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
	
/* 	function tagCheck() {

		url = "TagCheck.hash?check=y";
		newwindow=window.open(url,"post","toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");

	}
	
	function Message(){
	url="MessageForm.hash?check=y";
	window.open(url,"post","toolbar=no ,width=400 ,height=150,directories=no,status=yes,menubar=no,scrollbars=no");
	} 
	
    </script>
 
  </head>
  <body style="background-color:#f5f7f8">

<!-- navbar -->
<div class="top">
 <ul class="navbar color1 left-align large">
  <li class="small"><a href="#" class="padding-large color2 margin-right"><img src = "image/logo/interHash.png" width="100" height="25"></i></a></li>
  <li class="small"><a onclick="Message()" class="padding-large hover-white margin-right" title="Messages"><img src = "image/logo/message.PNG" width="30" height="25"></a></li>
  <li class="small"><a href="#" class="padding-large hover-white margin-right" title="Alarm"><img src = "image/logo/알림.PNG" width="30" height="25"></a></li>

    </script>
 
  </head>
  <body>
    <div id="jb-container">
      <div id="jb-header">

      	<div id="jb-logo">
	      	<img alt="로고" src='<c:url value="/image/logo/logo.jpg" />' onclick="window.location.href='Main.hash'">
      	</div>

      	<div id="jb_search">
      		<form method="post" action="Board.hash">
      			<input type="text" name="hash"/>
      			<input type="submit" value="검색"/>
      		</form>
      	</div>
      	
      	<li class="small">
      	<a href="#" class="padding-large hover-white account-right" title="MyAccount"><img src = "image/logo/i.PNG" width="30" height="30"></a>
<!--       	<div class = "dropdown-content white box-shadow">
      		<a href="#">회원정보수정</a>
      		<a href="#">프로필수정</a>
      		<a href="#">로그아웃</a>
      	</div> -->
      	</li>
		
<%--       	<div id="jb-logon">
      		<form>
      			<!-- <input type = "text"><br>
      			<input type = "password"><br>
      			<input type = "button" value="회원가입"><input type="submit" value="로그인">
      			<input type="button" value="정보수정" onclick="window.location.href='UserInfoModifyForm.hash';"> -->
      			
      			<table>
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
					
				</table>
				
      		</form>
      	</div> --%>
      	</ul>
      	<br>
      </div>
      
      
      <!-- main -->
      <div id="main">
      
      <div id="jb-content"> 
      <decorator:body/>
      </div>
      
      
      <div id="jb-sidebar">
      <!-- Profile -->
       <div class="box-shadow border-round white">
        <div class="container">
         <h4 class="center">My Profile</h4>
         <p class="center"><img src="image/logo/사람.PNG"  style="height:106px;width:106px" alt="Avatar"></p>
        <hr>
         <p><i class="fa fa-pencil fa-fw margin-right text-theme"></i> Designer, UI</p>
         <p><i class="fa fa-home fa-fw margin-right text-theme"></i> London, UK</p>
         <p><i class="fa fa-birthday-cake fa-fw margin-right text-theme"></i> April 1, 1988</p>
        </div>
      </div>
      <br>
      
      <!-- menu -->
      <div class="box-shadow border-round">
        <div class="accordion white">
          <button onclick="myFunction();" class="btn-block theme-l1 left-align"><i class="fa fa-circle-o-notch fa-fw margin-right"></i> 내 글 보기</button>     
          <button onclick="myFunction();" class="btn-block theme-l1 left-align"><i class="fa fa-calendar-check-o fa-fw margin-right"></i> 최신 글 보기</button>     
          <button onclick="myFunction();" class="btn-block theme-l1 left-align"><i class="fa fa-users fa-fw margin-right"></i> 인기 글 보기</button>
        <script>
        	function myFunction(){
        		alert("버튼1을 누르셨습니다.");
        	}
        </script>
        </div>      
      </div>
       <br>
      
      <!-- Interests --> 
      <div class="box-shadow border-round white small">
        <div class="container1">
          <p>Interests</p>
          <p>
          <%--  <ul>
        	<c:forEach var="tagname" items="${memberHash}">
       		 <li><a href="Board.hash?hash=${tagname}">#${tagname}</a></li>
         	 <!-- <li><a href='Board.hash?hash=사랑'>#사랑</a></li>
          	<li><a href="Board.hash?hash=돈">#돈</a></li>
          	<li><a href="Board.hash?hash=컴퓨터">#컴퓨터</a></li>
          	<li><a href="Board.hash?hash=커피">#커피</a></li>
          	<li><a href="Board.hash?hash=책">#책</a></li>
          	<li><a href="Board.hash?hash=반려동물">#반려동물</a></li>
          	<li><a href="Board.hash?hash=독도">#독도</a></li>
          	<li><a href="Board.hash?hash=맥주">#맥주</a></li> -->
          	</c:forEach>
        	</ul> --%>
            <span class="tag font-small w3-theme-d5">News</span>
            <span class="tag font-small w3-theme-d4">W3Schools</span>
            <span class="tag font-small w3-theme-d3">Labels</span>
            <span class="tag font-small w3-theme-d2">Games</span>
            <span class="tag font-small w3-theme-d1">Friends</span>
            <span class="tag font-small w3-theme">Games</span>
            <span class="tag font-small w3-theme-l1">Friends</span>
            <span class="tag font-small w3-theme-l2">Food</span>
            <span class="tag font-small w3-theme-l3">Design</span>
            <span class="tag font-small w3-theme-l4">Art</span>
            <span class="tag font-small w3-theme-l5">Photos</span>
          </p>
        </div>
      </div>
      <br>
    </div>
    </div><!-- main화면 -->   
      
      <div id="jb-footer" class=" w3-theme-d3">
        <p>Copyright</p>
      </div>
      
     
  </body>
</html>