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
/* $(function(){
   $(".like").click(function(){
      var index = $(".like").index(this);
      if($(".like:eq("+index+")").hasClass("hide")){
         $(".like:eq("+index+")").removeClass("hide");
         $(".unlike:eq("+index+")").addClass("hide");
      }else{
         $(".like:eq("+index+")").addClass("hide");
         $(".unlike:eq("+index+")").removeClass("hide");
      }
   });
});
$(function(){
   $(".unlike").click(function(){
      var indexu = $(".unlike").index(this);
      if($(".unlike:eq("+indexu+")").hasClass("hide")){
         $(".unlike:eq("+indexu+")").removeClass("hide");
         $(".like:eq("+indexu+")").addClass("hide");
      }else{
         $(".unlike:eq("+indexu+")").addClass("hide");
         $(".like:eq("+indexu+")").removeClass("hide");
      }
   });
}); */

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
       reader.onload = function (e) {

             $('#blah').attr('src', e.target.result); 
             $('#blah').attr('height', '80px');
             $('#blah').attr('width', '120px');
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

function tagCheckUpdate() {

	url = "TagCheckUpdate.hash?check=y";
	newwindow=window.open(url,"post","toolbar=no ,width=650 ,height=700 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
}

function like(num,String){
	var select_id = "${sessionScope.conlike}";//'#'+num+"like_bn";
	var like_cnt = select_id+1;//$(select_id).text();
	alert(select_id);
	
	//$(select_id).text(like_cnt+1);
	
	alert(like_cnt);
	url = "LikeCheck.hash?connum="+num+"&conhash="+String;
	newwindow=window.open(url,"post","toolbar=no ,width=200 ,height=100 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
	//location.href ="LikeCheck.hash?connum="+num+"&conhash="+String; //보현test중
}

function unlike(num,String){
 	var select_id = "${sessionScope.conlike}";
	var like_ctn = select_id-1;
	alert(select_id);
	alert(like_ctn); 
	url = "Unlike.hash?connum="+num+"&conhash="+String;
	newwindow=window.open(url,"post","toolbar=no ,width=200 ,height=100 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
	//location.href ="Unlike.hash?connum="+num+"&conhash="+String; //보현test중
}

function modal_close(){
   var e = $.Event("keyup");
   e.which = 27;
   e.keyCode = 27;
   $(document).trigger(e);
}

</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://weloveiconfonts.com/api/?family=Font Awesome);
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
[class*="Font Awesome-"]:before {
  font-family: 'Font Awesome', sans-serif;
}

.pro1 {
/*    font-size: 16px; */
   border: 0px;
   font-family: 'Nanum Pen Script', serif;
   font-size:20px;
   color:#797D7F;
}
   .background-color{color:#000 !important; background-color:#f5f7f8 !important}
   #board_div{
      width:115%;
      height:230px;
/*        background-color: black;  */
      
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
   /*    border:1px solid; */
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

a {
  color: #797D7F;
  outline: 0;
  text-decoration: none;
}

#View {
  color: #797D7F;
  outline: 0;
  /* text-decoration: none; */
  font-weight: bold;
}

/* #View:hover{
	color:#ffcccc;
} */
a:focus, a:hover {
 /*  text-decoration: underline;  */
  color:#ffcccc;
  
}

 .box-shadow{box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important;margin-top:0px;}
 .border-round{border-radius:4px!important}
 .container{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;}
.w3-col.m12{width:100px}
html,body,h6{
/* font-family: "Open Sans", sans-serif */
font-family: 'Nanum Pen Script', serif;
}
body{
font-size: 20px;
}
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
#maptitle{border:0px; margin-top:100px;}
.w3-btn{pointer-events:none;
box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}

.na{font-weight:bold; font-size:15px;}
</style>

<script>
$(function(){
   $(window).scroll(function(){
      if( $(window).scrollTop() == ($(document).height() -  ($(window).height() +$(window).height()))){
         alert("끝!");
      }
   });  
}); 



  function modify(comnum,connum,i){
   url="updateCommentForm.hash?check=y&&comnum="+comnum+"&&connum="+connum+"&&i="+i;
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



function mapopen(latitude,longtitude,maptitle){
	url = "mapopen.hash?latitude="+ latitude + "&longtitude="+longtitude+"&maptitle="+maptitle;
	newwindow=window.open(url,"post","toolbar=no ,width=500 ,height=400 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
	//location.href ="Unlike.hash?connum="+num+"&conhash="+String; //보현test중
}

 //comment 
function delete1(comnum, connum){
 	var com = comnum;
	var con = connum;
	var url = "/INTERHASH-SPRING/deleteComment.hash";
	var params = "comnum="+comnum+"&connum="+connum;
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){	
			$("#test_div *").remove();
			$("#comment_div *").remove();
			for(var i=0;i<args.data.length;i++){
				var check;
				if(args.session==args.data[i].email){
					$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.time+'</label></span><!--'+
						'--!><span id="align_right"><a href="#" onclick="delete1('+args.data[i].comnum+','+args.data[i].connum+')">삭제</a><!--'+
						'--!><a href="#" onclick="modify('+args.data[i].comnum+','+args.data[i].connum+','+i+')">수정</a><!--'+
						'--!></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}else{
				$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.time+'</label></span><!--'+
						'--!><span id="align_right"><!--'+
						'--!><a onclick="reportCom('+args.data[i].comnum+')">신고</a></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}
			}
		},error: function (xhr, status, err){
			 alert(err);
		} 	
		});
}   



	

function Map(){
   url="template2.hash";
   window.open(url,"post","toolbar=no ,width=600 ,height=500,directories=no,status=yes,menubar=no,scrollbars=no");
   } 

function MapUpdate(){
	url="template2.hash";
	window.open(url,"post","toolbar=no ,width=600 ,height=500,directories=no,status=yes,menubar=no,scrollbars=no");
	}  


function mapopen(latitude,longtitude,maptitle ) {
   url = "mapopen.hash?latitude="+ latitude + "&longtitude="+longtitude+"&maptitle="+maptitle;
   newwindow=window.open(url,"post","toolbar=no ,width=500 ,height=400 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
   //location.href ="Unlike.hash?connum="+num+"&conhash="+String; //보현test중
}

	

function deleteCon(connum){
 	var connum = connum;
	 if(confirm("삭제하시겠습니까?")){
	 	location.href="ContentDelete.hash?connum="+connum;	
	     alert("삭제되었습니다.");
	      return true;
	 }	 
	 else{
	      return false;
	 } 
	}
	

//comment insert
function insert1(connum){
	var con = connum;
	var url = "/INTERHASH-SPRING/InsertComment.hash";
	var texta = $('#comment_textarea').val();
	var params = "connum="+con+"&comcontent="+texta; 
	$.ajax({
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(args){	
			$("#test_div *").remove();
			$("#comment_div *").remove();
			for(var i=0;i<args.data.length;i++){
				var check;
				if(args.session==args.data[i].email){
					$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.time+'</label></span><!--'+
						'--!><span id="align_right"><a href="#" onclick="delete1('+args.data[i].comnum+','+args.data[i].connum+')">삭제</a><!--'+
						'--!><a href="#" onclick="modify('+args.data[i].comnum+','+args.data[i].connum+','+i+')">수정</a><!--'+
						'--!></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}else{
				$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.test+'</label></span><!--'+
						'--!><span id="align_right"><!--'+
						'--!><a onclick="reportCom('+args.data[i].comnum+')">신고</a></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}
			}
		}
			,error: function (xhr, status, err){
				alert(err);
			} 
	});
}



function modifyCon(connum){
	
alert('여기');
	 var connum = connum;
	var url = "/INTERHASH-SPRING/ContentUpdate.hash";
	var params = "connum="+connum;
	$.ajax({
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(args){
			$("#content1").attr("type","textarea");
			$("#content1").attr("readonly",false);
			$("#content1").css("border","1px");
			
			$("#left_mod_del_rep *").remove();
			$("#left_mod_del_rep").append("<input id='align_right' type='button' value='수정버튼' onclick='modifypro("+connum+")'>");
		
			$("#left_mod_del_rep").append("<img src ='image/logo/tag.png' width='25px' height='25px' onClick='tagCheckUpdate()'>");
			$("#left_mod_del_rep").append("<img src ='image/logo/place.png' width='25px' height='25px' onClick='MapUpdate()'>");

			
			$("#test_div *").remove();
			$("#comment_div *").remove();
			for(var i=0;i<args.data.length;i++){
				var check;
				if(args.session==args.data[i].email){
					$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.time+'</label></span><!--'+
						'--!><span id="align_right"><a href="#" onclick="delete1('+args.data[i].comnum+','+args.data[i].connum+')">삭제</a><!--'+
						'--!><a href="#" onclick="modify('+args.data[i].comnum+','+args.data[i].connum+','+i+')">수정</a><!--'+
						'--!></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}else{
				$('#test_div').append(
						'<div  id="test2_div"><input type=hidden name=comnum value='+args.data[i].comnum+'><span><b id="nickname">'+args.data[i].comnick+'</b></span><!--'+
						'--!><span><label id="time'+i+'">'+args.test+'</label></span><!--'+
						'--!><span id="align_right"><!--'+
						'--!><a onclick="reportCom('+args.data[i].comnum+')">신고</a></span><br><div id="test"><textarea id="textaa'+i+'" borderStyle="none" cols=50 readonly="readonly" class="autosize">'+args.data[i].comcontent+'</textarea></div></div>')
			}
			}
		}
			,error: function (xhr, status, err){
				alert(err);
			} 
	}); 
}

function modifypro(connum){
	

  	var content1 = document.getElementsByName('content1')[0].value;
	var conhash = document.getElementsByName('tag')[0].value;
	var maptitle = document.getElementsByName('maptitle')[0].value;
	var mapplace = document.getElementsByName('mapplace')[0].value;
	
	var connum = connum;
	var url = "/INTERHASH-SPRING/ContentUpdatePro.hash";
	var params = "content="+content1+"&connum="+connum+"&conhash="+conhash+"&maptitle="+maptitle+"&mapplace="+mapplace;
	
	$.ajax({
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(args){	
			alert('성공');
			$("#content1").attr("type","textarea");
			$("#content1").attr("readonly",true);
			$("#content1").css("border","1px");
			
			$("#left_mod_del_rep *").remove();
			$("#left_mod_del_rep").append("<span id='align_right'>/<a href='#' onclick='deleteCon("+connum+")'>삭제하기</a></span><!--"+
					"--!><span id='align_right'><a href='#' onclick='modifyCon("+connum+")'>수정하기 </a></span>")
					

	/* 		$("#place *").remove();
		 	$("#place").append("<a href='#' onclick= 'javascript:mapopen("+${latitude}+","+${longtitude}+","+${maptitle}+")'>
			'<font color="#666"><b>'+${maptitle}+'</b>에서</font></a>");
  */
		}
			,error: function (xhr, status, err){
				alert(err);
				alert('실패');
			} 
	});  
	 
}


function Map(){
   url="template2.hash";
   window.open(url,"post","toolbar=no ,width=600 ,height=500,directories=no,status=yes,menubar=no,scrollbars=no");
   } 

function mapopen(latitude,longtitude,maptitle ) {
   
   url = "mapopen.hash?latitude="+ latitude + "&longtitude="+longtitude+"&maptitle="+maptitle;
   newwindow=window.open(url,"post","toolbar=no ,width=500 ,height=400 ,directories=no ,status=yes ,scrollbars=no ,menubar=no");
   //location.href ="Unlike.hash?connum="+num+"&conhash="+String; //보현test중
}
function checkIt(){
	
	var content = eval("document.writeForm");
	var conphoto = eval("document.writeForm");
	var tag = eval("document.writeForm");
	
	if(!writeForm.content.value){
		alert("내용을 입력하세요~:)");
		document.writeForm.content.focus(); 
		return false;
	}

	if(!writeForm.conphoto.value){
		alert("사진을 올려주세요~:)");
		return false;
	}
	
	
	if(!writeForm.tag.value){
		alert("태그를 선택해주세요~:)");
		return false;
	}
	

	return true;
};


</script>
</head>
<body>

<div>
          <div id="board_div" class="box-shadow border-round white">
            <div class="container w3-padding">
           <!--    <h6 class="opacity">I love it!! InterHash~♡</h6> -->
            <div id="writeform" border="1">
      <form action="ContentInputPro.hash" name="writeForm" method="post" enctype="multipart/form-data" onSubmit="return checkIt()"> 
      <div id="wrap" style="width: 500px; ">
         <textarea style="resize: none; width:460px; height:80px;" id="textfield" name="content" placeholder="내용을 입력하세요."></textarea>
         <div class="photoBox" style="height: 100px; width: 100px;">
         
        <input type="text" name="tag" size="30" readonly style="border:0px; color:#FF73B8;" id="tag">
      
         
            <input class='fileData' id = "conphoto" name="conphoto" type="file"/> 
               <div id="blah_img" >
                  <img id="blah" src="" alt="no image"/>
               </div>
               <!-- <div id="staticMap" style="width:600px;height:350px;"></div>      -->      
         </div>
         <div style="clear: both;"></div>
         <div id="sub">
            <span id="imageon" style="width: 50px; float: left;"> 
             <img src='<c:url value="/image/logo/photo.png" />' width="30px" height="30px" onclick="$('.fileData:last').click();" /> 
            </span> 
            
            <span id="imageon" style="width: 50px; float: left;">
            <img src='<c:url value="/image/logo/place.png" />' width="30px" height="30px" onclick="Map()" />
           <input type="hidden" name="maptitle" size="10px" readonly/>
            <input type="hidden" name="mapplace" />          
            </span> 
            
            <div id="taglist" style="width:23px; float:left; padding-right:230px; padding-bottom:0px">
            <div style="float:left">
               
            </div>
             <div style="float:right">  
               <img src ="image/logo/tag.png" width="25px" height="25px" onClick="tagCheck()">
             </div>
            </div> 
                 
             <span id="submit"> 
               <!--      <input type="submit" id="button" value="submit"/>  -->
               <input type="image" src="image/logo/post.PNG"> 
         
             </span>
         </div>
      </div>
   </form>
   </div>
              
            </div>
          </div>
      
<!-- 좋아요 기능 function -->
<script>

function likeAjax(num,hash,like){
	
	$(".unlike").show();
	$(".like").hide();
	var url="/INTERHASH-SPRING/LikeCheck.hash";
	var params ="connum="+num+"&conhash="+hash;

	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
 		,success:function(args){
 			$("#like").text(args.data);

 		}
	    ,error:function(request, status , err) {
	    	alert("code : "+request.status + "\n message : "+request.responseText+"\n error : "+err);
	    }
	});
}

function unlikeAjax(num,hash,like){
	
	$(".like").show();
	$(".unlike").hide();
	var url="/INTERHASH-SPRING/Unlike.hash";
	var params ="connum="+num+"&conhash="+hash;
	
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
 		,success:function(args){
 			$('#like').text(args.data);
 		}
	    ,error:function(request, status , err) {
	    	alert("code : "+request.status + "\n message : "+request.responseText+"\n error : "+err);
	    }
	});
}

</script>


<form method='post' action='ContentView.hash'>

<c:forEach var="con" items= '${content}' >
<input type="hidden" name="connum" value="${con.connum}">
<div id="board_div" class="container box-shadow border-round white">
<table width="100%">
<tr>  
<td width="10%">
<c:set var= "temp" value="${con.email }" />
<img src='<c:url value="/upload/${profilephoto.get(temp)}"/>' alt="Avatar" class="left-align circle" style="width:50px; height:50px;">

</td>
<td width="65%"><a id="View" target="_blank" href="#" onclick="window.open('ProfileView.hash?nickname=${con.connickname}','new','resizable=no width=700 height=500');return false">${con.connickname}</a></td>
<td width="35%"><b class="right-align opacity"><font color="#b2b2b2">${con.conmodifieddate}</font></b></td>
</tr>
</table>
   <hr color="#eee">
   <div class="content">
   <div class="write">${con.content}&nbsp;&nbsp;&nbsp;
   <c:if test="${!empty con.maptitle}">
   -<a href="#" onclick= "javascript:mapopen('${con.latitude}','${con.longtitude}','${con.maptitle}')" >
   <font color="#666"><b>${con.maptitle}</b>에서</font></a>
   </c:if>
   </div>
   
   
   <div class="w3-row-padding">
        <a href="ContentView.hash?connum=${con.connum}" class="img_link">
      <img id = "img" src='<c:url value="/upload/${con.photolist[0].realpath }" />'/>
      </a>  
    </div>

    <p class="pro1">${con.conhash}</p>

   </div>
   
<%--     <div id="btn_group">
    <button type="button" id="btn1" class="w3-btn w3-theme-d1 w3-margin-bottom" onclick="javascript:like('${con.connum}')"><i class="fa fa-thumbs-up"></i> Like 

</button>
    <button type="button" id="btn2" class="w3-btn w3-theme-d2 w3-margin-bottom hide" onclick="javascript:unlike('${con.connum}')"> un_like </button>
    <input type="checkbox" class="hide"/>
    </div> --%>


	
        <%-- <button id="like_ajax" type="button" class="w3-theme-d1 w3-margin-bottom like" ><i class="fa fa-thumbs-up"></i>  Like ${con.conlike}</button> --%>

   <div class="w3-btn">
    

     <%-- <button type="button" class="w3-theme-d1 w3-margin-bottom like" onclick="javascript:likeAjax('${con.connum}','${con.conhash}')"><i class="fa fa-thumbs-up"></i>Like <i id="likep">${con.conlike}</i></button> 
     <button type="button" class="w3-theme-d2 w3-margin-bottom unlike hide" onclick="javascript:unlikeAjax('${con.connum}','${con.conhash}')"><i class="fa fa-thumbs-up"></i> Like <i id="likem"> ${con.conlike}</i></button>  
 	 <button type="button" class="w3-theme-d3 w3-margin-bottom" onclick="location.href='Board.hash'"><i class="fa fa-comment"></i>  Comment ${con.connum}</button>  --%>
 		
 		<div align=center>
 	 	<i class="fa fa-thumbs-up w3-theme-d2 w3-margin-bottom"  id="like">&nbsp Like ${con.conlike} &nbsp </i>&nbsp &nbsp
 	 	<i class="fa fa-comment w3-theme-d2 w3-margin-bottom">&nbsp Comment ${con.connum} &nbsp </i>  
    	</div>
    	 
	 <%-- <input type="button" id="btn" name="btn1" value="like" onclick="javascript:likeAjax('${con.connum}','${con.conhash}','${con.conlike}')" > <i id="likep"> ${con.conlike} </i> --%>
   
   <%-- <div id="board_img">
   <a href="ContentView.hash?connum=${con.connum}">
      <img id = "img" src='<c:url value="/upload/${con.photolist[0].realpath }" />' />
      </a>
   </div>
   <div id ="board_main">
   <a href="ContentView.hash?connum=${con.connum}"> --%>
   
	
	</div>


<%-- 	 <div id="board_img">
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
	

 <%--       <div id="board_subject">
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