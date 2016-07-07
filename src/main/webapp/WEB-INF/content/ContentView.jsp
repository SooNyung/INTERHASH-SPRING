<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "spring.controller.content.ContentViewAction" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>

<title>View</title>
<style>
.box-shadow{box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important;margin-top:0px;}
 .border-round{border-radius:4px!important}
 .container{content:"";display:table;clear:both;padding:0.01em 16px; margin-left:0px;}
.w3-col.m12{width:100px}
html,body,h6{font-family: "Open Sans", sans-serif}
.w3-theme {color:#fff !important; background-color:#607d8b !important}
.white{color:#000!important;background-color:#fff!important;}
   
   #img
   {
      width: 350px;
      height:300px;
      margin:auto;
   }
      
#nickname{
font-size:15px;
}

#time{
color:gray;
font-size:14px; 
}

#hash{
color:#5AAEFF;
}
#view_div{
   width:780px;
   height:640px;
    /* background-color: black; */
   /* border:1px solid; */
   padding:5px;
   margin:auto;
   }
   #view_left{
   width:380px;
   height:620px;
   /* background-color: yellow; */
   float:left;   
   margin:auto;
   }
   #view_right{   
   width:380px;
   height:620px;
   /* background-color: yellow; */
   float:right;
   margin:auto;
   }
   
   #left_nickndate{
   width:360px;
   height:20px;
   float:auto;
   margin:5px;
   background-color:white;
   }
   
   #left_mod_del_rep{
   width:360px;
   height:20px;
   float:auto;
   margin:5px;
   /* border:1px solid; */
   background-color:white;
   }
   
   #align_left{
   float:left;
   }
   #align_right{
   float:right;}
   #left_nickndate{
   width:360px;
   height:20px;
   float:auto;
   margin:5px;
   background-color:white;
   }

   #left_good_re{
   width:360px;
   heigt:20px;
   float:auto;
   margin:5px;
   background-color:white;   
   }
   #right_nick{
   width:360px;
   height:20px;
   float:left;
   margin:5px;

   background-color:white;
   }
   #comment_content{
   width:360px;
   height:60px;
   float:left;
   margin:5px;
   background-color:white;
   }
   #comment_textarea{
   width:98.5%;
   height:100%;
   }
   
   #comment_submit{
   width:360px;
   height:20px;
   float:left;
   margin:5px;
   /* border:2px solid; */
   background-color:white;
   }
   
   #comment_view{
   width:360px;
   height:460px;
   float:left;
   margin:5px;
   
   background-color:white;
   }
   
   #content_photo{
   width:360px;
   height:490px;
   float:left;
   margin:5px;
   
   background-color:white;
   }
   
   #test{border-bottom:1px solid;}
	
</style>

</head>
<body>
<div id="view_div">
<!-- <form name="view"> -->

<div id="view_left" class="box-shadow border-round white">
	<form name="jinkyung">
	<div id="left_nickndate">
		<span id ="align_left"><b>${sessionScope.nickName}</b>님</span>
		
	<span id="align_right"><label id="time">${sdf.format(content.conmodifieddate)}</label></span>
		
	</div>

	<c:if test="${sessionScope.memId==content.email}">
	<div id="left_mod_del_rep">
		<span id="align_right">/<a href="#" onclick="deleteCon(${content.connum})">삭제하기</a></span>
		<span id="align_right"><a href="#" onclick="modifyCon(${content.connum})">수정하기 </a></span>
	</div>
	</c:if>
		
	<c:if test="${sessionScope.memId!=content.email}">
	<div id="left_mod_del_rep">
		<span id="align_right"><a onclick="report(${content.connum})">신고하기</a></span>
	</div>
	</c:if>	
	
	<div id="content_photo" style="height:490px; overflow-x:auto">

		<input type="text" id="content1" name="content1" style="border:0px" readonly value="${content.content}"><br>
		<div id="place">-<a href="#" onclick= "javascript:mapopen('${content.latitude}','${content.longtitude}','${content.maptitle}')" >
   <font color="#666"><b>${content.maptitle}</b>에서</font></a><br></div><br>

		<div id="tagtest">
		<input type="text" name="tag" size="30" readonly style="border:0px; color:#FF73B8;" id="tag" value="${content.conhash}"><br><br>
		</div>
		
		<c:forEach var="photo" items="${content.photolist}">
		
		<img id="img" src='<c:url value="/upload/${content.photolist[0].realpath }" />'/>

		</c:forEach>

	</div>
	
	<div id="left_good_re">
		<label id="align_right">댓글 수: ${count}</label>
		<!-- <label id="align_right">좋아요/</label> --> 
	</div>
	<div>
	  <button type="button" class="w3-theme-d1 w3-margin-bottom like" onclick="javascript:likeAjax('${content.connum}','${content.conhash}')">
        <i class="fa fa-thumbs-up"></i> Like </button>
        <button type="button" class="w3-theme-d2 w3-margin-bottom unlike hide" onclick="javascript:unlikeAjax('${content.connum}','${content.conhash}')">
        <i class="fa fa-thumbs-up"></i> Like </button>  
    
     <i id="like"> ${content.conlike}</i>
     </div>
	</form>
</div>

<div id="view_right" class="box-shadow border-round white">
	<input type=button onclick="location.href='Board.hash'" value="X" style="float:right">
	
	
	<form method="post" action="InsertComment.hash">
	<input type=hidden name=connum value="${content.connum}">
	<input type=hidden name=comnick value="${sessionScope.nickName}">

	
	<div id="right_nick">
		<span id ="align_left"><b>${sessionScope.nickName}</b>님</span>
		<!-- <span id="align_right"><input type="button" onclick="back()" value="닫기버튼"></span> -->
		
	</div>
	<div id="comment_content">
		<textarea id="comment_textarea" name="comcontent" placeholder="댓글을 입력해주세요"></textarea>
	</div>
	
	<div id="comment_submit">
		<span id="align_right">
		<input type="button" id="rptl" value="개시" onclick="javascript:insert1(${content.connum})"> </span>
	</div>
	</form>
	
	<div id="comment_view" style="height:460px; overflow-x:auto" onchange="reload();">
	
	<div id="test_div"></div>
 	<c:forEach var="comment" items="${comment}">
		
	<div id="comment_div">   
	<input type=hidden name=comnum value="${comment.comnum}">
	<span><b id="nickname">${comment.comnick}</b></span>
	
	<span><label id="time">${sdf.format(comment.commodifieddate)}</label></span>
	
	<span id="align_right">
	
		<c:if test="${sessionScope.memId==comment.email}">
		<a href="#" onclick="delete1(${comment.comnum},${comment.connum})">삭제</a>
		<a href="#" onclick="modify(${comment.comnum},${comment.connum})">수정</a>
		</c:if	>
		
		<c:if test="${sessionScope.memId!=comment.email}">
		<a onclick="reportCom(${comment.comnum})">신고</a>
		</c:if>	
	</span><br> 
	<div id="test"><textarea id="comment_textara" borderStyle="none" cols=50 readonly="readonly" class="autosize">${comment.comcontent}</textarea></div>
	</div>	
	</c:forEach>  
	</div>
	
   <form>
   <div id="left_nickndate">
      <span id ="align_left"><b>${sessionScope.nickName}</b>님</span>
   </div>      
   </form>

</div>



</div>

</body>
</html>