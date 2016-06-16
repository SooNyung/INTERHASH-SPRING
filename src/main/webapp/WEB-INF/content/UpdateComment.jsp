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

<script type="text/javascript">


function close(){
	opener.location.reload(true);
	window.close();
} </script>
</head>
<body>

<form method="get" action="updateCommentPro.hash">
<div>

<b id="nickname">${article.comnick}</b>
<label id="time">${sdf.format(article.commodifieddate)}</label>
</div>



<div>
<%-- <input type="text" size="30" name="comcontent" value="${article.comcontent}"> --%>
<textarea name="comcontent" rows="3" cols="51.5" value="${article.comcontent}">${article.comcontent}</textarea>
<input type="hidden" name="comnum" value="${article.comnum}">
<input type="hidden" name="connum" value="${article.connum}">
</div>


<div align="right">
<input type="submit" value="수정하기" onsubmit="close();"/>
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