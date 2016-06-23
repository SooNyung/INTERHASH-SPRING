<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<link rel="stylesheet" href='<c:url value="modal/magnific-popup.css"/>' >


<script src='<c:url value="modal/jquery.magnific-popup.min.js"/>'></script>

<c:if test ="${sessionScope.memId==null}">
<script>
alert("비밀번호가 틀립니다.");
history.go(-1);
</script>
</c:if>
<script>
$(function() {
    $("#conphoto").on('change', function(){
         readURL(this); 
    });
  	$('.img_link').magnificPopup({
  		type:'ajax'
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
function tagCheck() {

	url = "TagCheck.hash?check=y";
	newwindow=window.open(url,"post","toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
}
function like(num){
	
	url = "LikeCheck.hash?connum="+num;
	newwindow=window.open(url,"post","toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
}
function modal_close(){
	var e = $.Event("keyup");
	e.which = 27;
	e.keyCode = 27;
	$(document).trigger(e); 
}
</script>
<style type="text/css">
	.background-color{color:#000 !important; background-color:#f5f7f8 !important}
	#board_div{
		width:500px;
		height:230px;
/* 		 background-color: black;  */
		
		padding:10px;
		margin:10px;
	}
	
	
	#board_img{
		width:270px;
		height:280px;
		/* background-color: green; */
		float:left;
		/* border:2px solid; */
		margin:auto;
	}
	#img{
		width: 180px;
		height:150px;
		margin:auto;
	}
	#board_main{
		width:470px;
		height:310px;
		/* background-color: yellow; */
		float:right;
		/*  border:1px solid;  */
		margin:auto;
	}
	#board_subject{
		width:470px;
		height:50px;
		 border:1px solid #bcbcbc; 
		margin:auto;
		/* background-color: blue; */
	}
	#board_content{
		width:470px;
		height:200px;
		border:1px solid #bcbcbc; 
		margin:auto;
	}
	#board_like{
		width:470px;
		height:50px;
		/* border:2px solid; */
		margin:auto;
	}
	
	#like{
		position: relative;
	}
	#commnet{
	}
	#like_img{
		height:35px;
		width:43px;
		/* border:1px solid; */
		margin:5px;
		float:left;
	}
	#like_text{
		height:35px;
		width:70px;
		/* border:1px solid; */
		margin:5px;
		float:left;
		text-align: center;
	}
	#commnet_img{
		height:35px;
		width:43px;
	/* 	border:1px solid; */
		margin:5px;
		float:left;
	}
	#commnet_text{
		height:35px;
		width:70px;
		/* border:1px solid; */
		margin:5px;
		float:left;
		text-align: center;
	}
	#board_subject_click{
		height:50px;
		width:130px;
		position: relative;
		background-color: white;
		float:left;
		left:-130px;
		opacity:0.5;
	}
	#board_commnet_click{
		height:50px;
		width:130px;
		position: relative;
		left:5px;
		top:-45px;
		float:left;
		background-color: white;
		opacity:0.5;
	}
	p{
		
		font-size: 18px;
		margin:5px auto;
	}
	
	
	
	#writeform{
		width:700px;
		height:50px;
		margin: 0px;
		/* border:1px solid; */
	}
	
	#textfield {
	width: 465px;
	height: 80px;
	background: #ffffff;
}

#preview {
	height: 80px;
	background: #ffffff;
}

#imageon {
	height: 30px;
	background: #ffffff;
}

#taglist {
	height: 30px;
	background: #ffffff;
}

#submit {
	
	background: #607d8b;
}

#button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .4em 2em .50em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .4em; 
	-moz-border-radius: .4em;
	border-radius: .4em; 
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
}

.photoBox .fileData {
	display: none;
}

.photoBox .preViewImg {
	width: 80px;
	height: 80px;
	text-align: center;
	border: 1px solid silver; 
}

.custom_checkbox {
	position: relative;
	margin: 45px 0 0 20px;
}

.custom_checkbox label {
	position: absolute;
	left: 0;
	height: 20px;
	padding: 4px 0 0 25px;
	background: url('images/custom_checkbox2.png') no-repeat;
}

.custom_checkbox input {
	type ="checkbox": checked+ label{background-position:0 -25px;
}
#blah_img{
	width:100px;
	height:100px;
	overflow: auto;
}

 .box-shadow{box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important;margin-top:0px;}
 .border-round{border-radius:4px!important}
 .container{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;}
