<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 28/05/16
  Time: 10:54 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="bootstrap.css"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}" type="text/css">
    <asset:stylesheet src="jquery-ui.css"/>
    <asset:stylesheet src="reset.css"/>
    <asset:stylesheet src="style.css"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.dataTables.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dataTables.tableTools.css')}" type="text/css">
    <asset:stylesheet src="dataTables.tableTools.css"/>
    <asset:stylesheet src="custom.css"/>

    <asset:javascript src="jquery-2.1.4.js"/>
    <asset:javascript src="jquery.mobile.custom.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="modernizr.js"/>
    <asset:javascript src="main.js"/>
    <asset:javascript src="jquery.dataTables.min.js"/>
    <asset:javascript src="dataTables.tableTools.js"/>
    <asset:javascript src="custom.js"/>

    <g:layoutHead/>
</head>

<body class="index" id="page-top">
    <nav class="navbar navbar-default navbar-fixed-top navbar-header">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand">Round Robin</a>
            </div>
        </div>
    </nav>
    <div class="container body">
        <div class="main_container">
            <div class="right_col" role="main">
                <div class="">
                    <br />
                    <br />
                    <br />
                    <g:layoutBody/>
                </div>
            </div>
        </div>
    </div>

</body>
</html>