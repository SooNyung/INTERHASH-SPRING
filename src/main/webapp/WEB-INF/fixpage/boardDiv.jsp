<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>

<%
    String cp = request.getContextPath();
%>

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

/* (function ($) {
	$.fn.simpleToggleBtn = function () {

	    var btns = $(this).find("button"), // 버튼 그룹 내 버튼들;
	        checkBox = $("input:checkbox");

	    btns.on("click", function () { // 버튼들 중 클릭한 버튼에 함수;
	        $(this).addClass("hide");
	        $(this).siblings("button").removeClass("hide");
	        // 첫번째 버튼 기준으로 input 요소 체크!
	        $(this).first().hasClass("hide") ? checkBox.attr("checked",true) : checkBox.attr("checked",false);
	    });
	}
	}(jQuery)); 
 */
$(document).ready(function(){
	$(".w3-theme-d1").click(function(){
		if($(this).hasClass("hide")){
			$(".w3-theme-d1").removeClass("hide");
			$(".w3-theme-d2").addClass("hide");
		}else{
			$(".w3-theme-d1").addClass("hide");
			$(".w3-theme-d2").removeClass("hide");
		}
	});
});
$(document).ready(function(){
	$(".w3-theme-d2").click(function(){
		if($(this).hasClass("hide")){
			$(".w3-theme-d2").removeClass("hide");
			$(".w3-theme-d1").addClass("hide");
		}else{
			$(".w3-theme-d2").addClass("hide");
			$(".w3-theme-d1").removeClass("hide");
		}
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
function like(num,String){

	url = "LikeCheck.hash?connum="+num+"&conhash="+String;
	newwindow=window.open(url,"post","toolbar=no ,width=200 ,height=100 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
}
function unlike(num,String){
	
	url = "Unlike.hash?connum="+num+"&conhash="+String;
	newwindow=window.open(url,"post","toolbar=no ,width=200 ,height=100 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
}
/* function toggle(){
	$("#btn_group").simpleToggleBtn();
} */

function modal_close(){
	var e = $.Event("keyup");
	e.which = 27;
	e.keyCode = 27;
	$(document).trigger(e);
}

</script>
<style>
@import url(http://weloveiconfonts.com/api/?family=Font Awesome);
[class*="Font Awesome-"]:before {
  font-family: 'Font Awesome', sans-serif;
}
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
	float:right;
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
.hide { display: none; }
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
.w3-theme-d3 {color:#fff !important; background-color:#607d8b !important}
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

function modifycon(connum){
	url="/INTERHASH/UpdateContent.hash?check=y&&connum="+connum
}

 function modify(comnum,connum){
	url="updateCommentForm.hash?check=y&&comnum="+comnum+"&&connum="+connum;
	window.open(url,"post","toolbar=no ,width=400 ,height=150,directories=no,status=yes,menubar=no,scrollbars=no");
} 

function report(connum){
	url="ReportForm.hash?check=y&connum="+connum;

	window.open(url,"post","toolbar=no ,width=500 ,height=200,directories=no,status=yes,menubar=no,scrollbars=no");
}

function reportCom(comnum){
	url="ReportFormCom.hash?check=y&&comnum="+comnum;
	window.open(url,"post","toolbar=no ,width=500 ,height=200,directories=no,status=yes,menubar=no,scrollbars=no");
}

function back(){
	location.href ="Board.hash";
	
}

function Map(){
	url="template2.hash";
	window.open(url,"post","toolbar=no ,width=600 ,height=500,directories=no,status=yes,menubar=no,scrollbars=no");
	}  

function insert(connum){
	var con = connum;
	var url ="<%=cp%>/InsertComment.hash";
	var texta = $('#comment_textarea').val();
	var params = "connum="+con+"&comcontent="+texta;
	
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			
		alert(${memId == args.data[0].email})
			$("#test_div *").remove();
			$("#comment_div *").remove();
		/* 	$('#test_div').append(
				'<input type="hidden" id="session_email" value= '+${memId}+' />'		
			); */
			for(var i=0;i<args.data.length;i++){
			
				$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time">'+args.data[i].commodifieddate+'</label></span><!--'+
						'--!><span id="align_right"><c:if test="${sessionScope.memId =='+ args.data[i].email +'}"><a href="deleteComment.hash?comnum=${comment.comnum}&connum=${comment.connum}">삭제</a><!--'+
						'--!><a onclick="modify('+args.data[i].comnum+','+${comment.connum}+')">수정</a></c:if><c:if test="${sessionScope.memId !='+args.data[i].email.trim()+'}"><!--'+
						'--!><a onclick="reportCom('+args.data[i].comnum+')">신고</a></c:if></span><br><!--'+
						'--!><div id="test"><textarea borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			} 
/* 			for(var i=0;i<args.data.length;i++){					
				$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time">'+args.data[i].commodifieddate+'</label></span><!--'+
						'--!><span id="align_right"><div id="rec_email'+i +''"></div><!--'+
						'--!></span><input id=in_'+i+'type=hidden value='+ args.data[i].email +'/><br><!--'+
						'--!><div id="test"><textarea borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>');
				alert(${memID} == $(input_id).val());
			var input_id = "#in_"+i;
			var email_id = "#rec_email"+i;
			if(${memID} == $(input_id).val()){
				$(email_id).append(
						'<a href="deleteComment.hash?comnum=${comment.comnum}&connum=${comment.connum}">삭제</a><!--'+
						'--!><a onclick="modify('+args.data[i].comnum+','+${comment.connum}+')">수정</a>'
						
				)			
			}else{
				$(email_id).append(
						'<a onclick="reportCom('+args.data[i].comnum+')">신고${memId},'+args.data[i].email.toString()+'</a>'
						
				)	
			
				
			} */
			
			
			
			
		}
		,error:function(e){
			alert(e.response.Text);
		}
		});
	}


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
				<span id="imageon" style="width: 50px; float: left;"> 
				 <img src='<c:url value="/image/logo/camera.jpg" />' onclick="$('.fileData:last').click();" /> 
				</span> 
				
				<span id="imageon" style="width: 50px; float: left;">
				<img src='<c:url value="/image/logo/place.PNG" />' onclick="Map()" /> 			
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
        <%-- <a href="ContentView.hash?connum=${con.connum}" class="img_link"> --%>
		<img id = "img" src='<c:url value="/upload/${con.photolist[0].realpath }" />'/>
		</a>  
    </div>

    <p>#${con.conhash}</p>
	</div>
	
<%--  	<div id="btn_group">
    <button type="button" id="btn1" class="w3-btn w3-theme-d1 w3-margin-bottom" onclick="javascript:like('${con.connum}')"><i class="fa fa-thumbs-up"></i> Like </button>
    <button type="button" id="btn2" class="w3-btn w3-theme-d2 w3-margin-bottom hide" onclick="javascript:unlike('${con.connum}')"> un_like </button>
    <input type="checkbox" class="hide"/>
    </div> --%>
    <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom" onclick="javascript:like('${con.connum}','${con.conhash}')"><i class="fa fa-thumbs-up"></i>  Like</button>
    <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom hide" onclick="javascript:unlike('${con.connum}','${con.conhash}')">  un-like</button>
    
    <button type="button" class="w3-btn w3-theme-d3 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
    
  	
	
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