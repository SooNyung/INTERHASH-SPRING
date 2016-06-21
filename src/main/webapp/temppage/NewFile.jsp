<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
body{padding:0px;margin:0px;width:100%;height:100%;}
#header{position:absoulte; top:0; left:0; height:100px; width:100%; background-color:#FFCCCC;}
#container{width:100%;height:800px;  background-color:#b2b2b2}
#footer{width:100%;  height:100px;  background-color:#FFCCCC;}
#menu{width:50%; border:1px; float:left;}
#account{width:50%; border:1px; float:right;}
#logo{float:left}
#icon{float:right}
#left{width:30%; height:800px; float:left; background:#59b1f6; }
#right{width:25%; height:800px; float:right; background:#ffb5b4}
#middle{width:45%; height:800px; background:#d5eeb0; overflow:hidden;}
#post{width:100%; height:100px; border:2px;}
#content{width:100%; height:700px; border:2px;}
#up{width:100%; height:300px;}
#down{width:100%; height:400px;}
#profile{width:100%; height:200px;}
#sub{width:100%; height:200px;}
#hash{width:100%; height:200px;}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id ="header">
<div id="menu">
	<div id="logo">logo</div><div id="icon">icon</div>
</div>
<div id="account">
	<div id="account">account</div>
	<div id="search">search</div>
</div>
</div>
<div id ="container">
<div id ="left">
	<div id ="profile">profile</div>
	<div id ="sub">sub</div>
	<div id ="hash">hash</div>
</div>
<div id ="right">
	<div id ="up">인기글</div>
	<div id ="down">채팅창</div>
</div>
<div id ="middle">
	<div id="post">글쓰기</div>
	<div id="content">글 리스트</div>
</div>
</div>
<div id ="footer">footer</div>
</body>
</html>