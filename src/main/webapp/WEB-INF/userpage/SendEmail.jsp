<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>�̸������ۿϷ�</title>
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
      <p>������ȣ�� ���۵Ǿ����ϴ�. </p>
      <p>�ش� �̸��Ͽ���<br>������ȣ��Ȯ�����ּ���!</p>
      <input type="button" id="buttonid" value="�ݱ�" onclick="setReadonly()">
    </td>
  </tr>
</table>
</body>
</html>