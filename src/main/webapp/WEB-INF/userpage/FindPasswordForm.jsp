<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title> Password </title>
<c:set var="email" value='${email}' />
<script>
	function checkIt(){
		var userinfo = eval("document.useremail");
		if(!userinfo.email.value){
			alert("이메일주소를 입력해주세요.")
			return false;
		}
		return true;
		
	}
</script>
<c:if test='${email == null}'>
<script>
	alert("일치하는 이메일이 없습니다.");
</script>
</c:if> 
<c:if test='${email != null}'>
<script>
	alert("해당 이메일로 임시비밀번호를 전송했습니다.");
</script>
</c:if>
</head>
<body>
비밀번호 찾기 폼
<form method="post" name="useremail" action="FindPasswordPro.hash" onSubmit="return checkIt()">
	<input type="text" name="email">
	<input type="submit" name="confirm" value="비밀번호찾기">
</form>
</body>
</html> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title> Password </title>
<c:set var="email" value='${email}' />
<script>
	function checkIt(){
		var userinfo = eval("document.useremail");
		
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		
		if(!userinfo.email.value){
			alert("이메일주소를 입력해주세요.");
			userinfo.email.focus();
			return false;
		}
		
		/* if(regex.test(userinfo.email.value) === false) 
		{  
		    alert("잘못된 Email 형식입니다.");  
		    userinput.email.focus(); 
		    return false; 
		} */
		
		return true;
	}
</script>

<%-- <c:if test='${email == null}'>
<script>
	alert("일치하는 이메일이 없습니다.");
</script>
</c:if> --%>
 
<c:if test='${email != null}'>
<script>
	alert("해당 이메일로 임시비밀번호를 전송했습니다.");
</script>
</c:if> 

</head>

<body>
 비밀번호 찾기 폼<br>
<c:if test="${email==null }">
<form method="post" name="useremail" action="FindPasswordPro.hash" onSubmit="return checkIt()">
	<input type="text" name="email">
	<input type="submit" name="confirm" value="비밀번호찾기"><br> <!-- onClick="checkIt()"/> -->
</form>
</c:if>

<%--<c:if test="${email != null}">
email ::: ${email} <br>
password ::: ${password} <br>
tempPassword ::: ${key}<br>
</c:if> --%>

<c:if test="${email!=null}">
	<input type="button" value="로그인하러 가기" onClick="location.href='Main.hash'"/>
</c:if>

</body>
</html>