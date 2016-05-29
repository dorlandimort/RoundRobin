<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 29/05/16
  Time: 04:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Prueba</title>
    <meta name="layout" content="mainPage">
</head>

<body>
<div class="page-title">
    <div class="title_left">
        <h3>Ingresar datos</h3>
    </div>
</div>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">

            <div class="x_content">
                <input type="button" value="Agregar Proceso" id="newProcess" class=" col-md-2 col-xs-4">
                <br />
                <br />
                <br />
                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                      action="${createLink(controller: 'process', action: 'results')}">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Quatum:</label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <input class="form-control col-md-1 col-xs-12" placeholder="Milisegundos" required name="quantum" type="text">
                        </div>
                    </div>
                    <div class="row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nombre:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" placeholder="Nombre" name="name" required class="form-control col-md-7 col-xs-12">
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <br />
                        </div>
                    </div>

                    <div class="row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Ráfaga de CPU:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" placeholder="Milisegundos" name="cpu" required class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group" id="processes">
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button type="reset" class="btn btn-primary">Limpiar</button>
                            <button type="submit" class="btn btn-success">Enviar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function() {
        $("#newProcess").click(function() {
            $.ajax({
                method: 'GET',
                url: '${createLink(controller: 'process', action: '_processInput')}',
                success: function(result) {
                    $("#processes").append(result);
                    $(".remove").click(function() {
                        $(this).parents(".process").remove();
                    });
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });
    });
</g:javascript>
</body>
</html>