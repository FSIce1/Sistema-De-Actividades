<%@page import="modelos.Modelo_Evento"%>
<%@page import="beans.Evento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="algoritmos.PorcentajeFechas"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Estadísticas a completar</title>

        
        <style>

            * {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }

            *:before, *:after {
              box-sizing: inherit;
            }

            .container { margin: 150px auto;  width: 450px;
              font-family: "Open Sans", sans-serif;
              font-size: 14px; }
            body {

            }

            #skill {
              width: 100%;
              background-color: #e3e3e3;
              padding: 30px;
              display: block;
              border-radius: 5px;
              margin: auto;
            }

            h2{
              margin: 20px;
              text-align: center;
              font-weight: 700;
            }
        </style>

        <link rel="stylesheet" href="build/styles/an-skill-bar.css">

        
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

    </head>
    <body>
        
        <%
            if(session.getAttribute("idCUENTA")==null){
                %>
                    <jsp:include page="Controlador_Logueo?opcion=Y"/>
                <%
            }
        %>

        <div class="wrapper">
            <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-4.jpg">

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


                            <li class="nav-item active">

                                <a class="nav-link" data-toggle="collapse" href="#componentsEstadisticas">
                                    <i class="pe-7s-users"></i>
                                    <p>Estadísticas<b class="caret"></b></p>
                                </a>

                                <div class="collapse" id="componentsEstadisticas">
                                    <ul class="nav">

                                        <li class="nav-item active">
                                            <a class="nav-link" href="#">
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
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Porcentajes de eventos</h4>
                                        <p class="category">En relación con el tiempo seleccionado</p>
                                    </div>
                                    
                                    <!--
                                    <div class="content">
                                        <div id="chartHours" class="ct-chart"></div>
                                        <div class="footer">
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i> Open
                                                <i class="fa fa-circle text-danger"></i> Click
                                                <i class="fa fa-circle text-warning"></i> Click Second Time
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-history"></i> Updated 3 minutes ago
                                            </div>
                                        </div>
                                    </div>
                      
                                    
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <span class="sr-only">60% completado</span>
                                        </div>
                                    </div>      
                                    -->
                                    

                                    <div class="content">

                                        <%

                                            List<Evento> eventos= new ArrayList<>();
                                                        
                                            if(session.getAttribute("tipoCUENTA").equals("1")){
                                                eventos=Modelo_Evento.listaEventos("Date","1",0);  
                                            } else if(session.getAttribute("tipoCUENTA").equals("2")){
                                                eventos=Modelo_Evento.listaEventos("Date","2",Integer.parseInt(String.valueOf(session.getAttribute("idCUENTA"))));
                                            }
                                            
                                            int con=0;
                                            
                                            for (int j = 0; j < eventos.size(); j++) {
                                                if(eventos.get(j).getDiaTerminado()!=null){
                                                    con++;
                                                }
                                            } 
                                            
                                            if(con==0){
                                                %>
                                                    <div class="panel panel-primary">
                                                        <div class="panel-heading">Mensaje</div>
                                                        <div class="panel-body">No hay eventos disponibles para esta opción</div>
                                                    </div>
                                                <%
                                            } else {
                                                %>
                                                
                                            <div id="skill">    

                                                <%  
                                                    for (int i = 0; i < eventos.size(); i++) {


                                                        if(eventos.get(i).getDiaTerminado()!=null){

                                                        double porcentaje=PorcentajeFechas.hallarPorcentaje2(eventos.get(i).getDiaFinal(), eventos.get(i).getDiaInicio(),eventos.get(i).getDiaTerminado());

                                                        if(porcentaje==-1){

                                                            %>

                                                                <div class="skillbar finalizado">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent">100%</span>
                                                                    <div class="filled" data-width="100%"></div>
                                                                </div>

                                                            <%

                                                        } else if(porcentaje==0.0){

                                                            %>

                                                                <div class="skillbar noco">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent"><%=porcentaje%>%</span>
                                                                    <div class="filled" data-width="<%=porcentaje%>%"></div>
                                                                </div>

                                                            <%

                                                        } else if(porcentaje>0.0 && porcentaje<30.0){
                                                            %>

                                                                <div class="skillbar menor30">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent"><%=porcentaje%>%</span>
                                                                    <div class="filled" data-width="<%=porcentaje%>%"></div>
                                                                </div>

                                                            <%
                                                        } else if(porcentaje>=30.0 && porcentaje<50.0){
                                                            %>

                                                                <div class="skillbar menor50">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent"><%=porcentaje%>%</span>
                                                                    <div class="filled" data-width="<%=porcentaje%>%"></div>
                                                                </div>

                                                            <%
                                                        } else if(porcentaje>=50.0 && porcentaje<70.0){
                                                            %>

                                                                <div class="skillbar menor70">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent"><%=porcentaje%>%</span>
                                                                    <div class="filled" data-width="<%=porcentaje%>%"></div>
                                                                </div>

                                                            <%
                                                        } else if(porcentaje>=70.0 && porcentaje<100.0){
                                                            %>

                                                                <div class="skillbar menor100">
                                                                    <span class="title" style="color: white; width: 200px;"><%=eventos.get(i).getDescripcion()%></span>
                                                                    <span class="percent"><%=porcentaje%>%</span>
                                                                    <div class="filled" data-width="<%=porcentaje%>%"></div>
                                                                </div>

                                                            <%
                                                        }

                                                    }
                                                }
                                                %>
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
        </div>

                                        
        <script type="text/javascript">
            var t;
            window.onload=resetTimer;
            document.onkeypress=resetTimer;
            document.onmousemove;
            
            function logout(){

                <%
                    if(session.getAttribute("idCUENTA")==null){
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

    <script type="text/javascript">
        $(document).ready(function () {

            demo.initChartist();

        });
    </script>

    
    
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        <script src="build/scripts/an-skill-bar.js"></script>

        <script>
          $(document).ready(function () {
            $('.skillbar').skillbar({
                speed: 1000,
            });
        });
        </script>

        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-36251023-1']);
            _gaq.push(['_setDomainName', 'jqueryscript.net']);
            _gaq.push(['_trackPageview']);

            (function() {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

        </script>
    
    
</html>