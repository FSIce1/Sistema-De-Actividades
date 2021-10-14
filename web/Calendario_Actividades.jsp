<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Calendario de actividades</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
           
        <link rel="stylesheet" type="text/css" href="css/frontierCalendar/jquery-frontier-cal-1.3.2.css" />
        <link rel="stylesheet" type="text/css" href="css/colorpicker/colorpicker.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui/smoothness/jquery-ui-1.8.1.custom.css" />
        
        <script type="text/javascript" src="js/jquery-core/jquery-1.4.2-ie-fix.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui/smoothness/jquery-ui-1.8.1.custom.min.js"></script>
        <script type="text/javascript" src="js/colorpicker/colorpicker.js"></script>
        <script type="text/javascript" src="js/jquery-qtip-1.0.0-rc3140944/jquery.qtip-1.0.js"></script>
        <script type="text/javascript" src="js/lib/jshashtable-2.1.js"></script>
        <script type="text/javascript" src="js/frontierCalendar/jquery-frontier-cal-1.3.2.min.js"></script>
        
        <script src="js/calendario.js" type="text/javascript"></script>
        
        <link href="https://fonts.googleapis.com/css?family=Chonburi" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
        
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    
    <body>

        <%
            if(session.getAttribute("idCUENTA")==null){
                %>
                    <jsp:include page="Controlador_Logueo?opcion=Y"/>
                <%
            }
        %>
    
    <style>

        .titulo {
            font-family: 'Fredoka One';
            font-size: 40px; 
            color: #6590CD;
        }
        
        .botonNuevo {
            padding: 5px;
            background: #6590CD;
            color: #fff;
        }
        
        .botonNuevo:hover{
            background: #346FBC
        }
        
        .botonInicio {
            margin: 10px 0;
            padding: 7px 12px;
            border: none;
            border-radius: 
        }
        
        .buscaDia {
            font-size: 18px;
        }
        
        .inicio {
            font-size: 18px;
            text-decoration: none;
            color: black;
            padding: 5px 8px;
            border-radius: 5px;
        }
        
        .date {
            border: 2px solid #6590CD;
        }
        
    </style>
    
    <div class="center">
        <h1 class="titulo" align="center" class="letra2 animated bounce faster">Calendario de Actividades</h1>
    </div>

        <style type="text/css" media="screen">
        
            body { font-size: 62.5%; }
            .shadow {
                -moz-box-shadow: 3px 3px 4px #aaaaaa;
                -webkit-box-shadow: 3px 3px 4px #aaaaaa;
                box-shadow: 3px 3px 4px #aaaaaa;
                /* For IE 8 */
                -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa')";
                /* For IE 5.5 - 7 */
                filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa');
            }
            
        </style>
        
        <style>
            .letra2{
                font-family: 'Chonburi', cursive;
                font-size: 40px;
            }

            .boton{
                  height: 35px;
                  text-shadow: 0px 1px rgba(0, 0, 0, 0.2);
                                    text-align:center;
                                    text-decoration: none;
                  font-family: 'Helvetica Neue', Helvetica, sans-serif;
                  display:inline-block;
                                    color: #FFF;
                                    background: #7F8C8D;
                                    padding: 7px 20px;
                                    white-space: nowrap;
                                    -webkit-border-radius: 5px;
                                    -moz-border-radius: 5px;
                                    border-radius: 100px;
                                    margin: 10px 5px;
                                    -webkit-transition: all 0.2s ease-in-out;
                                    -ms-transition: all 0.2s ease-in-out;
                                    -moz-transition: all 0.2s ease-in-out;
                                    -o-transition: all 0.2s ease-in-out;
                                    transition: all 0.2s ease-in-out;
            }

            .azul{
              background: #3498DB;
              box-shadow: 0px 5px 0px 0px #2980B9;
            }

            .azul:hover{
              background: #39a0e5;
            }

            .azul:active{
              box-shadow: 0px 2px 0px 0px #2980B9;
            }

            .otro{
              background: linear-gradient(to right, #514A9D, #24C6DC);
              box-shadow: 0px 5px 0px 0px #39B4E5;
            }

            .otro:hover{
              background: #68C2E5;
            }

            .otro:active{
              box-shadow: 0px 2px 0px 0px #39B4E5;
            }

            .redondeado {
                 border-radius: 5px;
                 background-color: #ffffff;
            }


        </style>
       
    <div id="example" style="margin: auto; width:80%;">

        <br><br>
        
        <div id="toolbar"  style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden;">
            
            <button id="BtnPreviousMonth" class="botonNuevo">Mes Anterior</button>
            <button id="BtnNextMonth" class="botonNuevo">Mes Siguiente</button>
            &nbsp;&nbsp;&nbsp;
            
            <form action="Inicio.jsp">
                <button type=""submit class="botonNuevo botonInicio">Inicio</button>
            </form>
            
            <span class="buscaDia">Buscar día: </span> <input type="text" id="dateSelect" class="date redondeado" size="20"/>
        
        </div>

        <br>

        <div id="mycal"></div>

    </div>

    <!-- debugging-->
    <div id="calDebug"></div>

    <!-- Add event modal form -->
    <style type="text/css">
        label, input.text, select { display:block; }
        fieldset { padding:0; border:0; margin-top:25px; }
        .ui-dialog .ui-state-error { padding: .3em; }
        .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>
    
    <div id="add-event-form" title="Agregar nuevo evento">
        <p class="validateTips">Todos los campos son requeridos</p>

        <form>
            <fieldset>
                <label for="name">Título del evento</label>
                <input type="text" name="what" id="what" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
                <table style="width:100%; padding:5px;">
                    <tr>
                        <td>
                            <label>Día Inicial</label>
                            <input type="text" name="startDate" id="startDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <label>Hora</label>
                            <select id="startHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="12" SELECTED>12</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                            </select>
                        <td>
                        <td>
                            <label>Minuto</label>
                            <select id="startMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="00" SELECTED>00</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                                <option value="50">50</option>
                            </select>
                        <td>
                        <td>
                            <label>AM/PM</label>
                            <select id="startMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="AM" SELECTED>AM</option>
                                <option value="PM">PM</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Día Final</label>
                            <input type="text" name="endDate" id="endDate" value="" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;"/>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <label>Hora</label>
                            <select id="endHour" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="12" SELECTED>12</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                            </select>
                        <td>
                        <td>
                            <label>Minuto</label>
                            <select id="endMin" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="00" SELECTED>00</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                                <option value="50">50</option>
                            </select>
                        <td>
                        <td>
                            <label>AM/PM</label>
                            <select id="endMeridiem" class="text ui-widget-content ui-corner-all" style="margin-bottom:12px; width:95%; padding: .4em;">
                                <option value="AM" SELECTED>AM</option>
                                <option value="PM">PM</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
<!--                        
                        
                        <td>
                            <label>Color de Fondo</label>
                        </td>
                        
                        <td>
                            <div id="colorSelectorBackground"><div style="background-color: #333333; width:30px; height:30px; border: 2px solid #000000;"></div></div>
                            <input type="hidden" id="colorBackground" value="#333333">
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        
                        
                        -->
                        <td>
                            <label>Color de Fondo</label>
                        </td>
                        
                        <td>
                            <div id="colorSelectorForeground"><div style="background-color: #ffffff; width:30px; height:30px; border: 2px solid #000000;"></div></div>
                            <input type="hidden" id="colorForeground" value="#ffffff">
                        </td>
                        
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>

    <div id="display-event-form" title="Datos del evento">

    </div>

    
    <div id="cuadro-editar" title="Editar datos del evento">

    </div>

    
    <p>&nbsp;</p>

    <p>&nbsp;</p>

    
    
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
</html>