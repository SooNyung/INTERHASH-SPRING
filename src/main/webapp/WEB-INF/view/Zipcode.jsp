<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소 찾기</title>
<script>

	function sendAddress(zipcode, area1, area2, area3, area4) {
		var address;
		/* EL로 가져온 값이므로 null 이 아니라 빈문자열 */
		if(area3==''){
			address = area1 + " " + area2  + " " + area4;
		}else{
			address = area1 + " " + area2 + " " + area3 + " " + area4;
		}
		opener.document.userinfo.zipcode.value = zipcode;
		opener.document.userinfo.address.value = address;
		self.close();
	}
</script>
</head>
<body>
<form action="Zipcode.do" method="get">
	<input type="text" name="area4"><input value="검색" type="submit">
</form>
<br>
<c:if test="${zipcodelist !=null }" >
<div>
	<c:forEach var="zip" items="${zipcodelist}" >
		<a href="javascript:sendAddress('${zip.zipcode}','${zip.area1}', '${zip.area2}', '${zip.area3}', '${zip.area4}')" >	${zip.zipcode} ${zip.area1} ${zip.area2} ${zip.area3} ${zip.area4} </a><br>
	</c:forEach>
</div>
</c:if>
</body>
</html>