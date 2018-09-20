<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Simple Sign Up Form by PremiumFreeibes.eu</title>

        <!---------- CSS ------------>

        <link rel="stylesheet" type="text/css" href="css/style_PU.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
        <script>
                
            $(function() {
                $("#datepicker").datepicker();

                $("#speed").selectmenu();
            });
        </script>
    </head>

    <body>

        <!--BEGIN #signup-form -->
        <div id="signup-form">

            <!--BEGIN #subscribe-inner -->
            <div id="signup-inner">

                <div class="clearfix" id="header">

                    <img id="signup-icon" src="./images/signup.png" alt="" />

                    <h1>Registro de un Ingreso <br/></h1>


                </div>

                <form id="send" action="">
                    <label>
                        <span>Fecha &nbsp;&nbsp;</span>
                        <input type="text" id="datepicker"/>
                    </label>
                    <label>
                        <span>Concepto&nbsp;&nbsp;</span>
                        <input id="concepto" type="text" name="concepto" value="" />
                    </label>

                    <label>
                        <span>Dolares &nbsp;&nbsp;</span>
                        <input id="dolares" type="text" name="dolares" value="" />
                    </label>

                    <label>
                        <span>Colones &nbsp;&nbsp;</span>
                        <input id="colones" type="text" name="colones" value="" />
                    </label>
                    <label>

                        <span>Tipo &nbsp;&nbsp;</span>
                        <select name="tipo" id="tipo">
                            <option>Ingreso Real</option>
                            <option>Ingreso Estimado</option>
                        </select>
                    </label>
                    <p>
                        <button id="submit" type="text">Agregar</button>
                    </p>

                </form>


            </div>

            <!--END #signup-inner -->
        </div>

        <!--END #signup-form -->   
        </div>

    </body>
</html>
