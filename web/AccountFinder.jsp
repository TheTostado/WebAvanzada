<%-- 
    Document   : AccountFinder
    Created on : 23/11/2020, 03:51:53 AM
    Author     : Alrik
--%>

<%@page import="APIResponse.AccountFinderResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account data</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="ArchivosImg/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ArchivosImg/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ArchivosImg/css/util.css">
	<link rel="stylesheet" type="text/css" href="ArchivosImg/css/main.css">
<!--===============================================================================================-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/AccountFinder.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
    </head>
    <body>
        
        
        
        <br>  
        <div id="contenedorAF">
            <div class="wrap-login100">
				<form class="login100-form validate-form" action="RegistroServlet" method="POST">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Account data
					</span>
                                        <div class="wrap-input100 validate-input" data-validate = "Enter Names">
						<input class="input100" type="text" name="id" placeholder="ID:">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter Names">
						<input class="input100" type="text" name="nombre" placeholder="Name">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                        <div class="wrap-input100 validate-input" data-validate = "Last names">
						<input class="input100" type="text" name="apellido" placeholder="Last name">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="contrasena" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
                                        <div class="wrap-input100 validate-input" data-validate = "Enter E-mail">
						<input class="input100" type="email" name="correo" placeholder="E-mail">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					
                                        

					<div class="text-center p-t-90" >
						<a class="txt1" href="index.jsp" >
							Return
						</a>
					</div>   
            </form>
				</form>
                            
			</div>
            
            
            
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <!--===============================================================================================-->
	<script src="ArchivosImg/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/vendor/bootstrap/js/popper.js"></script>
	<script src="ArchivosImg/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/vendor/daterangepicker/moment.min.js"></script>
	<script src="ArchivosImg/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="ArchivosImg/js/main.js"></script>
    </body>
</html>
