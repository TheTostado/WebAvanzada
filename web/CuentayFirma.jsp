<%-- 
    Document   : CuentayFirma
    Created on : 21/11/2020, 08:28:17 AM
    Author     : Alrik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuenta y Firma Digital</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilocuentayfirma.css" rel="stylesheet" type="text/css"/>
        
        <%
            String user =null;
            if(session.getAttribute("email")== null){
                response.sendRedirect("index.jsp");
            }else{
                user = (String) session.getAttribute("email");
            }
                String userName = null;
                String sessionID = null;
                Cookie[] cookies = request.getCookies();
                if(cookies != null){
                    for(Cookie cookie : cookies){
                        if(cookie.getName().equals("email")){
                            userName = cookie.getValue();
                            sessionID = cookie.getValue();
                        }
                        if(cookie.getName().equals("JSESSIONID")){
                            sessionID = cookie.getValue();
                        }
                    }
                }
        %>
        
    </head>
    <body>
        <br><br><br>
                    <div id="contenedor2">
                        <h2>¿Que desea hacer?</h2>
                    </div><br><br><br>
                    <div id="contenedor1">
                        <form action="AccountUpdater.jsp" id="form1" method="POST">
                            <input type="submit" value="Actualizar Datos de la Cuenta"/>
                        </form>
                        <div>
                        <form action="AccountFinder.jsp" id="form1" method="POST">
                            <input type="submit" value="Datos de la Cuenta"/>
                        </form>
                        </div>
                    </div>
    </body>
</html>
