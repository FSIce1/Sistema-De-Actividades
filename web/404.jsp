
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="css/doc.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body class="error_container">
        <div class="content_wrapper">
            
            <header class="site_header">
                <a class="site_logo" href="/"></a>
            </header>
            
            <section class="main_body">
                <article class="unhandled_error">
                    <header class="error_content">
                        
                        <h1>¡Vaya! No encontramos la página que estás buscando.</h1>
                        <p>Hay varios motivos por los que es posible que no se encuentre la página: puede que el enlace haya dejado de funcionar, que la dirección web se haya escrito incorrectamente o que la página ya no exista.</p><p>

                            
                        <%
                            if(session.getAttribute("dniCUENTA")==null){
                                %>
                                    <a href="Controlador_Logueo?opcion=S">Regresar al login</a></p>
                                <%
                            } else {
                                %>
                                    <a href="Controlador_Logueo?opcion=E">Regresar a la p&#225;gina de inicio</a></p>
                                <%
                            
                            }
                        %>
                            
                        </header>
                </article>
            </section>
        </div>
    </body>

</html>
