<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSuplementarias.aspx.cs" Inherits="DiccionarioChino.PSuplementarias" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Palabras suplementarias</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>
    <style>
        #d_headword {
            font-size: 60px;
            font-family: "WenQuanYi Micro Hei", "UKai", "STKaiTi", "KaiTi" !important;
        }
    </style>
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
                <input type="text" class="form-control" placeholder="Search">
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
            <li class="active"><a href="PSuplementarias.aspx">
                <svg class="glyph stroked tag">
                    <use xlink:href="#stroked-tag"></use></svg>
                Suplementarias</a></li>
            <li><a href="Plantilla.aspx">
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
                <li class="active">Suplementarias</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Palabras suplementarias</h1>
            </div>
        </div>
        <!--/.row-->


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <form runat="server" id="formPalabras">
                        <div class="panel-heading">Mostrar Tabla</div>
                        <div class="panel-body">
                            <asp:GridView ID="GVsuplementarias" runat="server"
                                AutoGenerateColumns="False"
                                DataKeyNames="headword"
                                CssClass="table table-bordered bs-table text-center">
                                <Columns>
                                    <asp:BoundField DataField="headword" ItemStyle-CssClass="headword" HeaderText="Palabra"></asp:BoundField>
                                    <asp:BoundField DataField="pron" ItemStyle-CssClass="pron" HeaderText="Pronunciación"></asp:BoundField>
                                    <asp:BoundField DataField="defn" ItemStyle-CssClass="defn" HeaderText="defn"></asp:BoundField>
                                    <asp:BoundField DataField="id" ItemStyle-CssClass="id" HeaderText="Id"></asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkView" CssClass="btn btn-primary btn-xs"><span class="glyphicon glyphicon-zoom-in"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <div class="btn-group-sm text-center">
                                <asp:LinkButton runat="server" OnClick="primero_OnClick" ID="primero" CssClass="btn btn-info"><i class="glyphicon glyphicon-step-backward" aria-hidden="true"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="anterior_OnClick" ID="anterior" CssClass="btn btn-info"><i class="glyphicon glyphicon-backward" aria-hidden="true"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="siguiente_OnClick" ID="siguiente" CssClass="btn btn-info"><i class="glyphicon glyphicon-forward" aria-hidden="true"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="ultimo_OnClick" ID="ultimo" CssClass="btn btn-info"><i class="glyphicon glyphicon-step-forward" aria-hidden="true"></i></asp:LinkButton>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--/.row-->
        <!---modal--->
        <div class="modal fade" id="detalle" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div id="dialog" style="display: none">
                            <%--<b>Palabra</b>--%>
                            <span id="d_headword"></span>
                            <%--<input type="text" class="form-control text-center" id="d_headword" name="d_headword" />--%>
                        <div class="">
                            <b>Pronunciación:</b><br/>
                            <span id="d_pron"></span>
                            <%--<input type="text" class="form-control text-center" id="d_pron" name="d_pron" />--%>
                        </div>
                            <b>Definición:</b><br/>
                            <span id="d_defn"></span>
                    </div>
                </div>

            </div>
        </div>
        <!--/-modal--->
    </div>
    <!--/.main-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/JavaScript.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).on("click", "[id*=lnkView]", function () {
            $("#d_headword").html($(".headword", $(this).closest("tr")).html());
            $("#d_pron").html($(".pron", $(this).closest("tr")).html());
            $("#d_defn").html($(".defn", $(this).closest("tr")).html());
            $("#dialog").dialog({
                title: "View Details",
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
            return false;
        });
    </script>
</body>
</html>
