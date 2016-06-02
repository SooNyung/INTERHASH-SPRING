<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body> 
<tiles:insertAttribute name="header" />
<hr />
<tiles:insertAttribute name="body" /> 
<hr/>
<tiles:insertAttribute name="footer" />
</body>
</html>
