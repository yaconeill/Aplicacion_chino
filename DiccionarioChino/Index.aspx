<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DiccionarioChino.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BD Palabras en Chino</title>

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
            <li class="active"><a href="Index.aspx">
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
            <li><a href="Nueva.aspx">
                <svg class="glyph stroked plus">
                    <use xlink:href="#stroked-plus-sign"></use></svg>
                Agregar nuevas</a></li>
            <li role="presentation" class="divider"></li>
            <li><a href="login.html">
                <svg class="glyph stroked male-user">
                    <use xlink:href="#stroked-male-user"></use></svg>
                Login Page</a></li>
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
                <li class="active">Inicio</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Palabras de "El Nuevo Libro de Chino Práctico"</h1>
            </div>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-3">
                <a href="Palabras.aspx">
                    <div class="panel panel-blue panel-widget ">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked star">
                                    <use xlink:href="#stroked-star" />
                                </svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">
                                    <asp:Label runat="server" ID="PLibro"></asp:Label>
                                </div>
                                <div class="text-muted">Libro</div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <a href="PSuplementarias.aspx">
                    <div class="panel panel-orange panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked tag">
                                    <use xlink:href="#stroked-tag" />
                                </svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">
                                    <asp:Label runat="server" ID="PSuple"></asp:Label>
                                </div>
                                <div class="text-muted">Suplementarias</div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <a href="Plantilla.aspx">
                    <div class="panel panel-teal panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked printer">
                                    <use xlink:href="#stroked-printer" />
                                </svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">
                                    <asp:Label runat="server" ID="Lplant"></asp:Label>
                                </div>
                                <div class="text-muted">Total</div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <a href="Nueva.aspx">
                    <div class="panel panel-red panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked plus sign">
                                    <use xlink:href="#stroked-plus-sign" />
                                </svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"></div>
                                <div class="text-muted">Agregar Nuevas</div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Site Traffic Overview</div>
                    <div class="panel-body">
                        <div class="canvas-wrapper">
                            <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>New Orders</h4>
                        <div class="easypiechart" id="easypiechart-blue" data-percent="92">
                            <span class="percent">92%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Comments</h4>
                        <div class="easypiechart" id="easypiechart-orange" data-percent="65">
                            <span class="percent">65%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>New Users</h4>
                        <div class="easypiechart" id="easypiechart-teal" data-percent="56">
                            <span class="percent">56%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Visitors</h4>
                        <div class="easypiechart" id="easypiechart-red" data-percent="27">
                            <span class="percent">27%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->

        <div class="row">

            <div class="col-md-4">

                <div class="panel panel-blue">
                    <div class="panel-heading dark-overlay">
                        <svg class="glyph stroked clipboard-with-paper">
                            <use xlink:href="#stroked-clipboard-with-paper"></use></svg>To-do List
                    </div>
                    <div class="panel-body">
                        <ul class="todo-list">
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Make a plan for today</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Update Basecamp</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Send email to Jane</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Drink coffee</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Do some work</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                            <li class="todo-list-item">
                                <div class="checkbox">
                                    <input type="checkbox" id="checkbox" />
                                    <label for="checkbox">Tidy up workspace</label>
                                </div>
                                <div class="pull-right action-buttons">
                                    <a href="#">
                                        <svg class="glyph stroked pencil">
                                            <use xlink:href="#stroked-pencil"></use></svg></a>
                                    <a href="#" class="flag">
                                        <svg class="glyph stroked flag">
                                            <use xlink:href="#stroked-flag"></use></svg></a>
                                    <a href="#" class="trash">
                                        <svg class="glyph stroked trash">
                                            <use xlink:href="#stroked-trash"></use></svg></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="panel-footer">
                        <div class="input-group">
                            <input id="btn-input" type="text" class="form-control input-md" placeholder="Add new task" />
                            <span class="input-group-btn">
                                <button class="btn btn-primary btn-md" id="btn-todo">Add</button>
                            </span>
                        </div>
                    </div>
                </div>

            </div>
            <!--/.col-->
        </div>
        <!--/.row-->
    </div>
    <!--/.main-->
    <%-- -------------VIEJO--------------- --%>

    <%--<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<script src="data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>--%>
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
