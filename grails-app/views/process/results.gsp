<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 28/05/16
  Time: 10:54 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mainPage">
</head>

<body>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_content">
                <section>
                    <div >
                        <table id="myTable" class="table table-striped responsive-utilities jambo_table">
                            <thead>
                            <tr class="headings">
                                <th>#</th>
                                <th>Proceso</th>
                                <th>Ráfaga de CPU</th>
                                <th>Tiempo de espera</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${originalProcesses}" var="process" status="i">
                                <tr class="even pointer">
                                    <td>${i}</td>
                                    <td>${process.name}</td>
                                    <td>${process.totalCpu}</td>
                                    <td>${process.waitTime}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </section>
                <section class="cd-horizontal-timeline">
                    <div class="timeline">
                        <div class="events-wrapper">
                            <div class="events">
                                <ol>
                                    <g:each in="${processes}" var="process" status="i">
                                        <g:if test="${i == 0}">
                                            <li><a href="#0" data-date="${process.date}" class="selected">${process.name}</a></li>
                                        </g:if>
                                        <g:else>
                                            <li><a href="#0" data-date="${process.date}" >${process.name}</a></li>
                                        </g:else>
                                    </g:each>

                                </ol>

                                <span class="filling-line" aria-hidden="true"></span>
                            </div> <!-- .events -->
                        </div> <!-- .events-wrapper -->

                        <ul class="cd-timeline-navigation">
                            <li><a href="#0" class="prev inactive">Prev</a></li>
                            <li><a href="#0" class="next">Next</a></li>
                        </ul> <!-- .cd-timeline-navigation -->
                    </div> <!-- .timeline -->

                    <div class="events-content">
                        <ol>
                            <g:each in="${processes}" var="process" status="i">
                                <g:if test="${i == 0}">
                                    <li class="selected" data-date="${process.date}">
                                        <h2>${process.name}</h2>
                                        <em>Tiempo de inicio: ${process.start}</em>
                                        <em>Tiempo de final: ${process.end}</em>
                                        <em>Duración: ${process.end - process.start}</em>
                                    </li>
                                </g:if>
                                <g:else>
                                    <li  data-date="${process.date}">
                                        <h2>${process.name}</h2>
                                        <em>Tiempo de inicio: ${process.start}</em>
                                        <em>Timpo de final: ${process.end}</em>
                                        <em>Duración: ${process.end - process.start}</em>

                                    </li>
                                </g:else>
                            </g:each>

                        </ol>
                    </div> <!-- .events-content -->
                </section>
            </div>
        </div>
    </div>
</div>

<g:javascript>
    $(document).ready(function() {
        var oTable = $('#myTable').dataTable({
            "pageLength": 10,
            "language": {
                "decimal":        "",
                "emptyTable":     "No hay informacion disponible",
                "info":           "Mostrando del _START_ al _END_ de _TOTAL_ entradas",
                "infoEmpty":      "Mostrando 0 de 0 de 0 entradas",
                "infoFiltered":   "(filtrado de _MAX_ total entradas)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Mostrar _MENU_ entradas",
                "loadingRecords": "Cargando...",
                "processing":     "Procesando...",
                "search":         "Buscar:",
                "zeroRecords":    "No se han encontrado resultados",
                "paginate": {
                    "first":      "Primero",
                    "last":       "Ultimo",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
                },
                "aria": {
                    "sortAscending":  ": Activar ordenación ascendente",
                    "sortDescending": ": Activar ordenacion descendente"
                }
            },
            "aoColumnDefs": [
                {
                    'bSortable': false,
                    'aTargets': [0]
                } //disables sorting for column one
            ],
            'iDisplayLength': 12,
            "sPaginationType": "full_numbers"
        });
    });

</g:javascript>
</body>
</html>