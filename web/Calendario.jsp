
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
           
        <link rel="stylesheet" type="text/css" href="css/frontierCalendar/jquery-frontier-cal-1.3.2.css" />
        <link rel="stylesheet" type="text/css" href="css/colorpicker/colorpicker.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui/smoothness/jquery-ui-1.8.1.custom.css" />
        
        <script type="text/javascript" src="js/jquery-core/jquery-1.4.2-ie-fix.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui/smoothness/jquery-ui-1.8.1.custom.min.js"></script>
        <script type="text/javascript" src="js/colorpicker/colorpicker.js"></script>
        <script type="text/javascript" src="js/jquery-qtip-1.0.0-rc3140944/jquery.qtip-1.0.js"></script>
        <script type="text/javascript" src="js/lib/jshashtable-2.1.js"></script>
        <script type="text/javascript" src="js/frontierCalendar/jquery-frontier-cal-1.3.2.min.js"></script>

        
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
        
        
    <script type="text/javascript">
        $(document).ready(function () {

            var clickDate = "";
            var clickAgendaItem = "";

            var jfcalplugin = $("#mycal").jFrontierCal({
                date: new Date(),
                dayClickCallback: myDayClickHandler,
                agendaClickCallback: myAgendaClickHandler,
                agendaDropCallback: myAgendaDropHandler,
                agendaMouseoverCallback: myAgendaMouseoverHandler,
                applyAgendaTooltipCallback: myApplyTooltip,
                agendaDragStartCallback: myAgendaDragStart,
                agendaDragStopCallback: myAgendaDragStop,
                dragAndDropEnabled: true
            }).data("plugin");

            function myAgendaDragStart(eventObj, divElm, agendaItem) {
                // destroy our qtip tooltip
                if (divElm.data("qtip")) {
                    divElm.qtip("destroy");
                }
            }
            ;

            function myAgendaDragStop(eventObj, divElm, agendaItem) {
                //alert("drag stop");
            }
            ;

            function myApplyTooltip(divElm, agendaItem) {

                // Destroy currrent tooltip if present
                if (divElm.data("qtip")) {
                    divElm.qtip("destroy");
                }

                var displayData = "";

                var title = agendaItem.title;
                var startDate = agendaItem.startDate;
                var endDate = agendaItem.endDate;
                var allDay = agendaItem.allDay;
                var data = agendaItem.data;
                
                displayData += "<br><b>" + title + "</b><br><br>";
                if (allDay) {
                    displayData += "(All day event)<br><br>";
                } else {
                    displayData += "<b>Starts:</b> " + startDate + "<br>" + "<b>Ends:</b> " + endDate + "<br><br>";
                }
                for (var propertyName in data) {
                    displayData += "<b>" + propertyName + ":</b> " + data[propertyName] + "<br>"
                }
                // use the user specified colors from the agenda item.
                var backgroundColor = agendaItem.displayProp.backgroundColor;
                var foregroundColor = agendaItem.displayProp.foregroundColor;
                var myStyle = {
                    border: {
                        width: 5,
                        radius: 10
                    },
                    padding: 10,
                    textAlign: "left",
                    tip: true,
                    name: "dark" // other style properties are inherited from dark theme
                };
                if (backgroundColor != null && backgroundColor != "") {
                    myStyle["backgroundColor"] = backgroundColor;
                }
                if (foregroundColor != null && foregroundColor != "") {
                    myStyle["color"] = foregroundColor;
                }
                // apply tooltip
                divElm.qtip({
                    content: displayData,
                    position: {
                        corner: {
                            tooltip: "bottomMiddle",
                            target: "topMiddle"
                        },
                        adjust: {
                            mouse: true,
                            x: 0,
                            y: -15
                        },
                        target: "mouse"
                    },
                    show: {
                        when: {
                            event: 'mouseover'
                        }
                    },
                    style: myStyle
                });

            }
            ;

            jfcalplugin.setAspectRatio("#mycal", 0.75);

            function myDayClickHandler(eventObj) {
                // Get the Date of the day that was clicked from the event object
                var date = eventObj.data.calDayDate;
                // store date in our global js variable for access later
                clickDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                // open our add event dialog
                $('#add-event-form').dialog('open');
            }
            ;

            function myAgendaClickHandler(eventObj) {
                // Get ID of the agenda item from the event object
                var agendaId = eventObj.data.agendaId;
                //alert(agendaId);
                // pull agenda item from calendar
                var agendaItem = jfcalplugin.getAgendaItemById("#mycal", agendaId);
                clickAgendaItem = agendaItem;
                $("#display-event-form").dialog('open');
            }
            ;

            function myAgendaDropHandler(eventObj) {
                // Get ID of the agenda item from the event object
                var agendaId = eventObj.data.agendaId;
                // date agenda item was dropped onto
                var date = eventObj.data.calDayDate;
                // Pull agenda item from calendar
                var agendaItem = jfcalplugin.getAgendaItemById("#mycal", agendaId);
                alert("You dropped agenda item " + agendaItem.title +
                        " onto " + date.toString() + ". Here is where you can make an AJAX call to update your database.");
            }
            ;

            function myAgendaMouseoverHandler(eventObj) {
                var agendaId = eventObj.data.agendaId;
                var agendaItem = jfcalplugin.getAgendaItemById("#mycal", agendaId);
                //alert("You moused over agenda item " + agendaItem.title + " at location (X=" + eventObj.pageX + ", Y=" + eventObj.pageY + ")");
            }
            ;
            
            
            $("#dateSelect").datepicker({
                showOtherMonths: true,
                selectOtherMonths: true,
                changeMonth: true,
                changeYear: true,
                showButtonPanel: true,
                dateFormat: 'yy-mm-dd'
            });

            
            $("#dateSelect").datepicker('setDate', new Date());
            
            $("#dateSelect").bind('change', function () {
                var selectedDate = $("#dateSelect").val();
                var dtArray = selectedDate.split("-");
                var year = dtArray[0];
                // jquery datepicker months start at 1 (1=January)
                var month = dtArray[1];
                // strip any preceeding 0's
                month = month.replace(/^[0]+/g, "")
                var day = dtArray[2];
                // plugin uses 0-based months so we subtrac 1
                jfcalplugin.showMonth("#mycal", year, parseInt(month - 1).toString());
            });
            
            
            $("#BtnPreviousMonth").button();
            $("#BtnPreviousMonth").click(function () {
                jfcalplugin.showPreviousMonth("#mycal");
                // update the jqeury datepicker value
                var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
                var cyear = calDate.getFullYear();
                // Date month 0-based (0=January)
                var cmonth = calDate.getMonth();
                var cday = calDate.getDate();
                // jquery datepicker month starts at 1 (1=January) so we add 1
                $("#dateSelect").datepicker("setDate", cyear + "-" + (cmonth + 1) + "-" + cday);
                return false;
            });
            
            
            $("#BtnNextMonth").button();
            $("#BtnNextMonth").click(function () {
                jfcalplugin.showNextMonth("#mycal");
                // update the jqeury datepicker value
                var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
                var cyear = calDate.getFullYear();
                // Date month 0-based (0=January)
                var cmonth = calDate.getMonth();
                var cday = calDate.getDate();
                // jquery datepicker month starts at 1 (1=January) so we add 1
                $("#dateSelect").datepicker("setDate", cyear + "-" + (cmonth + 1) + "-" + cday);
                return false;
            });

            $("#BtnDeleteAll").button();
            $("#BtnDeleteAll").click(function () {
                jfcalplugin.deleteAllAgendaItems("#mycal");
                return false;
            });


           // CARGA LA BASE DE DATOS
            $("#BtnLoadFromDB").button();
            $("#BtnLoadFromDB").click(function () {
                var username = "Darrel_Viegas";															//needed parameter to be executed jin the servlet code. Chnage the parameter or add parameters as per your requirement
                $.ajax({
                    type: "POST", //tipo de respuesta
                    url: "get_Cal_Data?opcion=I", //en realidad llamando al servlet
                    data: "username=" + username, //pasando los parámetros
                    success: function (msg) {
                    //alert(msg);    
                        if (typeof msg != "undefined" && msg != null) {
                            //dividir la cadena de respuesta y almacenarla en una matriz
                            var mainJSONArray = msg.split("|");

                            //alert(mainJSONArray); LO DEJA CON COMAS "3,Darrel_Viegas,2015-10-19 12:00:00,2015-10-19 16:00:00,salio,#6699FF,#1A0000"
                              
                            //botamos la matriz
                            //alert(mainJSONArray.length); --> 7
                            
                            for (i = 0; i < mainJSONArray.length; i++)
                            {
                                //alert("length: " + mainJSONArray[i].trim().length);
                                
                                
                                // PRIMERA PASADA --> 1


                                //comprobando en caso de que el elemento contenga una cadena vacía. Principalmente ocurrirá para el último elemento JSON en la respuesta.
                                
                                if (mainJSONArray[i].trim().length > 0){
                                    //alert(i+": "+mainJSONArray[i]);

                                    //necessary variables
                                    var evtId, evtCreatorID, evtStartDate, evtEndDate, evtDescription, evtBackgroundColor, evtForegroundColor;//No es tan necesario !!!!! Lo verás en el código jfcalplugin.addAgendaItem function en el último de este bloque
                                    var evtIdVal, evtCreatorIDVal, evtStartDateVal, evtEndDateVal, evtDescriptionVal, evtBackgroundColorVal, evtForegroundColorVal;
                                    var startMeridiem, endMeridiem;

                                    var subJSONArray = mainJSONArray[i];
                                    //alert(mainJSONArray);
                                    
                                    var indexValue = subJSONArray.split(";"); //dividiendo elementos individuales ahora
                                    
                                    //alert(indexValue.length);
                                    
                                    for (j = 0; j < indexValue.length; j++){
                                        
                                        var fieldName = indexValue[j].substring(0, indexValue[j].indexOf(":"));	//dividiendo la llave
                                        //alert(fieldName);
                                        var fieldValue = indexValue[j].substring(indexValue[j].indexOf(":") + 1); //dividiendo el valor
                                        fieldName = fieldName.trim();
                                        //alert(fieldName);
                                        fieldValue = fieldValue.trim();
                                        //alert("fieldname: " + fieldName + "\nfieldValue: " + fieldValue);

                                        //almacenándolos en las variables
                                        if (fieldName == "Event ID")
                                        {
                                            evtId = fieldName;
                                            evtIdVal = fieldValue;
                                        } else if (fieldName == "Created By")
                                        {
                                            evtCreatorID = fieldName;
                                            evtCreatorIDVal = fieldValue;
                                        } else if (fieldName == "Event Start Date")
                                        {
                                            evtStartDate = fieldName;
                                            evtStartDateVal = fieldValue;
                                        } else if (fieldName == "Event End Date")
                                        {
                                            evtEndDate = fieldName;
                                            evtEndDateVal = fieldValue;
                                        } else if (fieldName == "Event Description")
                                        {
                                            evtDescription = fieldName;
                                            evtDescriptionVal = fieldValue;
                                        } else if (fieldName == "BackgroundColor")
                                        {
                                            evtBackgroundColor = fieldName;
                                            evtBackgroundColorVal = fieldValue;
                                        } else if (fieldName == "ForegroundColor")
                                        {
                                            evtForegroundColor = fieldName;
                                            evtForegroundColorVal = fieldValue;
                                        }
                                    }
                                    
                                    

                                    //alert("Outside inner loop");

                                    //storing the start date in the necessary variables
                                    var startDate = evtStartDateVal.split(" ");//assuming date comes in yyyy-mm-dd hh24:mi:ss. This will store the date and timestamps in different indexes in the array
                                    
                                    var startDtArray = startDate[0].split("-");
                                    var startYear = startDtArray[0];
                                    // jquery datepicker months start at 1 (1=January)
                                    var startMonth = startDtArray[1];
                                    var startDay = startDtArray[2];
                                    // strip any preceeding 0's
                                    startMonth = startMonth.replace(/^[0]+/g, "");
                                    startDay = startDay.replace(/^[0]+/g, "");

                                    var startTime = startDate[1];//getting the timestamp

                                    var startHour = startTime.substring(0, startTime.indexOf(":"));
                                    if (parseInt(startHour) < 12)
                                    {
                                        startMeridiem = "AM"
                                    } else {
                                        startMeridiem = "PM";
                                    }

                                    var startMin = startTime.substring(3, startTime.lastIndexOf(":"));

                                    startHour = parseInt(startHour.replace(/^[0]+/g, ""));

                                    if (startMin == "0" || startMin == "00") {
                                        startMin = 0;
                                    } else {
                                        startMin = parseInt(startMin.replace(/^[0]+/g, ""));
                                    }

                                    if (startMeridiem == "AM" && startHour == 12) {
                                        startHour = 0;
                                    } else if (startMeridiem == "PM" && startHour < 12) {
                                        startHour = parseInt(startHour) + 12;
                                    }

                                    //alert("Finished with start date");

                                    //storing the end date in the necessary variables
                                    var endDate = evtEndDateVal.split(" ");//assuming date comes in yyyy-mm-dd hh24:mi:ss. This will store the date and timestamps in different indexes in the array
                                    var endDtArray = endDate[0].split("-");
                                    var endYear = endDtArray[0];
                                    // jquery datepicker months start at 1 (1=January)
                                    var endMonth = endDtArray[1];
                                    var endDay = endDtArray[2];
                                    // strip any preceeding 0's
                                    endMonth = endMonth.replace(/^[0]+/g, "");
                                    endDay = endDay.replace(/^[0]+/g, "");

                                    var endTime = endDate[1];

                                    var endHour = endTime.substring(0, endTime.indexOf(":"));
                                    if (parseInt(endHour) < 12)
                                    {
                                        endMeridiem = "AM"
                                    } else {
                                        endMeridiem = "PM";
                                    }

                                    var endMin = endTime.substring(3, endTime.lastIndexOf(":"));

                                    endHour = parseInt(endHour.replace(/^[0]+/g, ""));

                                    if (endMin == "0" || endMin == "00") {
                                        endMin = 0;
                                    } else {
                                        endMin = parseInt(endMin.replace(/^[0]+/g, ""));
                                    }

                                    if (endMeridiem == "AM" && endHour == 12) {
                                        endHour = 0;
                                    } else if (endMeridiem == "PM" && endHour < 12) {
                                        endHour = parseInt(endHour) + 12;
                                    }

                                    //stroing the dates in the date objects
                                    var startDateObj = new Date(parseInt(startYear), parseInt(startMonth) - 1, parseInt(startDay), startHour, startMin, 0, 0);
                                    var endDateObj = new Date(parseInt(endYear), parseInt(endMonth) - 1, parseInt(endDay), endHour, endMin, 0, 0);
                                    
                                    //alert("StartDate: " + startDay + "/" + startMonth + "/" + startYear + " " + startHour + ":" + startMin + ":00\nstartDateObj: " + startDateObj + 
                                    //		"\n\nEndDate: " + endDay + "/" + endMonth + "/" + endYear + " " + endHour + ":" + endMin + ":00\nendDateObj: " + endDateObj);

                                    //alert("Finished setting in date objects");

                                    //Finalmente agregando los datos al calendario.
                                    
                                    //alert(evtDescriptionVal);
                                    //alert(startDateObj);
                                    //alert(endDateObj);
                                    //alert(evtCreatorIDVal);
                                    //alert(evtIDVal);
                                    //alert(evtBackgroundColorVal);
                                    //alert(evtForegroundColorVal);
                                    
                                    jfcalplugin.addAgendaItem(
                                            "#mycal",
                                            evtDescriptionVal,
                                            startDateObj,
                                            endDateObj,
                                            false,
                                            {
                                                //note: that you can't dynamically assign the data's key, eg: the following two lines will display the data in the calendar as "evtId: 1" instead of "Event ID: 1"
                                                //evtId: evtIdVal,
                                                //evtCreatorID: evtCreatorIDVal

                                                //arrange the data as per your convenience
                                                "Created By": evtCreatorIDVal,
                                                "Event ID": evtIdVal
                                            },
                                            {
                                                //evtBackgroundColor: evtBackgroundColorVal,
                                                //evtForegroundColor: evtForegroundColorVal
                                                backgroundColor: evtBackgroundColorVal,
                                                foregroundColor: evtForegroundColorVal
                                            }
                                    );
                                }
                            }
                        }
                    }
                });
            });






            $("#BtnICalTest").button();
            $("#BtnICalTest").click(function () {
                jfcalplugin.loadICalSource("#mycal", $("#iCalSource").val(), "html");
                return false;
            });

            /**
             * Initialize add event modal form
             */
            $("#add-event-form").dialog({
                autoOpen: false,
                height: 400,
                width: 400,
                modal: true,
                buttons: {
                    'Agregar Evento': function () {

                        var what = jQuery.trim($("#what").val());

                        if (what == "") {
                            alert("Ingrese una breve descrpción del evento");
                        } else {

                            var startDate = $("#startDate").val();
                            var startDtArray = startDate.split("-");
                            var startYear = startDtArray[0];
                            // jquery datepicker months start at 1 (1=January)
                            var startMonth = startDtArray[1];
                            var startDay = startDtArray[2];
                            // strip any preceeding 0's
                            startMonth = startMonth.replace(/^[0]+/g, "");
                            startDay = startDay.replace(/^[0]+/g, "");
                            var startHour = jQuery.trim($("#startHour").val());
                            var startMin = jQuery.trim($("#startMin").val());
                            var startMeridiem = jQuery.trim($("#startMeridiem").val());
                            startHour = parseInt(startHour.replace(/^[0]+/g, ""));
                            if (startMin == "0" || startMin == "00") {
                                startMin = 0;
                            } else {
                                startMin = parseInt(startMin.replace(/^[0]+/g, ""));
                            }
                            if (startMeridiem == "AM" && startHour == 12) {
                                startHour = 0;
                            } else if (startMeridiem == "PM" && startHour < 12) {
                                startHour = parseInt(startHour) + 12;
                            }

                            var endDate = $("#endDate").val();
                            var endDtArray = endDate.split("-");
                            var endYear = endDtArray[0];
                            // jquery datepicker months start at 1 (1=January)
                            var endMonth = endDtArray[1];
                            var endDay = endDtArray[2];
                            // strip any preceeding 0's
                            endMonth = endMonth.replace(/^[0]+/g, "");

                            endDay = endDay.replace(/^[0]+/g, "");
                            var endHour = jQuery.trim($("#endHour").val());
                            var endMin = jQuery.trim($("#endMin").val());
                            var endMeridiem = jQuery.trim($("#endMeridiem").val());
                            endHour = parseInt(endHour.replace(/^[0]+/g, ""));
                            if (endMin == "0" || endMin == "00") {
                                endMin = 0;
                            } else {
                                endMin = parseInt(endMin.replace(/^[0]+/g, ""));
                            }
                            if (endMeridiem == "AM" && endHour == 12) {
                                endHour = 0;
                            } else if (endMeridiem == "PM" && endHour < 12) {
                                endHour = parseInt(endHour) + 12;
                            }

                            //alert("Start Date: " + startDay + "/" + startMonth + "/" + startYear + " " + startHour + ":" + startMin + ":00");
                            //alert("Start time: " + startHour + ":" + startMin + " " + startMeridiem + ", End time: " + endHour + ":" + endMin + " " + endMeridiem);

                            // Dates use integers
                            var startDateObj = new Date(parseInt(startYear), parseInt(startMonth) - 1, parseInt(startDay), startHour, startMin, 0, 0);
                            var endDateObj = new Date(parseInt(endYear), parseInt(endMonth) - 1, parseInt(endDay), endHour, endMin, 0, 0);

                            // agrega el nuevo evento al calendario
                            jfcalplugin.addAgendaItem(
                                    "#mycal",
                                    what,
                                    startDateObj,
                                    endDateObj,
                                    false,
                                    {
                                        "fname": "Santa",
                                        lname: "Claus"/*,
                                         leadReindeer: "Rudolph",
                                         myDate: new Date(),
                                         myNum: 42*/
                                    },
                                    {
                                        backgroundColor: $("#colorBackground").val(),
                                        foregroundColor: $("#colorForeground").val()
                                    }
                            );
                    

                            //Added by Darrel Viegas to store in database - Start
                            var username = "Darrel_Viegas";															//needed parameter to be executed jin the servlet code. Chnage the parameter or add parameters as per your requirement
                            startDate = startYear + "-" + startMonth + "-" + startDay + " " + startHour + ":" + startMin + ":00";
                            endDate = endYear + "-" + endMonth + "-" + endDay + " " + endHour + ":" + endMin + ":00";
                            

                            // AGREGA A LA BASE DE DATOS

                            $.ajax({
                                type: "POST",
                                url: "store_Cal_Data?opcion=I",
                                data: "username=" + username + "&start_date=" + startDate + "&end_date=" + endDate + "&desc=" + what + "&bg_color" + $("#colorBackground").val() + "&fg_color=" + $("#colorForeground").val(),
                                
                                success: function (msg) {
                                //    alert("Evento Insertado Correctamente");
                                }
                            });


                            $(this).dialog('close');

                        }

                    },
                    Cancelar: function () {
                        $(this).dialog('close');
                    }
                },
                open: function (event, ui) {
                    // inicializar selector de fecha de inicio
                    $("#startDate").datepicker({
                        showOtherMonths: true,
                        selectOtherMonths: true,
                        changeMonth: true,
                        changeYear: true,
                        showButtonPanel: true,
                        dateFormat: 'yy-mm-dd'
                    });
                    // inicializar el selector de fecha de finalización
                    $("#endDate").datepicker({
                        showOtherMonths: true,
                        selectOtherMonths: true,
                        changeMonth: true,
                        changeYear: true,
                        showButtonPanel: true,
                        dateFormat: 'yy-mm-dd'
                    });
                    // inicializar con la fecha en que se hizo click
                    $("#startDate").val(clickDate);
                    $("#endDate").val(clickDate);
                    
                    // Inicializar recolectores de color
                    $("#colorSelectorBackground").ColorPicker({
                        color: "#333333",
                        onShow: function (colpkr) {
                            $(colpkr).css("z-index", "10000");
                            $(colpkr).fadeIn(500);
                            return false;
                        },
                        onHide: function (colpkr) {
                            $(colpkr).fadeOut(500);
                            return false;
                        },
                        onChange: function (hsb, hex, rgb) {
                            $("#colorSelectorBackground div").css("backgroundColor", "#" + hex);
                            $("#colorBackground").val("#" + hex);
                        }
                    });
                    //$("#colorBackground").val("#1040b0");
                    $("#colorSelectorForeground").ColorPicker({
                        color: "#ffffff",
                        onShow: function (colpkr) {
                            $(colpkr).css("z-index", "10000");
                            $(colpkr).fadeIn(500);
                            return false;
                        },
                        onHide: function (colpkr) {
                            $(colpkr).fadeOut(500);
                            return false;
                        },
                        onChange: function (hsb, hex, rgb) {
                            $("#colorSelectorForeground div").css("backgroundColor", "#" + hex);
                            $("#colorForeground").val("#" + hex);
                        }
                    });
                    //$("#colorForeground").val("#ffffff");
                    // put focus on first form input element
                    $("#what").focus();
                },
                close: function () {
                    // reset form elements when we close so they are fresh when the dialog is opened again.
                    $("#startDate").datepicker("destroy");
                    $("#endDate").datepicker("destroy");
                    $("#startDate").val("");
                    $("#endDate").val("");
                    $("#startHour option:eq(0)").attr("selected", "selected");
                    $("#startMin option:eq(0)").attr("selected", "selected");
                    $("#startMeridiem option:eq(0)").attr("selected", "selected");
                    $("#endHour option:eq(0)").attr("selected", "selected");
                    $("#endMin option:eq(0)").attr("selected", "selected");
                    $("#endMeridiem option:eq(0)").attr("selected", "selected");
                    $("#what").val("");
                    //$("#colorBackground").val("#1040b0");
                    //$("#colorForeground").val("#ffffff");
                }
            });




            // CUADRO PARA EDITAR
            $("#cuadro-editar").dialog({
                autoOpen: false,
                height: 400,
                width: 400,
                modal: true,
                
                buttons: {
                    Cancelar: function () {
                        $(this).dialog('close');
                    },
                    'Editar': function () {
                        
                        if (confirm("¿Desea editar evento del calendario?")) {
                            if (clickAgendaItem != null) {
                                jfcalplugin.deleteAgendaItemById("#mycal", clickAgendaItem.agendaId);
                                //jfcalplugin.deleteAgendaItemByDataAttr("#mycal","myNum",42);
                                
                            }
                            $(this).dialog('close');
                        }
                        
                    }
                },
                close: function () {
                    // clear agenda data
                    $("#cuadro-editar").html("");
                }
            });


            $("#display-event-form").dialog({
                
                autoOpen: false,
                height: 400,
                width: 400,
                modal: true,
                buttons: {
                    Cancelar: function () {
                        $(this).dialog('close');
                    },
                    /*
                    'Editar': function () {
                        $(this).dialog('close');
                        $("#cuadro-editar").dialog('open');
                        
                    },*/
                    'Eliminar': function () {
                        if (confirm("¿Desea eliminar evento del calendario?")) {
                            if (clickAgendaItem != null) {
                                jfcalplugin.deleteAgendaItemById("#mycal", clickAgendaItem.agendaId);
                                //jfcalplugin.deleteAgendaItemByDataAttr("#mycal","myNum",42);
                                
                                
                        // ELIMINAMOS DE LA BASE DE DATOS        
                        var data = clickAgendaItem.data;
                                
                                var idEvento;
                                for (var propertyName in data) {
                                    idEvento=data[propertyName];
                                    break;    
                                }
                                
                                //alert(idEvento);
                                
                                // LO ENVIAMOS AL CONTROLADOR PARA ENVIAR    
                                $.ajax({
                                    type: "POST",
                                    url: "store_Cal_Data?opcion=E",
                                    data: "id=" + idEvento,

                                    success: function (msg) {
                                    //    alert("Evento Eliminado Correctamente");
                                    }
                                });
                                
                            }
                            $(this).dialog('close');
                        }
                    }
                    /*,'Finalizar': function () {
                        
                        if (confirm("¿El evento ha acabado?")) {
                            if (clickAgendaItem != null) {
                                
                        // CAMBIAMOS LA BASE DE DATOS        
                        var data = clickAgendaItem.data;
                                
                                var idEvento;
                                for (var propertyName in data) {
                                    idEvento=data[propertyName];
                                    break;    
                                }
                                
                                //alert(idEvento);
                                
                                // LO ENVIAMOS AL CONTROLADOR PARA ENVIAR    
                                $.ajax({
                                    type: "POST",
                                    url: "store_Cal_Data?opcion=C",
                                    data: "id=" + idEvento,

                                    success: function (msg) {
                                    //    alert("Evento Modificado Correctamente");
                                    }
                                });
                                
                            }
                            $(this).dialog('close');
                        }
                        
                    }
                    */
                    
                    
                },

        open: function (event, ui) {
                    if (clickAgendaItem != null) {
                        
                        var title = clickAgendaItem.title;
                        var startDate = clickAgendaItem.startDate;
                        var endDate = clickAgendaItem.endDate;
                        var allDay = clickAgendaItem.allDay;
                        var data = clickAgendaItem.data;
                        
                        // in our example add agenda modal form we put some fake data in the agenda data. we can retrieve it here.
                        
                        $("#display-event-form").append(
                                "<b>Título del evento: </b> " + title + "<br><br>"
                                );
                        if (allDay) {
                            $("#display-event-form").append(
                                    "(All day event)<br><br>"
                                    );
                        } else {
                            $("#display-event-form").append(
                                    "<b>Día Inicial: </b> " + startDate + "<br>" +
                                    "<b>Día Final:</b> " + endDate + "<br><br>"
                                    );
                        }
                        
                        for (var propertyName in data) {
                            $("#display-event-form").append("<b>" + propertyName + ":</b> " + data[propertyName] + "<br>");

                        }
                        
                        
                    }
                },
                close: function () {
                    // clear agenda data
                    $("#display-event-form").html("");
                }
            });

            /**
             * Initialize our tabs
             */
            $("#tabs").tabs({
                /*
                 * Our calendar is initialized in a closed tab so we need to resize it when the example tab opens.
                 */
                show: function (event, ui) {
                    if (ui.index == 1) {
                        jfcalplugin.doResize("#mycal");
                    }
                }
            });

        });
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
                        
                        <li>
                            <a href="Inicio.jsp">
                                <i class="pe-7s-user"></i>
                                <p>Perfil del Usuario</p>
                            </a>
                        </li>
                        
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
                        
                        <li class="active">
                            <a href="#">
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
                        
                        
                        <li>
                            <a href="Estadisticas_Hecho.jsp">
                                <i class="pe-7s-note2"></i>
                                <p>Hecho</p>
                            </a>
                        </li>
                        
                        
                        <li>
                            <a href="Estadisticas_Planificado.jsp">
                                <i class="pe-7s-note2"></i>
                                <p>Planificado</p>
                            </a>
                        </li>
