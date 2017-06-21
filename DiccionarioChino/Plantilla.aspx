<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plantilla.aspx.cs" Inherits="DiccionarioChino.Plantilla" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Exportar palabras</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/datepicker3.css" rel="stylesheet"/>
    <link href="css/styles.css" rel="stylesheet"/>
    <link href="css/tabla.css" media="print" rel="stylesheet"/>
    <style>
        h1 {
            margin-top: 5px;
            margin-bottom: 10px;
            text-align: center;
        }

        .printable {
            border: 1px dotted #CCCCCC;
            padding: 10px 10px 10px 10px;
        }

        table {
            margin-left: auto;
            margin-right: auto;
            border: 2px solid black;
            border-collapse: separate;
            width: 17cm;
            padding: 0px;
        }

        th {
            border: 1px solid black;
        }
        
        td {
            background-image: url(../fondo.png);
            background-repeat: repeat-y;
            background-size: 1.69cm 1.7cm;
            background-position: -0.5px -0.9px;
            border: 1px solid black;
            text-align: center;
            font-size: 44px;
            font-family: "WenQuanYi Micro Hei", "UKai", "STKaiTi", "KaiTi";
            width: 57px;
        }

        tr:nth-child(odd) td{
            background-image: none !important;
            font-size: 14px !important;
        }

        .pingying {
            height: 1cm;
        }

        .caracter {
            height: 1.7cm;
        }

    </style>
    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script type="text/javascript">
        function showPopup() {
            var myDiv = document.getElementById('printable');
            var newWindow = window.open('', 'SecondWindow', 'toolbar=0,stat=0');
            var style = newWindow.document.createElement('link');
            style.type = "text/css";
            style.rel = "stylesheet";
            style.href = "css/tabla.css";
            style.media = "all";
            newWindow.document.write("<html><body " +
                "class='responsive light2012-home-switcher home switcher' " +
                " onload='window.print()'>" +
                myDiv.innerHTML +
                "</body></html>");
            newWindow.document.getElementsByTagName("head")[0].appendChild(style);
            newWindow.document.close();
        }
    </script>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Index.aspx"><span>BD</span> Palabras en Chino</a>
<%--                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <svg class="glyph stroked male-user">
                                <use xlink:href="#stroked-male-user"></use></svg>
                            User <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">
                                <svg class="glyph stroked male-user">
                                    <use xlink:href="#stroked-male-user"></use></svg>
                                Profile</a></li>
                            <li><a href="#">
                                <svg class="glyph stroked gear">
                                    <use xlink:href="#stroked-gear"></use></svg>
                                Settings</a></li>
                            <li><a href="#">
                                <svg class="glyph stroked cancel">
                                    <use xlink:href="#stroked-cancel"></use></svg>
                                Logout</a></li>
                        </ul>
                    </li>
                </ul>--%>
            </div>

        </div>
        <!-- /.container-fluid -->
    </nav>

    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
            <div class="form-group">
                <input class="form-control" placeholder="Search" runat="server"/>
            </div>
        </form>
        <ul class="nav menu">
            <li><a href="Index.aspx">
                <svg class="glyph stroked home">
                    <use xlink:href="#stroked-home"></use></svg>
                Inicio</a></li>
            <li><a href="Palabras.aspx">
                <svg class="glyph stroked star">
                    <use xlink:href="#stroked-star"></use></svg>
                Palabras Libro</a></li>
            <li><a href="PSuplementarias.aspx">
                <svg class="glyph stroked tag">
                    <use xlink:href="#stroked-tag"></use></svg>
                Suplementarias</a></li>
            <li class="active"><a href="Plantilla.aspx">
                <svg class="glyph stroked printer">
                    <use xlink:href="#stroked-printer"></use></svg>
                Exportar</a></li>
            <li><a href="Nueva.aspx">
                <svg class="glyph stroked plus">
                    <use xlink:href="#stroked-plus-sign"></use></svg>
                Agregar nuevas</a></li>
            <li role="presentation" class="divider"></li>
<%--            <li><a href="login.html">
                <svg class="glyph stroked male-user">
                    <use xlink:href="#stroked-male-user"></use></svg>
                Login Page</a></li>--%>
        </ul>
        <div class="attribution">
            Template by <a href="http://www.medialoot.com/item/lumino-admin-bootstrap-template/">Medialoot</a><br />
            <a href="http://www.glyphs.co" style="color: #333;">Icons by Glyphs</a>
        </div>
    </div>
    <!--/.sidebar-->

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="Index.aspx">
                    <svg class="glyph stroked home">
                        <use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">Exportar</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Exportar palabras</h1>
            </div>
        </div>
        <!--/.row-->

        <form runat="server" action="Plantilla.aspx" method="post">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Mostrar Tabla</div>
                        <div class="panel-body">
                            <div>
                                <asp:RadioButton ID="rblibro" GroupName="fuente"
                                    Text="Libro" runat="server" AutoPostBack="True" OnCheckedChanged="rblibro_OnCheckedChanged" /><br />
                                <asp:RadioButton ID="rbsuple" GroupName="fuente"
                                    Text="Suplementarias" runat="server" AutoPostBack="True" OnCheckedChanged="rbsuple_OnCheckedChanged" />
                            </div>
                            <div>
                                <asp:DropDownList runat="server" ID="DDfuenteL" CssClass="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="DDfuente_OnSelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:DropDownList runat="server" ID="DDTemaL" CssClass="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="DDTemaL_OnSelectedIndexChanged">
                                </asp:DropDownList><br />
                                <asp:LinkButton runat="server" CssClass="btn btn-sm btn-success" ID="Gnralista" OnClick="Gnralista_OnClick">Generar</asp:LinkButton><br />
                                <asp:Panel runat="server" ID="cantidad">
                                    <asp:Label runat="server" ID="lbcantidad">Seleccionar candidad a mostrar</asp:Label><br />
                                    <asp:TextBox runat="server" ID="tbdesde" placeholder="Desde" size="5"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="tbcant" placeholder="Candidad" size="5"></asp:TextBox>
                                    <asp:LinkButton runat="server" CssClass="btn btn-sm btn-success" ID="generar" OnClick="generar_OnClick">Generar</asp:LinkButton>
                                </asp:Panel>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <%--<input type="button" id="btnPrint" value="Print" />--%>
                            <asp:LinkButton type="button" OnClientClick="showPopup();" class="btn btn-sm btn-primary glyphicon pull-left" runat="server" ID="btprint"><svg class="glyph stroked printer"><use xlink:href="#stroked-printer"/></svg>Imprimir</asp:LinkButton>
                        </div>
                        <div class="panel-body center-block">
                            <div class="text-center" id="printable">
                                <asp:Label runat="server" ID="lbfuente"></asp:Label>
                                <asp:PlaceHolder ID="Place" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </form>
    </div>
    <!--/.main-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <%--    <script>
        $('#calendar').datepicker({
        });

        !function ($) {
            $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
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
    </script>--%>
</body>
</html>
