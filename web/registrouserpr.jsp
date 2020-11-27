
<%-- 
    Document   : registro
    Created on : 16/11/2020, 02:14:57 PM
    Author     : Hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    
    <body>
        <br>  
        <div id="contenedor4">
            <h1>Registro</h1>
            <form action="RegistroServlet" name="form1" id="form1" method="POST" >
                
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
                <h5>Cuenta empresarial(Costo adicional)</h5>
                <br> 
                <input type="radio" name = "rb" value="true" <h5> Si</h5 > 
                <hr>
                <input type="radio" name = "rb" value="false" <h5> No</h5> 
                <hr>

                <input type="submit" value="Registrar"/>
                
            </form>
            <form action="index.jsp" name="form1" id="form1" method="POST" ><input type="submit" value="Regresar"/></form>
        </div><br><br><br>
        
    </body>
</html>
