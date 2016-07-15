<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>이메일전송완료</title>
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
opener.userinput.email.readOnly ="true";
self.close();
}
</script>
</head>
<body>
<table>
  <tr>
    <td align="center">
      <p>인증번호가 전송되었습니다. </p>
      <p>해당 이메일에서<br>인증번호를확인해주세요!</p>
      <input type="button" id="buttonid" value="닫기" onclick="setReadonly()">
    </td>
  </tr>
</table>
</body>
</html>