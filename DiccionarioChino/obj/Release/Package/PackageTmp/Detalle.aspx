<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="DiccionarioChino.Detalle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Palabras del Libro</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: white
        }

        #Lpalabra {
            font-size: 73px;
            font-family: "WenQuanYi Micro Hei", "UKai", "STKaiTi", "KaiTi";
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #999;
        }

            .tg td {
                font-family: Arial, sans-serif;
                font-size: 14px;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #999;
                color: #444;
                background-color: #F7FDFA;
            }

            .tg th {
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #999;
                color: #fff;
                background-color: #26ADE4;
            }

            .tg .tg-baqh {
                text-align: center;
                vertical-align: top
            }

            .tg .tg-yw4l {
                vertical-align: top
            }

        #lbFoo {
            position: relative;
            float: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <table class="tg" style="table-layout: fixed; width: 540px">
                    <colgroup>
                        <col style="width: 268px">
                        <col style="width: 272px">
                    </colgroup>
                    <tr>
                        <th class="tg-baqh" colspan="2">
                            <asp:LinkButton runat="server" ID="lbFoo" OnClientClick="window.close(); return false;" CssClass="btn btn-default">
                            <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></asp:LinkButton>
                            <asp:Label runat="server" ID="Lpalabra"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <td class="tg-baqh">Pronunciación:</td>
                        <td class="tg-baqh">Definicición:</td>
                    </tr>
                    <tr>
                        <td class="tg-baqh">
                            <asp:TextBox runat="server" ID="tbpron" BorderStyle="None" BackColor="#F7FDFA" CssClass="text-center"></asp:TextBox>
                        </td>
                        <td class="tg-yw4l">
                            <asp:TextBox TextMode="MultiLine" Rows="3" Columns="34" runat="server" ID="Tbdef" CssClass="text-center" BackColor="#F7FDFA" BorderStyle="none" EnableViewState="False" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <script src="vendor/jquery/jquery.min.js"></script>

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
    <script type="text/javascript" src="js/JavaScript.js"></script>

</body>
</html>
