<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
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
        
    </head>
    
    <body>
        <br>  
        <div id="contenedorAF">
            <h1>Actualizar datos</h1>
            <form action="AccountUpdaterServlet" name="form1" id="form1" method="POST" >
                
                <input type="text" name="nombre" placeholder="Nombres"/>
                <hr>
                <input type="text" name="apellido" placeholder="Apellidos"/>
                <hr>
                <input type="password" name="contra" placeholder="Password"/>
                <hr>
                <!-- <input type="password" name="" placeholder="Password de nuevo"/>
                <hr> -->
                <input type="email" name ="correo"placeholder="Email" />
                <hr>
                <input type="submit" value="Actualizar"/>
                
            </form>
        </div><br><br><br>
    </body>
</html>