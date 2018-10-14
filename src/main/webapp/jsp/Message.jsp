<%--
  Created by IntelliJ IDEA.
  User: srushti
  Date: 2/10/18
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Message</title>
</head>
<body>
<center>
    <h3><%=request.getAttribute("Message")%></h3>
</center>
</body>
</html>