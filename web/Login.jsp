<jsp:useBean id="ALERTA2" scope="request" class="java.lang.String"></jsp:useBean>

<!doctype html>
<html lang="en">

    <head>
        
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Logueo</title>
        
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->

        <link href="login/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="login/demo.css" rel="stylesheet" type="text/css"/>
        <link href="login/light-bootstrap-dashboard.css" rel="stylesheet" type="text/css"/>
        
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

    </head>

    <body>
        <div class="wrapper wrapper-full-page">
            <div class="full-page  section-image" data-color="black" data-image="images/imagenFondo.jpg">
                <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
                <div class="content">
                    <div class="container">
                        <div class="col-md-4 col-sm-6 ml-auto mr-auto">
                            
                            <form class="form" method="post" autocomplete="off" action="Controlador_Logueo">
                                <div class="card card-login card-hidden">
                                    <div class="card-header ">
                                        <h3 class="header text-center">Login</h3>
                                    </div>
                                    <div class="card-body ">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>Dni</label>
                                                <input type="text" name="dni123" onkeyup="limpiarNumero(this)" onchange="limpiarNumero(this)" placeholder="Ingrese dni" maxlength="8" pattern="[0-9]{8}" class="form-control" title="Deben ser 8 dígitos" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Contraseña</label>
                                                <input type="password" name="contra123" placeholder="Password" maxlength="35" class="form-control" required>
                                            </div>
        
                                        </div>
                                    </div>
                                    
                                    <input type="hidden" name="opcion" value="I">
                        
                                    <div class="card-footer ml-auto mr-auto">
                                        <button type="submit" class="btn btn-warning btn-wd">Iniciar Sesión</button>
                                    </div>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    
    
        <script>
            function limpiarNumero(obj) {
                /* El evento "change" sólo saltará si son diferentes */
                obj.value = obj.value.replace(/\D/g, '');
              }
        </script>
        
    </body>

    <script src="assets/js/bootstrap-notify.js" type="text/javascript"></script>
    <script src="login/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="login/demo.js" type="text/javascript"></script>
         
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    
    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    
    
    <%
        if(ALERTA2!=null){
            if(ALERTA2.equals("CONTRAINCORRECTA")){
                %>

                    <script>

                        $.notify({
                            icon: 'pe-7s-info',
                            message: "La contraseña ingresada no es correcta"

                        },{
                            type: 'danger',
                            timer: 4000
                        });

                    </script>
                
                <%
            } else if(ALERTA2.equals("USUARIOINCORRECTO")){
                %>

                    <script>
                        
                        $.notify({
                            icon: 'pe-7s-info',
                            message: "El usuario ingresado no existe"

                        },{
                            type: 'warning',
                            timer: 4000
                        });
                        
                    </script>


                <%
            }
        }
    %>

    
    
    <script>
        $(document).ready(function () {
            demo.checkFullPageBackgroundImage();

            setTimeout(function () {
                // after 1000 ms we add the class animated to the login/register card
                $('.card').removeClass('card-hidden');
            }, 700);
        });
    </script>
    
</html>