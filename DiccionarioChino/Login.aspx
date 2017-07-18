<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DiccionarioChino.Login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forms</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
<div class="row">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">Log in</div>
            <div class="panel-body">
                <form id="form1" runat="server">
                    <div class="FormaLogin">
                        <div class="LeftFormaLogin">
                        </div>
                        <div class="CenterFormaLogin">
                            <div class="cPosRel" style="width: 370px; height: 90px; margin: 34px auto 0px auto; text-align:justify;">
                                <span class="TextoBienvenido">Al ingresar al Sistema ústed está de acuerdo en aceptar
                                    nuestros Términos y condiciones legales, cualquier cambio que realize en esta página
                                    será monitoreado.</span>
                                <br />
                                <span>
                                    <%= Request.ServerVariables["REMOTE_ADDR"]%></span><br />
                                <span>
                                    <asp:Literal ID="ltMac" runat="server"></asp:Literal></span>
                            </div>
                            <div class="cFL cPosRel" style="width: 450px; height: 150px;">
                                <div class="cFL cPosRel" style="width: 100px; height: 25px;">
                                    <span class="cFR cPosRel TextoLogin" style="margin-top: 7px;">Usuario:</span>
                                </div>
                                <div class="cFL cPosRel" style="width: 290px; height: 25px;">
                                    <asp:TextBox ID="txtUsuario" CssClass="txtControl" runat="server"></asp:TextBox>
                                </div>
                                <div class="cFL cPosRel" style="width: 100px; height: 25px; margin-top: 15px;">
                                    <span class="cFR cPosRel TextoLogin" style="margin-top: 7px;">Password:</span>
                                </div>
                                <div class="cFL cPosRel" style="width: 290px; height: 25px; margin-top: 15px;">
                                    <asp:TextBox ID="txtContraseña" TextMode="Password" CssClass="txtControl" runat="server"></asp:TextBox>
                                </div>
                                <div class="cFL cPosRel" style="width: 460px;">
                                    <div style="width: 120px; height: 30px; margin-left: auto; margin-right: auto; margin-top: 15px;">
                                        <asp:ImageButton ID="btnIniciar" ImageUrl="~/publico/include/imagenes/login/ingresarsistema.jpg" runat="server" OnClick="btnIniciar_Click" />
                                    </div>
                                </div>
                            </div>
                            <asp:Label ID="lblMensaje" CssClass="cFL" runat="server" ForeColor="#996600"></asp:Label>
                        </div>
                        <div class="RightFormaLogin">
                        </div>
                    </div>
                </form>
<%--                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="Usuario" name="user" type="text" autofocus="">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Recordar
                            </label>
                        </div>
                        <a href="Index.aspx" class="btn btn-primary">Login</a>
                    </fieldset>
                </form>--%>
            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->	
	
		

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
            $(this).find('em:first').toggleClass("glyphicon-minus");	  
        }); 
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>	
</body>

</html>
