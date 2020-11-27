<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Verificacion</title>
    </head>
    <body>
        <br>  
        <div id="contenedor1">
            <h2>Ingrese el codigo de verificacion para continuar</h2>
            <form action="LoginServlet2FA" id="form1" method="POST">
                <input type="text" name="codigo" placeholder="Codigo de verificacion"/>
                <hr>
                <input type="submit" value="Ingresar"/>
            </form>
        </div><br><br><br>
    </body>
</html>
