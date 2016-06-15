<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>신고</title>
<style>
#test{
font-size:12px;
color:gray;
}
#reportemail{
font-size:15px;
}
#test1{
font-size:12px;}
</style>
<script>
function close(){	
	window.close();
	}

</script>
<script type="text/javascript">
function test(){
	self.close();
}
</script>
</head>
<script>
function test() {
	self.close();
}
</script>
<body>

<form name="report" method="post" action="ReportProCom.hash">
<div align="center">
<label id="test1">신고대상 : </label>
<b id="reportemail">${comment.comnick}(${comment.email})</b></div><br>
<div align="center"><label id="test">신고 사유를 선택하세요.</label></div>
<div align="center">
<select name="report">
		<option value="0">불쾌한 내용이 있거나 재미없습니다.</option>
		<option value="1">저속한 내용 또는 욕성이 포함되어 있습니다.</option>
		<option value="2">음란물 입니다.</option>
		<option value="3">타인을 괴롭히거나 편파적인 내용입니다.</option>
		<option value="4">마약 또는 성인 용품의 관련 게시물입니다.</option>
		<option value="5">이 계정이 해킹당했습니다.</option>
		<option value="6">스팸성 게시물입니다.</option>
	</select>
	<input type="hidden" name="redistinction" value="1">
	<input type="hidden" name="email" value="${comment.email}">
	<input type="hidden" name="comnum" value="${comment.comnum}">
	<input type="hidden" name="connum" value="${comment.connum}">
	
</div>
<br>
<div align="center">
<input type="submit" value="전송" onsubmit="return test()">
<input type="button" value="취소" onclick="javascript:window.close()">
</div>
</form> 

</body>
</html>