.w3-col.m12{width:100px}
html,body,h6{font-family: "Open Sans", sans-serif}
.w3-theme {color:#fff !important; background-color:#607d8b !important}
.white{color:#000!important;background-color:#fff!important;}

.margin-right{margin-right:8px}
.circle{border-radius:50%}
.left-align{align:left;}
.right-align{float:left; margin-left:400px; margin-top:0px;}
.opacity{color:#eee}

.w3-theme-d1 {color:#fff !important; background-color:#57707d !important}
.w3-theme-d2 {color:#fff !important; background-color:#4d636f !important}
.container{vertical-align: text-bottom; line-height:30px; }
.w3-row-padding{margin-left:30px; width:300px; }
.write{width:300px; height:500px;}
.content{width:300px; height:700px;}
hr{border-top:1px solid; background-color:#eee;}
.w3-btn{pointer-events:none;
box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}
</style>


<script>
$(function(){
	$(window).scroll(function(){
		if( $(window).scrollTop() == ($(document).height() -  ($(window).height() +$(window).height()))){
			alert("끝!");
		}
	});  
}); 
</script>
</head>
<body>
<div>
          <div id="board_div" class="box-shadow border-round white">
            <div class="container w3-padding">
           <!--    <h6 class="opacity">I love it!! InterHash~♡</h6> -->
            <div id="writeform" border="1">
      <form action="ContentInputPro.hash" name="writeForm" method="post" enctype="multipart/form-data"> 
		<div id="wrap" style="width: 500px; ">
			<textarea id="textfield" name="content" placeholder="내용을 입력하세요."></textarea>
			<div class="photoBox" style="height: 100px; width: 100px;">
				<input class='fileData' id = "conphoto" name="conphoto" type="file"/> 
					<div id="blah_img">
						<img id="blah" src="" alt="no image"/>
					</div>
			</div>
			<div style="clear: both;"></div>
			<div id="sub">
				<span id="imageon" style="width: 100px; float: left;"> 
				 <img src='<c:url value="/image/logo/camera.jpg" />' onclick="$('.fileData:last').click();" /> 
				
				</span> 
				<span id="taglist" style="width: 300px; float: left;">
					<input type="text" name="tag" size="7" readonly>
					<input type="button" value="Tag" onClick="tagCheck()">
				</span> 
				 <span id="submit"> 
			<!-- 	  <input type="submit" id="button" value="submit"/>  -->
			<input type="image" src="image/logo/post.PNG"> 
			
				 </span>
			</div>
		</div>
	</form>
	</div>
              
            </div>
          </div>



<form method='post' action='ContentView.hash'>
<c:forEach var="con" items= '${content}' >
<input type="hidden" name="connum" value="${con.connum}">
<div id="board_div" class="container box-shadow border-round white">
<table width="100%">
<tr>  
<td width="10%"><img src="image/logo/사람.PNG" alt="Avatar" class="left-align circle" style="width:50px"></td>
<td width="65%"><b>${con.connickname}</b></td>
<td width="35%"><b class="right-align opacity"><font color="#b2b2b2">${con.conmodifieddate}</font></b></td>
</tr>
</table>
	<hr color="#eee">
	<div class="content">
	<div class="write">${con.content}</div>

	<div class="w3-row-padding">
        <a href="ContentView.hash?connum=${con.connum}" class="img_link">
		<img id = "img" src='<c:url value="/upload/${con.photolist[0].realpath }" />'/>
		</a>  
    </div>
    
    <p>#${con.conhash}</p>
	</div>
    <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom" onclick="javascript:like('${con.connum}')"><i class="fa fa-thumbs-up"></i>  Like</button> 
    <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 

	<%-- <div id="board_img">
	<a href="ContentView.hash?connum=${con.connum}">
		<img id = "img" src='<c:url value="/upload/${con.photolist[0].realpath }" />' />
		</a>
	</div>
	<div id ="board_main">
	<a href="ContentView.hash?connum=${con.connum}">
	
		 <div id="board_subject">
			<div id="subject">
			<label>'${con.connickname}'</label>
			</div>
			<div id="time">
			<label>'${con.conmodifieddate}'</label>
			</div>
		</div>
		<div id="board_content">
			<label>'${con.content}'</label>
			<br/>
			<label> ${con.conhash} </label>

		</div>
 		<div id="board_like">
			<div id="like">
				<div id="like_img">
				</div>
				<div id="like_text">
					<p>123</p>
				</div>
				<div id="like_alpha">
				</div>
			</div>
			<div id="commnet">
				<div id="commnet_img">
				</div>
				<div id="commnet_text">
				
					
				</div>
				<P><a href="ContentView.hash?connum=${con.connum}"></a></P>
			</div>
		</div>  
		</a>
	</div> --%>
</div>
</c:forEach>
</form>
</div>
</body>
</html>