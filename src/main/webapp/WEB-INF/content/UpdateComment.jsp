<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>
#nickname{
font-size:15px;
}

#time{
color:gray;
font-size:14px; 
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">


/* function close(){
	opener.location.reload(true);
	window.close();
}  */



function modifypro(comnum,connum){
	var com = comnum;
	var con = connum;
	var comcontent = $("#textA").val();
	var url ="/INTERHASH-SPRING/updateCommentPro.hash";
	var params = "comnum="+com+"&connum="+con+"&comcontent="+comcontent;
	

	$.ajax({
		type:"post",
		url:url,
		data:params,
		dataType:"json",
		success:function(args){
			opener.document.getElementById('textaa'+com).value= comcontent;	
			opener.document.getElementById('time'+com).innerHTML= args.dateone;

 		window.close();
		},error: function (xhr, status, err){
			 alert(err);
		} 
	});  
	}

</script>
</head>
<body>

<form>
<div>

<b id="nickname">${article.comnick}</b>
<label id="time">${sdf.format(article.commodifieddate)}</label>
</div>



<div>
<%-- <input type="text" size="30" name="comcontent" value="${article.comcontent}"> --%>
<textarea name="comcontent" id="textA" rows="3" cols="51.5">${article.comcontent}</textarea>
<input type="hidden" name="comnum" value="${article.comnum}">
<input type="hidden" name="connum" value="${article.connum}">
</div> 


<div align="right">
<!-- <input type="submit" value="수정하기" onsubmit="close();"/> -->
<input type="button" onclick="modifypro(${article.comnum},${article.connum})" value="수정">
<input type="button" value="취소" onclick="testtt()">
</div>
</form>  
<script>
function testtt(){
self.close();
}
</script>

</body>
</html>