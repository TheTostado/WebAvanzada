<%-- 
    Document   : LoginSuccess
    Created on : 15/11/2020, 07:53:00 PM
    Author     : USUARIO HP
--%>
<%@page import="APIResponse.RegistroResponse"%>
<%@page import="APIResponse.LoginResponse"%>
<% RegistroResponse status = (RegistroResponse)request.getAttribute("registroresponse");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" method="POST">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style>
body {
    
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
                        }
                        if(cookie.getName().equals("JSESSIONID")){
                            sessionID = cookie.getValue();
                        }
                    }
                }
        %>
    
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  /*background-image: url(fondo.jpg);*/
  background-position: center center;
  
  background-repeat: no-repeat;
  
  background-attachment: fixed;
  
  background-size: cover;
  
  background-color:#17a2b8;
 
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #333;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
#form1 input[type="submit"]{
    float: right;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  cursor: pointer;
  background-color: #333;
  color: white;
}
#form1 input[type="submit"]:hover{
    background: #f2f2f2;
    color: #000000;
}
h1 {
   font-size: 250%;
}
</style><title>Inicio</title>
    </head>
    <body>
        <div class="topnav " id="header">
        <nav class ="navbar navbar-dark bg-dark">
            <a class="navbar-toggler"><span class="navbar-toggler-icon"></span>
  <a href="#home" class="active">Home</a>
  
  
  
  <div class="dropdown" align="right">
      <form action="LogoutServlet" id="form1" method="POST">
  <!-- <a href="" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a>-->
    <input type="submit" value="Cerrar Sesión"/>
      </form>
  </div>
  
  <div class="dropdown" align="right">
      <form action="CuentayFirma.jsp" id="form1" method="POST">
  <!-- <a href="" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a>-->
    <input type="submit" value="Cuenta y Firma Digital"/>
      </form>
  </div>
  <div class="dropdown" align="right">
      <form action="" id="form1" method="POST">
  <!-- <a href="" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a>-->
    <input type="submit" value="Contratos"/>
      </form>
  </div>
  <div class="dropdown" align="right">
      <form action="" id="form1" method="POST">
  <!-- <a href="" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a>-->
    <input type="submit" value="Presupuestos"/>
      </form>
  </div>
  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<div style="padding-left:16px" >
    <br><br><br><br><br><br><br><h1 style="color:white;" align="center"><!-- Bienvenido al sistema Usuario:--> <%=status.success.message%>
    <br><br><strong>${nom}</strong></h1>
</div>

<script>
function myFunction() {
  var x = document.getElementById("header");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

    </body>
</html>
