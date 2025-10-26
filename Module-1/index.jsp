<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crystal Long – CSD-430 Module 1 JSP Test</title>
</head>
<body>
    <h1>Welcome to my first JSP on Payara!</h1>
    <p>The current date and time is:</p>
    <%
        java.util.Date now = new java.util.Date();
        out.println("<strong>" + now.toString() + "</strong>");
    %>
    <p>This JSP runs successfully on Payara Server 6.</p>
</body>
</html>
