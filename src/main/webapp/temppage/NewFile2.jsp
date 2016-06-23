<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#head{
	background-color:blue;
	height:80px;
}

#head_left{

}
#head_right{

}



#main{
	background-color:red;
	height:900px;
}
#footer{
	background-color:yellow;
	height:70px;
}
</style>

</head>
<body>

<div id=head>
	<div id=head_left>
		<!-- 로고 -->
		<div id=head_left_logo>
		</div>
		<!-- 알림, 쪽지 -->
		<div id=head_left_nologo>
			<!-- 알림 -->
			<div id="head_left_nologo_message">
			</div>
			<!-- 쪽지 -->
			<div id="head_left_nologo_alam">
			</div>
		</div>
	</div>
	<div id="head_right">
		<!-- 검색 -->
		<div id="head_right_search">
			<div id=head_right_search_input></div>
			<div id=head_right_search_submit></div>
		</div>
		<!-- 프로필 -->
		<div>
			<div>
			</div>
		</div>
	</div>

</div>
<div id=main>
	<!-- 메뉴 -->
	<div>
	</div>
	<!-- 게시물 -->
	<div>
		<!-- 게시물 입력 -->
		<div>
		</div>
		<!-- 게시물들 -->
		<div>
		</div>
	</div>
	<!-- 인기글, 채팅 -->
	<div>
		<!-- 인기글 -->
		<div>
		</div>
		<!-- 채팅 -->
		<div>
		</div>
	</div>
</div>
<div id=footer>
	<!-- 하단부 내용 -->
	<div>
	</div>
</div>

</body>
</html>