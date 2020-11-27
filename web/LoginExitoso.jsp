<%-- 
    Document   : Test
    Created on : 15/11/2020, 05:35:26 PM
    Author     : Alrik
--%>

<%@page import="APIResponse.RegistroResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% RegistroResponse status = (RegistroResponse)request.getAttribute("registroresponse");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Funciono</h1>
        
        <p>Datos:</p>
        Status <%=status.success.user_id%><br><br>
        Mensage <%=status.success.message%>
    </body>
</html>
