<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<html>

<head>
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}
#fontsize{
font-size:15px;
}


#message{
overflow: hidden;
text-overflow: ellipsis;
width: 300px;
border:0;
}

#message:hover{
	text-decoration: underline; 
  color:#ea4c88;
   cursor:pointer;
}

body{
background-color:white;
font-family: 'Indie Flower', cursive;
}
#heart{
	color:#ea4c88;
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

#rigth{
	float: right;
}
a {
color:#8C8C8C;
text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline; 
  color:#ea4c88;
  
}
h2{
text-align: center;
}
#buttonid {
	color: white;
	background-color: #FFCCCC;
	border-radius: 7px !important;
	padding:5px;
}
</style>

<script type="text/javascript">
$(function() {
     $('.img_link').magnificPopup({
        type:'ajax'
     });
       
});
</script>
<!-- 좋아요 기능 function -->
<script>
function likeAjax(num,hash){

   var url="/INTERHASH-SPRING/LikeCheck.hash";
   var params ="connum="+num+"&conhash="+hash;
   var like = "#"+num+"unlike";
   
   $.ajax({
      type:"post"
      ,url:url
      ,data:params
      ,dataType:"json"
       ,success:function(args){
          $(like).text(args.data);
       }
       ,error:function(request, status , err) {
          alert("code : "+request.status + "\n message : "+request.responseText+"\n error : "+err);
       }
   });
}

function unlikeAjax(num,hash,like){

   var url="/INTERHASH-SPRING/Unlike.hash";
   var params ="connum="+num+"&conhash="+hash;
   var unlike = "#"+num+"like";
   
   $.ajax({
      type:"post"
      ,url:url
      ,data:params
      ,dataType:"json"
       ,success:function(args){
          $(unlike).text(args.data);
       }
       ,error:function(request, status , err) {
          alert("code : "+request.status + "\n message : "+request.responseText+"\n error : "+err);
       }
   });
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
               
         /* $("#place").remove();
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
</script>
</head>

<body>

<!-- <a id="rigth" href="MessageList.hash"><spen class="fontawesome-envelope"> Received messages </a>
<br> 
<h2><spen id="heart" class="fontawesome-heart"></spen>Send Message<spen id="heart" class="fontawesome-heart"/></h2>
 -->

<!-- <div id="bar"> -->

<!-- </div> -->
<h2><span id="heart" class="fontawesome-heart"></span>Alarm<span id="heart" class="fontawesome-heart"/></h2>
<hr>
	<c:forEach var="list" items="${alarmlist}">
		<c:if test="${list!=null}">
		<div>
			<span><b id="fontsize">Sender |</b> <label id="fontsize">${list.comnick}</label></span><br> 
			<span><b id="fontsize">From time |</b> 
	<label id="fontsize"> ${list.alarmdate} </label>
			</span><br><hr>
			
			<c:if test="${list.kinds == 0}">
				<span>  <a href="ContentView.hash?connum=${list.connum}" class= "img_link">
				<b>${list.comnick}</b>님이 회원님의 게시글에 댓글을 남겼습니다.</a>			
				<input type="button" id="buttonid" value="삭제" onclick="location.href='alarmdelete.hash?alarmnum=${list.alarmnum}'"> 
			</span><br>
			</c:if>
			
			<c:if test="${list.kinds == 1}">
				<span> <a href="ContentView.hash?connum=${list.connum}" class= "img_link">
				<b>${list.comnick}</b>님이 회원님의 게시글을 좋아합니다.</a>		
				<input type="button" id="buttonid" value="삭제" onclick="location.href='alarmdelete.hash?alarmnum=${list.alarmnum}'"> 
			
			</span><br>
			</c:if>
			
		</div>
		</c:if>
		
		<c:if test="${list==null}">
		<div>알림이 없습니다.</div>
		</c:if>
	</c:forEach>

</body>
</html>