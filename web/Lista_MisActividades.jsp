
<%@page import="modelos.Modelo_Actividad"%>
<%@page import="beans.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Modelo_Usuario"%>
<%@page import="beans.Usuario"%>
<%@page import="java.util.List"%>

<!doctype html>

<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Mis Actividades</title>

        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        
        <link href="assets/css/light-bootstrap-dashboard_1.css" rel="stylesheet" type="text/css"/>

        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        
        <script src="js/jquery.min.js" type="text/javascript"></script>
        
        <link href="https://fonts.googleapis.com/css?family=Chonburi|Josefin+Sans" rel="stylesheet">

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

        <style>
            .letra1{
                font-family: 'Josefin Sans', sans-serif;
            }
            
            .letra2{
                font-family: 'Chonburi', cursive;
                font-size: 30px;
            }
        </style>
        
        <script>

            function alerta(mensaje){
                 return confirm(mensaje);
            }

        </script> 
        
        <script>
            
            function validacion(mensaje) {
                
                if(!($("#porcentajeActividad").val()<=100)){
                    alert("El intervalo de procentaje debe estar entre 0 y 100");
                    document.getElementById('porcentajeActividad').focus();
                    return false;
                } 
                
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
                        
                                <li class="nav-item">

                                    <a class="nav-link" data-toggle="collapse" href="#componentsExamples">
                                        <i class="pe-7s-users"></i>
                                        <p>Usuarios<b class="caret"></b></p>
                                    </a>

                                    <div class="collapse" id="componentsExamples">
                                        <ul class="nav">

                                            <li class="nav-item">
                                                <a class="nav-link" href="Controlador_Usuario?opcion=N">
                                                    <span class="sidebar-normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registrar Usuario</span>
                                                </a>
                                            </li>

                                            <li class="nav-item">
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

                                <li class="active">
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

                                <li class="active">
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
                            
                            <h1 class="letra2"> Lista de Actividades</h1>
                            
                            <div class="col-md-12">
                                <div class="card data-tables">
                                    
                                    <%
                                        
                                        List<Actividad> listaActividades = Modelo_Actividad.listaActividades(-1,Integer.parseInt(String.valueOf(session.getAttribute("idCUENTA"))));

                                        if(listaActividades.size()!=0){
                                            
                                            %>

                                            <div class="card-body table-striped table-no-bordered table-hover dataTable dtr-inline table-full-width">
                                                <div class="toolbar">

                                                </div>

                                                <div class="fresh-datatables">
                                                    <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>Descripción</th>
                                                                <th>Nombre del Evento</th>
                                                                <th>Porcentaje de Actividad</th>
                                                                <th>Estado</th>    
                                                                <th>M</th>    
                                                                <th>Subir Reporte</th>    
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                            
                                                            <%
                                                                for (Actividad a : listaActividades) {
                                                            %>

                                                                <tr>
                                                                    <td><%=a.getDescripcion_actividad()%></td>
                                                                    <td><%=a.getId_evento().getDescripcion()%></td>
                                                                    <td><%=a.getPorcentaje_actividad()%> %</td>
                                                                    
                                                                    <%
                                                                        if(a.getConfirmar_actividad()==1){
                                                                            %>
                                                                                <td>Confirmado</td>
                                                                            <%
                                                                        } else if(a.getConfirmar_actividad()==0){
                                                                            %>
                                                                                <td>Sin Confirmar</td>
                                                                            <%
                                                                        }
                                                                    %>
                                                                    
                                                                    <td>
                                                                        <input type="image" src="images/editar1.png" data-toggle="modal" title="Asignar tarea" data-target="#exampleModal2" onclick="recibir(<%=a.getId_actividad()%>, '<%=a.getDescripcion_actividad()%>',<%=a.getPorcentaje_actividad()%>)"/><br>
                                                                    </td>
                                                                    
                                                                    <td><a href="#">Ver Reporte</a></td>
                                                                    
                                                                </tr>

                                                            <%
                                                                }
                                                            %>


                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                            
                                            <%
                                        } else {
                                            %>
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">Mensaje</div>
                                                    <div class="panel-body">No hay actividades asignadas</div>
                                                </div>
                                            <%
                                        } 
                                    %>
                                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script>
            
            function recibir(codigo,descripcion,porcentaje){
                document.getElementById("idActividad").value=codigo;        
                document.getElementById("descActividad").value=descripcion;        
                document.getElementById("porcentajeActividad").value=porcentaje;        
            c}        
            
        </script>                             
                                    
        <form action="Controlador_Actividad" method="post" autocomplete="off">
            <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">Registrar actividad</h4>
                        </div>

                        <div class="modal-body">

                            <input type="hidden" name="opcion" value="X">
                                                    
                            <input type="hidden" id="idActividad" name="txtIdActividad">
                            
                            <div class="form-group">
                                <label for="descActividad" class="control-label">Descripcion</label>
                                <textarea rows="5" required="required" disabled="" name="txtDescripcionActividad" class="form-control" id="descActividad"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="porcentajeActividad" class="control-label">Porcentaje</label>
                                <input type="text" required="required" id="porcentajeActividad" name="txtPorcentaje" onkeyup="limpiarNumero(this)" onchange="limpiarNumero(this)" pattern="[0-9]{1,3}" maxlength="3" class="form-control" value="">
                            </div>  
                            
                            <div class="form-group">
                                <label for="reporteActividad" class="control-label"><strong>Reporte</strong></label>
                                <input type="file" name="reporteActividad" id="reporteActividad" class="inputfile custom" accept="application/pdf">
                            </div>
                            
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            
                            <button type="submit" onclick="return validacion('¿Desea asignar actividad?')" class="btn btn-primary">Registrar</button>
                        </div>

                    </div>
                </div>
            </div>

        </form>                   
                            
                                    
                                    
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