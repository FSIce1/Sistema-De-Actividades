<%@page import="modelos.Modelo_Evento"%>
<%@page import="beans.Evento"%>
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
    
        
        <title>Lista de eventos</title>


        <!-- Bootstrap core CSS     -->

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        
        <script src="js/jquery.min.js" type="text/javascript"></script>
        
        <style>
            .ima {
                background-image: url ('/images/asignar.png');
                cursor:pointer;
                border: none;
            }

        </style>
        
        
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

                if($("#comboPersona").val() == "") {
                   alert("Seleccione al encargado de la actividad");
                   document.getElementById('comboPersona').focus();
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
                                        <p>Estad�sticas<b class="caret"></b></p>
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
                                      
                                        <li><a href="Controlador_Logueo?opcion=C">Cerrar Sesi�n</a></li>
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
                                    
                                    <%
                                        
                                        List<Evento> listaEventos= new ArrayList<>();

                                        if(session.getAttribute("tipoCUENTA").equals("1")){
                                            listaEventos=Modelo_Evento.listaEventos("","1",0);  
                                        } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                           listaEventos=Modelo_Evento.listaEventos("","2",Integer.parseInt(String.valueOf(session.getAttribute("idCUENTA"))));
                                        }

                                        if(listaEventos.size()!=0){
                                            %>
                                            

                                            <div class="card-body table-striped table-no-bordered table-hover dataTable dtr-inline table-full-width">
                                                <div class="toolbar">

                                                </div>

                                                <div class="fresh-datatables">
                                                    <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Dia Inicial</th>
                                                                <th>D�a Final</th>
                                                                <th>D�a Terminado</th>
                                                                <th>Descripci�n</th>
                                                                <th class="disabled-sorting">M</th>
                                                                <th class="disabled-sorting">E</th>
                                                                
<!--                                                                <th class="disabled-sorting">A</th>
                                                                -->
                                                                <th class="disabled-sorting">L</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>

                                                            <%

                                                                for (Evento ev : listaEventos) {

                                                            %>

                                                                <tr>
                                                                    <td><%=ev.getIdEvento()%></td>
                                                                    <td><%=ev.getDiaInicio1()%></td>
                                                                    <td><%=ev.getDiaFinal1()%></td>

                                                                    <%
                                                                        if(ev.getDiaTerminado()==null){
                                                                    %>
                                                                        <td>No asignado</td>
                                                                    <%
                                                                        } else {
                                                                    %>

                                                                        <td><%=ev.getDiaTerminado()%></td>

                                                                    <%
                                                                        }
                                                                    %>


                                                                    <td><%=ev.getDescripcion()%></td>

                                                                    <td>

                                                                        <form action="store_Cal_Data" method="post">

                                                                            <input type="hidden" name="opcion" value="M">

                                                                            <input type="hidden" name="txtId" id="idE" value="<%=ev.getIdEvento()%>">  
                                                                            <input type="hidden" name="txtDiaInicio" value="<%=ev.getDiaInicio1()%>"> 
                                                                            <input type="hidden" name="txtDiaFinal" value="<%=ev.getDiaFinal1()%>"> 
                                                                            <input type="hidden" name="txtDiaTerminado" value="<%=ev.getDiaTerminado()%>"> 
                                                                            <input type="hidden" name="txtDescripcion" value="<%=ev.getDescripcion()%>"> 

                                                                            <input type="image" src="images/editar1.png" title="Modificar" onclick="return alerta('�Desea Modificar?')">

                                                                        </form>

                                                                    </td>

                                                                    <td>

                                                                        <form action="store_Cal_Data" method="post">

                                                                            <input type="hidden" name="txtId" value="<%=ev.getIdEvento()%>"> 

                                                                            <input type="hidden" name="opcion" value="D">

                                                                            <input type="image" src="images/eliminar1.png" title="Eliminar" onclick="return alerta('�Desea Eliminar?')">

                                                                        </form>    

                                                                    </td>

<!--                                                                    <td>

                                                                                                                                     
                                                                        <form data-toggle="modal" data-target="#exampleModal" method="post">
                                                                            <input type="image" src="images/asignar.png" data-toggle="modal" data-target="#exampleModal" onclick="recibir(<%=ev.getIdEvento()%>);"/><br>

                                                                        </form>
                                                                        

                                                                        <input type="image" src="images/asignar.png" data-toggle="modal" title="Asignar tarea" data-target="#exampleModal" onclick="recibir(<%=ev.getIdEvento()%>, '<%=ev.getDescripcion()%>' )"/><br>
                                                                                                                                        
                                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>

                                                                    </td>-->


                                                                    <td>

                                                                        <form action="Controlador_Actividad" method="post">

                                                                            <input type="hidden" name="txtId" value="<%=ev.getIdEvento()%>"> 

                                                                            <input type="hidden" name="opcion" value="L">

                                                                            <input type="image" src="images/lista.png" title="Ver actividades del evento" onclick="return alerta('�Desea Ver actividades?')">

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
                                            
                                            <%
                                        } else {
                                            %>
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">Mensaje</div>
                                                    <div class="panel-body">No hay eventos disponibles</div>
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
<!--
        <script>
            function recibir(codigo,nombre){
                document.getElementById("idEvento").value=codigo;        
                document.getElementById("nombreEvento").value=nombre;        
            }        
        </script> 
        
        <form action="Controlador_Actividad" method="post" autocomplete="off">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">Registrar actividad</h4>
                        </div>

                        <div class="modal-body">

                            
                            <input type="hidden" name="opcion" value="I">
                            
                            <div class="form-group">
                                <label for="nombreEvento" class="control-label">Evento</label>
                                <input type="text" class="form-control" disabled id="nombreEvento">
                            </div>
                                
                            
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="form-group">
                                    <label>Persona Asignada</label>
                                        <select required="required" name="txtPersonaActividad" id="comboPersona" class="form-control">
                                        
                                        <option value="">Seleccione al encargado de la actividad</option>

                                        <%
                                            List<Usuario> usuarios = Modelo_Usuario.listaUsuarios("usuarios");

                                            for (Usuario c : usuarios) {
                                                %>
                                                    <option value="<%=c.getId_usuario()%>"><%=c.getNombreCompleto()%></option>
                                                <%
                                            }
                                        %>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="descActividad" class="control-label">Descripcion</label>
                                <textarea rows="5" required="required" name="txtDescripcionActividad" class="form-control" id="descActividad" ></textarea>
                            </div>
                            
                            <input type="hidden" class="control-label" name="txtEventoActividad" id="idEvento">
                                        
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            
                            <button type="submit" onclick="return validacion('�Desea asignar actividad?')" class="btn btn-primary">Registrar</button>
                        </div>

                    </div>
                </div>
            </div>

        </form>
                                   -->
        
        <script type="text/javascript">
            var t;
            window.onload=resetTimer;
            document.onkeypress=resetTimer;
            document.onmousemove;
            
            function logout(){

                <%
                    if(session.getAttribute("dniCUENTA")==null){
                        %>
                            alert("La sesi�n ha expirado por inactividad, vuelva a loguerse");
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
                alert('Hiciste clic en el bot�n Me gusta');
            });
        });
    </script>
   
    
</html>