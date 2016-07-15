<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Email</title>
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
  function setNickname()
    {
    opener.document.userinput.nickname.value="${nickname}";
    opener.document.userinput.nickname.readOnly="true";
	self.close();
	}
</script>
</head>
<body>
<c:if test="${check!=0}">
<table>
  <tr>
    <p><td align="center">${nickname}은<br>이미 사용중인 닉네임입니다.</p>
    <p>다른 닉네임을 사용해주세요.</p>
    <input type="button" id="buttonid" value="닫기" onclick="self.close()">
    </td>
    
  </tr>
</table>
</c:if>
<c:if test="${check==0}">
<form >
<table>
  <tr>
    <td align="center">
      <p>사용할수 있는 닉네임입니다.</p>
      <input type="button" id="buttonid" value="닫기" onclick="setNickname()">
    </td>
  </tr>
</table>
</form>
</c:if>
</body>
</html>

