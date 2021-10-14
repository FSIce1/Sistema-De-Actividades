<%@page import="modelos.Modelo_Cargo"%>
<%@page import="java.util.List"%>
<%@page import="beans.Cargo"%>
<!doctype html>

<jsp:useBean id="INSERTARUSUARIO" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="ALERTA" scope="request" class="java.lang.String"></jsp:useBean>


<html lang="en">
    <head>

        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    
        
        <title>Nuevo Usuario</title>
        
        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        
        <script src="js/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>

        <%
            if(session.getAttribute("dniCUENTA")==null){
                %>
                    <jsp:include page="Controlador_Logueo?opcion=Y"/>
                <%
            }
        %>

        
    <script>

            function validacion(mensaje) {

                if($("#comboCargo").val() == "") {
                   alert("Seleccione su cargo");
                   document.getElementById('comboCargo').focus();
                   return false;

                } 

                return confirm(mensaje);
                
            }

    </script>
        
        
    <script>

        function alerta(mensaje){
             return confirm(mensaje);
        }

    </script> 

        
        <!--Colores para el menú: "blue | azure | green | orange | red | purple"-->
        
        <div class="wrapper">
            <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-4.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    
                    <div class="logo">
                        <a href="#" class="simple-text">
                            Sistema de actividades
                        </a>
                    </div>

                    <ul class="nav">
                        
                        <li class="">
                            <a href="Inicio.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Perfil de Usuario</p>
                            </a>
                        </li>
                        
                        <%
                            if(session.getAttribute("tipoCUENTA").equals("1")){
                                %>

                                <li class="nav-item active">

                                    <a class="nav-link" data-toggle="collapse" href="#componentsExamples">
                                        <i class="pe-7s-users"></i>
                                        <p>Usuarios<b class="caret"></b></p>
                                    </a>

                                    <div class="collapse" id="componentsExamples">
                                        <ul class="nav">

                                            <li class="nav-item active">
                                                <a class="nav-link" href="Controlador_Usuario?opcion=N">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registrar Usuario</span>
                                                </a>
                                            </li>

                                            <li class="nav-item ">
                                                <a class="nav-link" href="Controlador_Usuario?opcion=L">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lista de Usuarios</span>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </li>

                                <li>
                                    <a href="Calendario_Actividades.jsp">
                                        <i class="pe-7s-keypad"></i>
                                        <p>Ver Calendario</p>
                                    </a>
                                </li>

                                <li>
                                    <a href="store_Cal_Data?opcion=L">
                                        <i class="pe-7s-note2"></i>
                                        <p>Ver Lista de eventos</p>
                                    </a>
                                </li>


                                <li class="nav-item">

                                    <a class="nav-link" data-toggle="collapse" href="#componentsEstadisticas">
                                        <i class="pe-7s-users"></i>
                                        <p>Estadísticas<b class="caret"></b></p>
                                    </a>

                                    <div class="collapse" id="componentsEstadisticas">
                                        <ul class="nav">

                                            <li class="nav-item ">
                                                <a class="nav-link" href="Estadisticas_Hecho.jsp">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hecho</span>
                                                </a>
                                            </li>

                                            <li class="nav-item ">
                                                <a class="nav-link" href="Estadisticas_Planificado.jsp">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Planificado</span>
                                                </a>
                                            </li>
                                            
                                            <!--
                                            <li class="nav-item ">
                                                <a class="nav-link" href="Estadisticas_Tareas.jsp">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Avance del evento</span>
                                                </a>
                                            </li>
                                            -->
                                            
                                        </ul>
                                    </div>
                                </li>
                        
                        <%
                            } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                %>

                                <li>
                                    <a href="Controlador_Activiades?opcion=A">
                                        <i class="pe-7s-news-paper"></i>
                                        <p>Mi Lista de Actividades</p>
                                    </a>
                                </li>

                                
                                <%
                            }
                        %>
                        
                    </ul>
                    
                </div>
                
                
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#"><%=session.getAttribute("nombresCUENTA")%> <%=session.getAttribute("apellidosCUENTA")%></a>
                        </div>
                        
                        <div class="collapse navbar-collapse">
                        
                            <!--
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-dashboard"></i>
                                        <p class="hidden-lg hidden-md">Dashboard</p>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-globe"></i>
                                        <b class="caret hidden-sm hidden-xs"></b>
                                        <span class="notification hidden-sm hidden-xs">5</span>
                                        <p class="hidden-lg hidden-md">
                                            5 Notifications
                                            <b class="caret"></b>
                                        </p>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Notification 1</a></li>
                                        <li><a href="#">Notification 2</a></li>
                                        <li><a href="#">Notification 3</a></li>
                                        <li><a href="#">Notification 4</a></li>
                                        <li><a href="#">Another notification</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">
                                        <i class="fa fa-search"></i>
                                        <p class="hidden-lg hidden-md">Search</p>
                                    </a>
                                </li>
                            </ul>
                            -->
                            
                            <ul class="nav navbar-nav navbar-right">
                                <!--  
                                <li>
                                    <a href="">
                                        <p>Account</p>
                                    </a>
                                </li>
                                -->
                                <li class="dropdown">
                                    
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <p>
                                            Opciones
                                            <b class="caret"></b>
                                        </p>
                                    </a>
                                    
                                    <ul class="dropdown-menu">
                                        <!--
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li class="divider"></li>
                                        -->
                                        <li><a href="Controlador_Logueo?opcion=C">Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                                
                                <!--
                                <li>
                                    <a href="#">
                                        <p>Log out</p>
                                    </a>
                                </li>
                                -->
                                
                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-15">
                                <div class="card">

                                    
                                    <%
                                      if(INSERTARUSUARIO!=null){  
                                        if(INSERTARUSUARIO.equals("INSERTARUSUARIO")){
                                        %>
                                            <div class="header">
                                                <h4 class="title">Registro de Usuario</h4>
                                            </div>
                                        <%
                                        } else if(INSERTARUSUARIO.equals("MODIFICARUSUARIO")){
                                        %>
                                            <div class="header">
                                                <h4 class="title">Modificar Usuario</h4>
                                            </div>
                                        <%

                                        }
                                    }
                                    %>
                                    
                                    <div class="content">
                                        <form autocomplete="off" action="Controlador_Usuario">

                                            <input type="hidden" name="txtId" value="${id}">
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Nombres</label>
                                                        <input type="text" name="txtNombres" class="form-control" maxlength="45" placeholder="Nombres" required pattern="([a-zA-ZÁÉÍÓÚñáéíóú]{1,}[\s]*)+" title="No se permiten números ni caracteres especiales" value="${nombres}">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Apellidos</label>
                                                        <input type="text" name="txtApellidos" class="form-control" maxlength="45" placeholder="Apellidos" required pattern="([a-zA-ZÁÉÍÓÚñáéíóú]{1,}[\s]*)+" title="No se permiten números ni caracteres especiales" value="${apellidos}">
                                                    </div>
                                                </div>

                                            </div>
                                            
                                            <%
                                                if(INSERTARUSUARIO!=null){  
                                                  if(INSERTARUSUARIO.equals("INSERTARUSUARIO")){
                                                        %>
                                                    
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Contraseña</label>
                                                                        <input type="password" name="txtContra" class="form-control" maxlength="25" placeholder="Contraseña" required value="${contraseña}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    
                                                        <%
                                                    } 
                                                }
                                            %>

                                                    
                                            

                                            <div class="row">        
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>DNI</label>
                                                        <input type="text" name="txtDni" onkeyup="limpiarNumero(this)" onchange="limpiarNumero(this)" maxlength="8" pattern="[0-9]{8}" title="Deben ser 8 dígitos" class="form-control" placeholder="Dni" required value="${dni}">
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="email" name="txtEmail" class="form-control" maxlength="35" placeholder="Email" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" title="el email es requerido" value="${email}">
                                                    </div>
                                                </div>
                                                    <div class="col-md-4">
                                                    
                                                    <div class="form-group">
                                                    <label>Cargo</label>
                                                        <select name="txtCargo" id="comboCargo" class="form-control">
                                                       
                                                            <option value="" selected="">Seleccione un cargo</option>
                                                                
                                                        <%
                                                            List<Cargo> cargos = Modelo_Cargo.listaCargos();
                                                            
                                                            for (Cargo c : cargos) {
                                                                %>
                                                                    <option value="<%=c.getId_cargo()%>"><%=c.getNombre_cargo()%></option>
                                                                <%
                                                            }
                                                        %>
                                                        
                                                        </select>
                                                    </div>
                                                </div>     
                                            </div>
                                                    
                                                        
                                                              
                                            <script>

                                                $("#comboCargo").val('${cargo}');
                                            </script>
                                            
                                                    
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Información</label>
                                                        <textarea rows="5" name="txtDescripcion" class="form-control" placeholder="Aquí ingresa la información del usuario">
                                                            <%
                                                                if (request.getParameter("txtDescripcion") != null) {
                                                                    out.print("\n" + request.getParameter("txtDescripcion"));
                                                                }
                                                            %>                                                            
                                                        </textarea>
                                                    </div>
                                                </div>
                                            </div>
                                                        
                                                        

                                            <input type="hidden" name="txtContra" value="${contraseña}">
                                                        

                                        <%
                                            if(INSERTARUSUARIO!=null){  
                                                if(INSERTARUSUARIO.equals("INSERTARUSUARIO")){
                                                    %>

                                                    <input type="hidden" name="opcion" value="I">        
                                                    <button type="submit" onclick="return validacion('¿Desea Registrar?')" class="btn btn-info btn-fill pull-right">Registrar</button>

                                                    <%
                                                } else if(INSERTARUSUARIO.equals("MODIFICARUSUARIO")){
                                                    %>
                                                    
                                                    <input type="hidden" name="opcion" value="D">        
                                                    <button type="submit" onclick="return validacion('¿Desea Modificar?')" class="btn btn-info btn-fill pull-right">Guardar cambios</button>
        
                                                    <%
                                                }
                                            }
                                        %>
                                            

                                            <!--
                                            <button class="tn btn-info btn-fill pull-right" onclick="showNotification('top','right')">Top Right Notification</button>-->


                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
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
        
        
        
        <script type="text/javascript">
            var t;
            window.onload=resetTimer;
            document.onkeypress=resetTimer;
            document.onmousemove;
            
            function logout(){

                <%
                    if(session.getAttribute("dniCUENTA")==null){
                        %>
                            alert("La sesión ha expirado por inactividad, vuelva a loguerse");
                            location.href='SesionExpirada.html'; 

                        <%
                    }
                %>

                
            }

            function resetTimer(){
                clearTimeout(t);
                t=setTimeout(logout,300000); //5 minutos de inactividad, tiempo en ms
            }
        </script>            

    </body>
    
    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>

    <%
        if(ALERTA!=null){
            
            if(ALERTA.equals("CORRECTO")){
                %>
                
                <script>
                        
                            $.notify({
                            icon: 'pe-7s-smile',
                            message: "Usuario registrado correctamente"

                        },{
                            type: 'success',
                            timer: 4000
                        });

                </script>

                
                <%
            } else if(ALERTA.equals("INCORRECTO")){
                %>
                <script>
                            $.notify({
                            icon: 'pe-7s-smile',
                            message: "El usuario no pudo ser registrado"

                        },{
                            type: 'danger',
                            timer: 4000
                        });

                </script>

                
                <%
            }
            
        }
            

    %>
    
    
</html>