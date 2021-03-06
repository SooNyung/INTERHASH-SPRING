<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
*{
color:#7A7A7A;
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
</style>
<script>
function setReadonly()
{
opener.userinput.emailnumber.readOnly="true";
self.close();
}
</script>
</head>
<body>
<c:if test="${sessionScope.key=='success'}">
<table>
  <tr>
    <td align="center"><p>인증되었습니다.</p>
    <input type="button" id="buttonid" value="닫기" onclick="setReadonly();">
    </td>
  </tr>
</table>
</c:if>
<c:if test = "${sessionScope.key !='success' }">
<table>
  <tr>
    <td align="center"><p>인증번호가 틀렸습니다.</p>
    <input type="button" id="buttonid" value="닫기" onclick="self.close()">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>