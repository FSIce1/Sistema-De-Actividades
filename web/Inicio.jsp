
<%@page import="modelos.Modelo_Cargo"%>
<%@page import="beans.Cargo"%>
<%@page import="java.util.List"%>
<%@page errorPage="Error404.html"%>

<!doctype html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Inicio</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


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
        
        <%
           if(session.getAttribute("dniCUENTA")==null){
               %>
                   <jsp:include page="Controlador_Logueo?opcion=Y"/>
               <%
           }
       %>


        
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
                        
                        <!--
                        <li>
                            <a href="dashboard.html">
                                <i class="pe-7s-graph"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        -->
                        
                        <li class="active">
                            <a href="Inicio.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Perfil del Usuario</p>
                            </a>
                        </li>
                        
                        
                        <%
                            if(session.getAttribute("tipoCUENTA").equals("1")){
                                %>
                                
                                <li class="nav-item">

                                    <a class="nav-link" data-toggle="collapse" href="#componentsExamples">
                                        <i class="pe-7s-users"></i>
                                        <p>Usuarios<b class="caret"></b></p>
                                    </a>

                                    <div class="collapse" id="componentsExamples">
                                        <ul class="nav">

                                            <li class="nav-item ">
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
                                    <a href="Controlador_Actividad?opcion=A">
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
                            
                            <ul class="nav navbar-nav navbar-right">
                        
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
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Editar Perfil</h4>
                                    </div>
                                    <div class="content">
                                        
                                        <form autocomplete="off" action="Controlador_Usuario" method="post">
                                            
                                            <input type="hidden" name="txtId" value="<%=session.getAttribute("idCUENTA")%>">
                                            
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Lugar de Trabajo</label>
                                                        <input type="text" class="form-control" disabled placeholder="Company" value="Palacio municipal">
                                                    </div>
                                                </div>
                                                
                                                <%
                                                    
                                                    if(session.getAttribute("tipoCUENTA").equals("1")){
                                                
                                                        %>
                                                        
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label>DNI</label>
                                                                    <input type="text" name="txtDni" class="form-control" placeholder="Dni" value="<%=session.getAttribute("dniCUENTA")%>">
                                                                </div>
                                                            </div>
                                                        
                                                        <%
                                                        
                                                    } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                                        
                                                        %>
                                                        
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label>DNI</label>
                                                                    <input type="text" name="txtDni" disabled="disabled" class="form-control" placeholder="Dni" value="<%=session.getAttribute("dniCUENTA")%>">
                                                                </div>
                                                            </div>
                                                                
                                                            <input type="hidden" name="txtDni" value="<%=session.getAttribute("dniCUENTA")%>">
                                              
                                                        <%

                                                    }
                                                
                                                %>
                                                
                                                    
                                                    
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                    <label>Email</label>
                                                        <input type="email" name="txtEmail" class="form-control" maxlength="35" placeholder="Email" required pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" value="<%=session.getAttribute("emailCUENTA")%>">
                                                    </div>
                                                </div>
                                                    
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Nombres</label>
                                                        <input type="text" name="txtNombres" class="form-control" maxlength="45" placeholder="Nombres" required pattern="([a-zA-ZÁÉÍÓÚñáéíóú]{1,}[\s]*)+" title="No se permiten números ni caracteres especiales" value="<%=session.getAttribute("nombresCUENTA")%>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Apellidos</label>
                                                        <input type="text" name="txtApellidos" class="form-control" maxlength="45" placeholder="apellidos" required pattern="([a-zA-ZÁÉÍÓÚñáéíóú]{1,}[\s]*)+" title="No se permiten números ni caracteres especiales" value="<%=session.getAttribute("apellidosCUENTA")%>">
                                                    </div>
                                                </div>
                                            </div>

                                                    
                                            <%
                                                if(session.getAttribute("tipoCUENTA").equals("1")){
                                                    %>
                                                    
                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <div class="form-group">

                                                                <label>Cargo</label>

                                                                <select name="txtCargo" id="comboCargo" class="form-control">
                                                                            
                                                                    <option value="">Seleccione Cargo</option>
                                                                    
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
                                                        $("#comboCargo").val('<%=session.getAttribute("cargoCUENTA")%>');
                                                    </script>
                                                    
                                                    
                                                    <%
                                                } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                                    %>
                                                        
                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <div class="form-group">

                                                                <label>Cargo</label>
                                                                <input type="text" name="txtCargo" disabled="" class="form-control" required value="<%=session.getAttribute("nombrecargoCUENTA")%>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                        
                                                               
                                                    <input type="hidden" name="txtCargo" value="<%=session.getAttribute("cargoCUENTA")%>">
                                              
                                                            
                                                    <%
                                                }
                                            %>        
                                                    
                                            
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Información</label>
                                                        <textarea rows="5" name="txtDescripcion" class="form-control" placeholder="Aquí ingresa tu descripción"><%=session.getAttribute("descCUENTA")%></textarea>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <input type="hidden" name="actualiza" value="actualiza">
                                                        
                                            <button type="submit" class="btn btn-info btn-fill pull-right" onclick="return validacion('¿Desea Guardar los cambios?')">Guardar cambios</button>
                                            <input type="hidden" name="opcion" value="D">
                                            
                                            <div class="clearfix"></div>
                                            
                                        </form>
                                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-user">
                                    <div class="image">
                                        <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                                    </div>
                                    
                                    <div class="content">
                                        <div class="author">
                                            <a href="#">
                                                
                                                <%
                                                    if(session.getAttribute("tipoCUENTA").equals("1")){
                                                        %>
                                                            <img class="avatar border-gray" src="images/Dario2.jpg">
                                                        <%
                                                    } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                                        %>
                                                            <img class="avatar border-gray" src="assets/img/face-0.jpg">
                                                        <%
                                                    }
                                                %>
                                                
                                                <h4 class="title"><%=session.getAttribute("nombresCUENTA")%><br/>
                                                    <small><%=session.getAttribute("dniCUENTA")%></small>
                                                </h4>
                                            </a>
                                        </div>
                                                
                                        <p class="description text-center"><%=session.getAttribute("descCUENTA")%></p>
                                    </div>
                                    <hr>
                                    <div class="text-center">
                                        <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                                        <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                                        <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

                                    
        <script type="text/javascript">
            $(document).ready(function () {
                $('select').material_select();
            });
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

</html>