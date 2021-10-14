<%@page import="modelos.Modelo_Actividad"%>
<%@page import="beans.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Modelo_Usuario"%>
<%@page import="beans.Usuario"%>
<%@page import="java.util.List"%>

<jsp:useBean id="ID" scope="request" class="java.lang.String"></jsp:useBean>

<!doctype html>

<html lang="en">
    <head>
        
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Lista de Actividades</title>


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
        
        <link href="https://fonts.googleapis.com/css?family=Chonburi|Josefin+Sans" rel="stylesheet">

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

            function validacion(mensaje) {

                if($("#comboPersona").val() == "") {
                   alert("Seleccione al encargado de la actividad");
                   document.getElementById('comboPersona').focus();
                   return false;
                } else if(!($("#porcentajeActividad").val()<=100)){
                    alert("El intervalo de procentaje debe estar entre 0 y 100");
                    document.getElementById('porcentajeActividad').focus();
                    return false;
                } 
                
                

                return confirm(mensaje);

            }
            
            function validacion2(mensaje) {
                
                if($("#comboPersona2").val() == "") {
                   alert("Seleccione al encargado de la actividad");
                   document.getElementById('comboPersona2').focus();
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
                            
                            <input type="image" src="images/asignar.png" data-toggle="modal" title="Asignar tarea" data-target="#exampleModal2"/><br>
                            
                            
                            <div class="col-md-12">
                                <div class="card data-tables">
                                    
                                    <%
                                        
                                        if(ID!=null){
                                          
                                        //List<Actividad> listaActividades = Modelo_Actividad.listaActividades(Integer.parseInt(request.getParameter("id")));
                                            
                                        List<Actividad> listaActividades = Modelo_Actividad.listaActividades(Integer.parseInt(ID),-1);

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
                                                                <th>Encargado</th>
                                                                <th>Porcentaje</th>
                                                                <th class="disabled-sorting">M</th>
                                                                <th class="disabled-sorting">E</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>

                                                            <%

                                                                for (Actividad a : listaActividades) {

                                                            %>

                                                                <tr>
                                                                    <td><%=a.getDescripcion_actividad()%></td>
                                                                    <td><%=a.getId_usuario().getNombreCompleto()%></td>
                                                                    <td><%=a.getPorcentaje_actividad()%> %</td>
                                                                    
                                                                    <td>
                                                                        
                                                                        <input type="image" src="images/editar1.png" data-toggle="modal" title="Asignar tarea" data-target="#exampleModal" onclick="recibir(<%=a.getId_actividad()%>, '<%=a.getDescripcion_actividad()%>',<%=a.getPorcentaje_actividad()%>,<%=a.getId_usuario().getId_usuario()%>,<%=a.getConfirmar_actividad()%>)"/><br>
                                                                            
                                                                            
<!--                                                                        <form action="store_Cal_Data" method="post">

                                                                            <input type="hidden" name="opcion" value="M">

                                                                            <input type="hidden" name="txtId" id="idE" value="<%=a.getId_actividad()%>">  
                                                                            <input type="hidden" name="txtDescripcion" value="<%=a.getDescripcion_actividad()%>"> 
                                                                            <input type="hidden" name="txtIdUsuario" value="<%=a.getId_usuario().getId_usuario()%>"> 

                                                                            <input type="image" src="images/editar1.png" title="Modificar" onclick="return alerta('¿Desea Modificar?')">

                                                                        </form>-->

                                                                    </td>

                                                                    <td>

                                                                        <form action="Controlador_Actividad" method="post">
                                                                            
                                                                            <input type="hidden" name="txtId" value="<%=a.getId_actividad()%>">  
                                                                            <input type="hidden" class="control-label" name="txtIdEvento" value="${ID}">
                                                                            <input type="hidden" name="opcion" value="E">
                                                                            
                                                                            <input type="image" src="images/eliminar1.png" title="Eliminar" onclick="return alerta('¿Desea Eliminar?')">
                                                                                
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
                                                    <div class="panel-body">No hay actividades asignadas</div>
                                                </div>
                                            <%
                                        } 
                                            
                                    } else {
                                        
                                        %>
                                            <div class="panel panel-primary">
                                                <div class="panel-heading">Mensaje</div>
                                                <div class="panel-body">No se puede acceder a esta página desde un link, intente acceder desde lista de eventos</div>
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
            
            function recibir(codigo,nombre,porcentaje,id,estado){
                document.getElementById("idActividad").value=codigo;        
                document.getElementById("descActividad").value=nombre;        
                document.getElementById("porcentajeActividad").value=porcentaje;        
                document.getElementById("comboPersona").value=id;        
                document.getElementById("cbxRealizado").checked=estado;        
            }        
            
        </script> 
        
        <form action="Controlador_Actividad" method="post" autocomplete="off">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title" id="exampleModalLabel">Modificar actividad</h4>
                        </div>

                        <div class="modal-body">

                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="form-group">
                                    <label>Persona Asignada</label>
                                        <select required="required" name="txtPersonaActividad" id="comboPersona" class="form-control">
                                        
                                        <option value="" >Seleccione al encargado de la actividad</option>

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
                            
                            <input type="hidden" class="control-label" name="txtIdActividad" id="idActividad">
                            
                            <input type="hidden" class="control-label" name="txtIdEvento" value="${ID}">
                            
                            <input type="hidden" name="opcion" value="D">
                            
                            
                            <!--                            
                                <input type="text" class="control-label" name="txtIdActividad" id="cbxRealizado">
                            -->
                            
                            <div class="form-group">
                                <label for="porcentajeActividad">Porcentaje</label>
                                <input type="text" id="porcentajeActividad" name="txtPorcentaje" onkeyup="limpiarNumero(this)" onchange="limpiarNumero(this)" pattern="[0-9]{1,3}" maxlength="3" class="form-control" value="">
                            </div>
                           
                            <div class="checkbox">
                                <input name="cbxRealizado" type="checkbox" id="cbxRealizado">
                                <label for="cbxRealizado">¿Confirmar porcentaje?</label>
                            </div>
                            
                            <script>
                                //$("input:txtVerPeli[value=1]").attr("checked",true);
                                //$('input[name=txtVerPeli]').attr('checked', true);
                                $('input[value=1]').attr('checked', true);
                            </script>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            
                            <button type="submit" onclick="return validacion('¿Desea modificar actividad?')" class="btn btn-primary">Modificar</button>
                        </div>

                    </div>
                </div>
            </div>

        </form>
                            
                            
         
        <form action="Controlador_Actividad" method="post" autocomplete="off">
            <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">Registrar actividad</h4>
                        </div>

                        <div class="modal-body">

                            <input type="hidden" name="opcion" value="I">
                            
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="form-group">
                                    <label>Persona Asignada</label>
                                        <select required="required" name="txtPersonaActividad" id="comboPersona2" class="form-control">
                                        
                                        <option value="">Seleccione al encargado de la actividad</option>

                                        <%
                                            List<Usuario> usuarios2 = Modelo_Usuario.listaUsuarios("usuarios");

                                            for (Usuario c1 : usuarios2) {
                                                %>
                                                    <option value="<%=c1.getId_usuario()%>"><%=c1.getNombreCompleto()%></option>
                                                <%
                                            }
                                        %>

                                        </select>
                                    </div>
                                </div>
                            </div>
<!--       
                            <div class="form-group">
                                <label for="porcentajeActividad2" class="control-label">Porcentaje</label>
                                <input type="text" required="required" id="porcentajeActividad2" name="txtPorcentaje" onkeyup="limpiarNumero(this)" onchange="limpiarNumero(this)" pattern="[0-9]{1,3}" maxlength="3" class="form-control" value="">
                            </div>  
                            -->
                            <div class="form-group">
                                <label for="descActividad" class="control-label">Descripcion</label>
                                <textarea rows="5" required="required" name="txtDescripcionActividad" class="form-control" id="descActividad" ></textarea>
                            </div>
                            
                            <input type="hidden" class="control-label" name="txtIdEvento" value="${ID}">
                            
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            
                            <button type="submit" onclick="return validacion2('¿Desea asignar actividad?')" class="btn btn-primary">Registrar</button>
                        </div>

                    </div>
                </div>
            </div>

        </form>                   
                            
                                   
<!--        
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
          -->

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
    
    <script>
        function limpiarNumero(obj) {
            /* El evento "change" sólo saltará si son diferentes */
            obj.value = obj.value.replace(/\D/g, '');
            
          }
    </script>
    
</html>