<%-- 
    Document   : LoginSuccess
    Created on : 15/11/2020, 07:53:00 PM
    Author     : USUARIO HP
--%>
<%@page import="APIResponse.LoginResponse2FA"%>
<%@page import="APIResponse.LoginResponse"%>
<% LoginResponse2FA status = (LoginResponse2FA)request.getAttribute("loginresponse2fa");%>
<% LoginResponse2FA user_id = (LoginResponse2FA)request.getAttribute("loginresponse2fa");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        
        <link rel="stylesheet" type="text/css" href="Ethereal/css/owl.transitions.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/simple-line-icons.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/animate.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/style.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/owl.carousel.css"/>
        <link rel="stylesheet" type="text/css" href="Ethereal/css/owl.theme.css"/>

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
        <div class="main-header" id="main-header">
  <nav class="navbar mynav navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="navbar-brand" href="#">Menu Admin</a> </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          
                
          <li><a href="LogoutServlet.java">Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>
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
<script src="Ethereal/js/jquery.min.js"></script> 
<script src="Ethereal/js/bootstrap.min.js"></script> 
<script type="Ethereal/text/javascript" src="Ethereal/js/owl.carousel.min.js"></script> 
<script type="Ethereal/text/javascript" src="Ethereal/js/jquery.countTo.js"></script> 
<script type="Ethereal/text/javascript" src="Ethereal/js/jquery.waypoints.min.js"></script> 
    </body>
</html>
