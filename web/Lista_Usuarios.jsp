<%@page import="modelos.Modelo_Usuario"%>
<%@page import="beans.Usuario"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Lista de usuarios</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>


        <!--
        
            <link href="assets/css/bootstrap.min_1.css" rel="stylesheet" type="text/css"/>
        
            <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>
        
        
        -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        
        <link href="assets/css/light-bootstrap-dashboard_1.css" rel="stylesheet" type="text/css"/>

        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
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

            function alerta(mensaje){
                 return confirm(mensaje);
            }

        </script> 

        
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

                        <li class="">
                            <a href="Inicio.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Perfil del Usuario</p>
                            </a>
                        </li>
                        
                        <%
                            if(session.getAttribute("tipoCUENTA").equals("1")){
                                %>

                                <li class="nav-item active">

                                    <a class="nav-link" data-toggle="collapse" href="#componentsExamples">
                                        <i class="pe-7s-users active"></i>
                                        <p>Usuarios<b class="caret"></b></p>
                                    </a>

                                    <div class="collapse" id="componentsExamples">
                                        <ul class="nav">

                                            <li class="nav-item ">
                                                <a class="nav-link" href="Controlador_Usuario?opcion=N">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registrar Usuario</span>
                                                </a>
                                            </li>

                                            <li class="nav-item active">
                                                <a class="nav-link" href="#">
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
                        
                            <ul class="nav navbar-nav navbar-right">
                                
                                <li class="dropdown">
                                    
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <p>
                                            Opciones
                                            <b class="caret"></b>
                                        </p>
                                    </a>
                                    
                                    <ul class="dropdown-menu">
                                      
                                        <li><a href="Controlador_Logueo?opcion=C">Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                                
                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card data-tables">
                                    <div class="card-body table-striped table-no-bordered table-hover dataTable dtr-inline table-full-width">
                                        <div class="toolbar">
                                            
                                        </div>
                                        <div class="fresh-datatables">
                                            <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th>DNI</th>
                                                        <th>Nombres</th>
                                                        <th>Apellidos</th>
                                                        <th>Cargo</th>
                                                        <th>E-mail</th>
                                                        <th>Estado</th>
                                                        <th class="disabled-sorting">M</th>
                                                        <th class="disabled-sorting">H/I</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                    
                                                    <%
                                                    
                                                        List<Usuario> listaUsuarios = Modelo_Usuario.listaUsuarios("usuario");
                                                    

                                                        for (Usuario u : listaUsuarios) {
                                                            
                                                    %>
                                                        
                                                        <tr>
                                                            <td><%=u.getDni_usuario()%></td>
                                                            <td><%=u.getNombres_usuario()%></td>
                                                            <td><%=u.getApellidos_usuario()%></td>
                                                            <td><%=u.getCargo_usuario().getNombre_cargo()%></td>
                                                            <td><%=u.getEmail_usuario()%></td>
                                                            
                                                            <%
                                                                if(u.getEstado_usuario()==0){
                                                            %>
                                                                <td>Activo</td>
                                                            <%
                                                                } else if(u.getEstado_usuario()==1) {
                                                            %>

                                                                <td>Inactivo</td>
                                                                   
                                                            <%
                                                                }
                                                            %>
                                                            
                                                            <td>
                                                                
                                                                <form action="Controlador_Usuario" method="post">
                                
                                                                    <input type="hidden" name="opcion" value="M">

                                                                    <input type="hidden" name="txtId" value="<%=u.getId_usuario()%>"> 
                                                                    <input type="hidden" name="txtDni" value="<%=u.getDni_usuario()%>"> 
                                                                    <input type="hidden" name="txtNombres" value="<%=u.getNombres_usuario()%>"> 
                                                                    <input type="hidden" name="txtApellidos" value="<%=u.getApellidos_usuario()%>"> 
                                                                    <input type="hidden" name="txtCargo" value="<%=u.getCargo_usuario().getId_cargo()%>"> 
                                                                    <input type="hidden" name="txtEmail" value="<%=u.getEmail_usuario()%>"> 
                                                                    <input type="hidden" name="txtDescripcion" value="<%=u.getDesc_usuario()%>"> 
                                                                    
                                                                    <input type="image" src="images/editar1.png" onclick="return alerta('¿Desea Modificar?')">

                                                                </form>
                                                                     
                                                                <!--
                                                                    <a href="#" class="btn btn-link btn-info like"><i class="fa fa-heart"></i></a>
                                                                    <a href="#" class="btn btn-link btn-warning edit"><i class="fa fa-edit"></i></a>
                                                                    <a href="#" class="btn btn-link btn-danger remove"><i class="fa fa-times"></i></a>
                                                                -->
                                                                
                                                            </td>
                                                            
                                                            <td>
                                                                
                                                                <form action="Controlador_Usuario" method="post">
                                                                    
                                                                    <input type="hidden" name="txtId" value="<%=u.getId_usuario()%>"> 
                                                                    
                                                                    <input type="hidden" name="opcion" value="E">

                                                                    <%
                                                                        
                                                                        if(u.getEstado_usuario()==0){
                                                                            %>
                                                                                <input type="image" title="Inhabilitar" src="images/buena.png" onclick="return alerta('¿Desea Inhabilitar Usuario?')">
                                                                                <input type="hidden" name="estado" value="Activo">  
                                                                            <%
                                                                        } else if(u.getEstado_usuario()==1){
                                                                            %>
                                                                    
                                                                                <input type="image" title="Habilitar" src="images/mala.png" onclick="return alerta('¿Desea Habilitar Usuario?')">
                                                                                <input type="hidden" name="estado" value="Inactivo">    
                                                                            <%
                                                                        }
                                                                    
                                                                    %>
                                                                    
                                                                </form>
                                                                        
                                                                    
                                                               
                                                            </td>
                                                            
                                                        </tr>
                                                        
                                                    <%
                                                        }
                                                    %>
                                                    
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

                                                    
                                                    
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


    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <!--<script src="assets/js/core/popper.min.js" type="text/javascript"></script>-->
    <!--<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>-->
    <script src="assets/js/plugins/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#datatables').DataTable({
                "pagingType": "full_numbers",
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "Todo"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Buscar registros",
                }

            });


            var table = $('#datatables').DataTable();

            // Edit record
            table.on('click', '.edit', function () {
                $tr = $(this).closest('tr');

                if ($tr.hasClass('child')) {
                    $tr = $tr.prev('.parent');
                }

                var data = table.row($tr).data();
                alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
            });

            // Delete a record
            table.on('click', '.remove', function (e) {
                $tr = $(this).closest('tr');
                table.row($tr).remove().draw();
                e.preventDefault();
            });

            //Like record
            table.on('click', '.like', function () {
                alert('Hiciste clic en el botón Me gusta');
            });
        });
    </script>
        
    
</html>