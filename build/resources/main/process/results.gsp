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
    <link href='https://fonts.googleapis.com/css?family=Playfair+Display:700,900|Fira+Sans:400,400italic' rel='stylesheet' type='text/css'>


    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="jquery.dataTables.min.css"/>
    <asset:stylesheet src="reset.css"/>
    <asset:stylesheet src="style.css"/>

    <asset:javascript src="modernizr.js"/>

    <asset:javascript src="jquery-2.1.4.js"/>
    <asset:javascript src="jquery.mobile.custom.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery.dataTables.min.js"/>
    <asset:javascript src="main.js"/>


</head>

<body>
<section>
    <div >
        <table id="myTable">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Proceso</th>
                    <th>Ráfaga de CPU</th>
                    <th>Tiempo de espera promedio</th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${originalProcesses}" var="process" status="i">
                <tr>
                    <td>${i}</td>
                    <td>${process.nombre}</td>
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
                            <li><a href="#0" data-date="${process.date}" class="selected">${process.nombre}</a></li>
                        </g:if>
                        <g:else>
                            <li><a href="#0" data-date="${process.date}" >${process.nombre}</a></li>
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
                        <h2>${process.nombre}</h2>
                        <em>Start: ${process.start}</em>
                        <em>End: ${process.end}</em>

                    </li>
                </g:if>
                <g:else>
                    <li  data-date="${process.date}">
                        <h2>${process.nombre}</h2>
                        <em>Start: ${process.start}</em>
                        <em>End: ${process.end}</em>

                    </li>
                </g:else>
            </g:each>

        </ol>
    </div> <!-- .events-content -->
</section>
<g:javascript>
    $(document).ready(function() {
        $('#myTable').dataTable( {
            "pageLength": 50,
            "language": {
                "decimal":        "",
                "emptyTable":     "No hay información disponible",
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
            }
        });
    });

</g:javascript>
</body>
</html>