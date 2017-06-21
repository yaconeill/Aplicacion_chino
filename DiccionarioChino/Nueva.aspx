<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nueva.aspx.cs" Inherits="DiccionarioChino.Nueva" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agregar palabras</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>
    <style>
        #palabra {
            font-size: 100px !important;
            height: auto !important;
            font-family: "WenQuanYi Micro Hei", "UKai", "STKaiTi", "KaiTi" !important;
        }
        .txbpalabra {
            font-family: "WenQuanYi Micro Hei", "UKai", "STKaiTi", "KaiTi" !important;
            font-size: 22px;
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
            <li><a href="PSuplementarias.aspx">
                <svg class="glyph stroked tag">
                    <use xlink:href="#stroked-tag"></use></svg>
                Suplementarias</a></li>
            <li><a href="Plantilla.aspx">
                <svg class="glyph stroked printer">
                    <use xlink:href="#stroked-printer"></use></svg>
                Exportar</a></li>
            <li class="active"><a href="Nueva.aspx">
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
                <li class="active">Agregar</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Agregar Palabras</h1>
            </div>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Formulario</div>
                    <div class="panel-body">
                        <div class="">
                            <div class="panel panel-default">
                                <div class="panel-body tabs">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab1" data-toggle="tab">Agrear varias</a></li>
                                        <li><a href="#tab2" data-toggle="tab">Agregar una</a></li>
                                    </ul>
                                    <form runat="server" method="post" action="#" role="form">
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="tab1">
                                                <%--<h4></h4>--%>
                                                <asp:GridView ID="GVmassadd" runat="server" 
                                                    CssClass="table" ShowFooter="true" 
                                                    AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="" />
                                                        <asp:TemplateField HeaderText="Palabra">
                                                            <ItemTemplate>
                                                                <asp:TextBox runat="server" CssClass="form-control txbpalabra" ng-model="name" ID="txbpalabra"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Pronunciación">
                                                            <ItemTemplate>
                                                                <asp:TextBox runat="server" CssClass="form-control" ID="txbpron"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Definición">
                                                            <ItemTemplate>
                                                                <asp:TextBox runat="server" CssClass="form-control" ID="txbdefn"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:LinkButton ID="ButtonAdd" OnClick="ButtonAdd_OnClick" runat="server" Text="Agregar fila" CssClass="btn btn-primary btn-xs"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <div class="col-md-6">
                                                    <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="Masivo" OnClick="Masivo_OnClick">Enviar</asp:LinkButton>
                                                    <button type="reset" class="btn btn-default">Limpiar formulario</button>
                                                </div>

                                            </div>
                                            <div class="tab-pane fade" id="tab2">
                                                <%--<h4></h4>--%>
                                                <div class="form-group" ng-app="">
                                                    <asp:Label runat="server">Palabra</asp:Label>
                                                    <p id="palabra"  ng-bind="name" class="text-center"></p>
                                                    <asp:TextBox runat="server" CssClass="form-control" ng-model="name" ID="tbpalabra"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server">Pronunciación</asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="tbpron"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server">Definición</asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" ID="tbdefn"></asp:TextBox>
                                                </div>

                                                <div class="col-md-6">
                                                    <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="OnClick">Agregar</asp:LinkButton>
                                                    <button type="reset" class="btn btn-default">Limpiar formulario</button>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--/.panel-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col-->
        </div>
        <!-- /.row -->

    </div>
    <!--/.main-->
    <!--/.main-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</body>
</html>
