﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Palabras.aspx.cs" Inherits="DiccionarioChino.Palabras" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Palabras del Libro</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>
    <%--    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
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
                <ul class="user-menu">
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
                </ul>
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
                <svg class="glyph stroked dashboard-dial">
                    <use xlink:href="#stroked-dashboard-dial"></use></svg>
                Inicio</a></li>
            <li><a href="#">
                <svg class="glyph stroked calendar">
                    <use xlink:href="#stroked-calendar"></use></svg>
                Widgets</a></li>
            <li><a href="#">
                <svg class="glyph stroked line-graph">
                    <use xlink:href="#stroked-line-graph"></use></svg>
                Charts</a></li>
            <li class="active"><a href="tables.html">
                <svg class="glyph stroked table">
                    <use xlink:href="#stroked-table"></use></svg>
                Tables</a></li>
            <li><a href="#">
                <svg class="glyph stroked pencil">
                    <use xlink:href="#stroked-pencil"></use></svg>
                Forms</a></li>
            <li><a href="#">
                <svg class="glyph stroked app-window">
                    <use xlink:href="#stroked-app-window"></use></svg>
                Alerts &amp; Panels</a></li>
            <li><a href="#">
                <svg class="glyph stroked star">
                    <use xlink:href="#stroked-star"></use></svg>
                Icons</a></li>
            <li class="parent ">
                <a href="#">
                    <span data-toggle="collapse" href="#sub-item-1">
                        <svg class="glyph stroked chevron-down">
                            <use xlink:href="#stroked-chevron-down"></use></svg></span> Dropdown 
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a class="" href="#">
                            <svg class="glyph stroked chevron-right">
                                <use xlink:href="#stroked-chevron-right"></use></svg>
                            Sub Item 1
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <svg class="glyph stroked chevron-right">
                                <use xlink:href="#stroked-chevron-right"></use></svg>
                            Sub Item 2
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <svg class="glyph stroked chevron-right">
                                <use xlink:href="#stroked-chevron-right"></use></svg>
                            Sub Item 3
                        </a>
                    </li>
                </ul>
            </li>
            <li role="presentation" class="divider"></li>
            <li><a href="login.html">
                <svg class="glyph stroked male-user">
                    <use xlink:href="#stroked-male-user"></use></svg>
                Login Page</a></li>
        </ul>
        <div class="attribution">Template by <a href="http://www.medialoot.com/item/lumino-admin-bootstrap-template/">Medialoot</a><br />
            <a href="http://www.glyphs.co" style="color: #333;">Icons by Glyphs</a></div>
    </div>
    <!--/.sidebar-->

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#">
                    <svg class="glyph stroked home">
                        <use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">Icons</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Palabras del libro</h1>
            </div>
        </div>
        <!--/.row-->


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <form runat="server" id="formPalabras">
                        <div class="panel-heading">Mostrar Tabla</div>
                        <div class="panel-body">
                            <asp:DropDownList runat="server" ID="DDfuente" CssClass="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="DDfuente_OnLoad">
                            </asp:DropDownList>
                            <asp:DropDownList runat="server" ID="DDTema" CssClass="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="DDTema_OnSelectedIndexChanged">
                            </asp:DropDownList><br />
                            <div class="table-striped">
                                <asp:GridView ID="GVpalabras" runat="server"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="headword"
                                    OnRowCommand="GVpalabras_OnRowCommand"
                                    CssClass="table table-bordered bs-table text-center">
                                    <Columns>
                                        <asp:BoundField DataField="headword" HeaderText="Palabra"></asp:BoundField>
                                        <asp:BoundField DataField="pron" HeaderText="Pronunciación"></asp:BoundField>
                                        <asp:BoundField DataField="defn" HeaderText="Definición"></asp:BoundField>
                                        <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                                        <asp:ButtonField ButtonType="Button" Text="Ver" CommandName="mostrar" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--                    <table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="state" data-checkbox="true" >Item ID</th>
                            <th data-field="id" data-sortable="true">Item ID</th>
                            <th data-field="name"  data-sortable="true">Item Name</th>
                            <th data-field="price" data-sortable="true">Item Price</th>
                        </tr>
                        </thead>
                    </table>--%>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Basic Table</div>
                    <div class="panel-body">
                        <table data-toggle="table" data-url="tables/data2.json">
                            <thead>
                                <tr>
                                    <th data-field="id" data-align="right">Item ID</th>
                                    <th data-field="name">Item Name</th>
                                    <th data-field="price">Item Price</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Styled Table</div>
                    <div class="panel-body">
                        <table data-toggle="table" id="table-style" data-url="tables/data2.json" data-row-style="rowStyle">
                            <thead>
                                <tr>
                                    <th data-field="id" data-align="right">Item ID</th>
                                    <th data-field="name">Item Name</th>
                                    <th data-field="price">Item Price</th>
                                </tr>
                            </thead>
                        </table>
                        <script>
                            $(function () {
                                $('#hover, #striped, #condensed').click(function () {
                                    var classes = 'table';

                                    if ($('#hover').prop('checked')) {
                                        classes += ' table-hover';
                                    }
                                    if ($('#condensed').prop('checked')) {
                                        classes += ' table-condensed';
                                    }
                                    $('#table-style').bootstrapTable('destroy')
                                        .bootstrapTable({
                                            classes: classes,
                                            striped: $('#striped').prop('checked')
                                        });
                                });
                            });

                            function rowStyle(row, index) {
                                var classes = ['active', 'success', 'info', 'warning', 'danger'];

                                if (index % 2 === 0 && index / 2 < classes.length) {
                                    return {
                                        classes: classes[index / 2]
                                    };
                                }
                                return {};
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->


    </div>
    <!--/.main-->
    <%--    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    <script type="text/javascript" src="js/JavaScript.js"></script>--%>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script>
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
    </script>
</body>
</html>