<!--                        
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
                                    
                                </ul>
                            </div>
                        </li>-->
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
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Calendario de actividades</h4>
                                    </div>
                                    <div class="content">
                                        
                                        
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
                                        
                                        

                                        <div id="example" style="margin: auto; width:80%;">

                                            <br><br>

                                            <div id="toolbar" class="ui-widget-header ui-corner-all" style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden;">
                                                <button id="BtnPreviousMonth">Mes Anterior</button>
                                                <button id="BtnNextMonth">Mes Siguiente</button>
                                                &nbsp;&nbsp;&nbsp;
                                                Date: <input type="text" id="dateSelect" size="20"/>
                                                &nbsp;&nbsp;&nbsp;
                                                <button id="BtnDeleteAll">Limpiar calendario</button>
                                                <button id="BtnLoadFromDB">Cargar eventos</button>

                                                <!--<button id="BtnICalTest">iCal Test</button>
                                                <input type="text" id="iCalSource" size="30" value="extra/fifa-world-cup-2010.ics"/>-->
                                            </div>

                                            <br>

                                            <div id="mycal"></div>

                                        </div>                 
                                        
                                        
                                    </div>
                                </div>
                            </div>
                                            
                        </div>
                    </div>
                </div>

            </div>
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

    
    
    <!--   Core JS Files   -->
<!--    
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    -->
    
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

</body>
</html>