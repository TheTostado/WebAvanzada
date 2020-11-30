<%-- 
    Document   : LoginSuccess
    Created on : 15/11/2020, 07:53:00 PM
    Author     : USUARIO HP
--%>
<%@page import="APIResponse.EAFAccount"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="APIResponse.LoginResponse2FA"%>
<%@page import="APIResponse.LoginResponse"%>
<%@page import="APIResponse.EnterpriseAccountFinderResponse"%>

<% EnterpriseAccountFinderResponse afr = (EnterpriseAccountFinderResponse)request.getAttribute("eafresponse");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
  
  background-image: url(imagen/fondo.jpg);
  
  background-size: cover;
 
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
  <a href="#home" class="active">Webmaster</a>
  
  <div class="dropdown" align="right">
      <form action="LogoutServlet" id="form1" method="POST">
  <!-- <a href="" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a>-->
    <input type="submit" value="Cerrar Sesión"/>
      </form>
  </div>
  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<div style="padding-left:16px" >
    <br><br><h1 style="color:white;" align="center">Cuentas Empresariales:
    <br><br><strong>${nom}</strong></h1>
</div>

<table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Email</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
    </tr>
  </thead>
  <%
      System.out.println(afr);
      
      Iterator it = afr.success.accounts.iterator();
      
            while(it.hasNext()){
                EAFAccount cuenta = (EAFAccount)it.next();
        %>
  <tbody>
    <tr>
      <td><%=cuenta.account_id%></td>
      <td><%=cuenta.email%></td>
      <td><%=cuenta.firstName%></td>
      <td><%=cuenta.lastName%></td>
      
      <td><button type="button" class="btn btn-primary">Aceptar</button></td>
      <td><button type="button" class="btn btn-danger">Rechazar</button></td>
    </tr>
    <%
            }
        %>
  </tbody>
</table>

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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
