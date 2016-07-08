<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<script>
window.onload=function() {
document.getElementById('date').valueAsDate = new Date();
}
</script>

<style>
*{
color:#7A7A7A;
}
td{
width:100px; 
text-align:center;
}

#div1{ float:left; width:100%;}
#div2{ float:left; width:100%;}
#div3{ float:left; width:100%;}

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

#view_div{
	width:120%;
	height:1100px;
 	/* background-color: black; */
	/* border:1px solid; */
	padding:5px;
	margin-top:10px;
	}

</style>
</head>
<body>
<div id ="view_div" class="box-shadow border-round white">
<center>
<h3>통계</h3>
<hr/>
<div align="bottom"><input type="date" name="date" id="date"></div>
<p>

<input type="button" value="관리자페이지" onclick="javascript:window.location='ManagerPage.hash'">

<p>

<div id ="div1" >
<table>
<tr height="30" bgcolor="#ffcccc">
<td><b>HashTag</b></td>
<td><b>좋아요 수</b></td>
<td><b>게시글 수</b></td>
</tr>
<c:forEach var="hash" items="${content}">
<tr>
<td>
${hash.conhash}

</td>
<td>
${hash.hashlike}

</td>
<td>
${hash.hashcontent}

</td>

</tr>
</c:forEach>
</table>
</div>



<div id ="div2">
<h3>Total</h3>
<table>
<tr height="30" bgcolor="#ffcccc">
<td><b>방문자 수</b></td>
<td><b>좋아요 수</b></td>
<td><b>게시물 수</b></td>
</tr>
<tr height="30">
<td>${total_count}</td>
<td>${likecount}</td>
<td>${contentcount}</td>
</tr>

</table>
</div>



<div id ="div3">
<h3>Today</h3>
<table>
<tr height="30" bgcolor="#ffcccc">
<td><b>방문자 수</b></td>
<td><b>좋아요 수</b></td>
<td><b>게시물 수</b></td>
</tr>
<tr height="30">
<td>${today}</td>
<td>${today_like}</td>
<td>${today_content}</td>
</tr>

</table>
</div>

</div>
</body>
</html>