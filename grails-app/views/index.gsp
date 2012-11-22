<%@ page import="ii.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inventarios Informática</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }

    #colum1 {
        float: left;
        width: 20%;
    }

    #colum2 {
        float: left;
        width: 20%;
    }

    #colum3 {
        float: left;
        width: 20%;
    }

    #colum4 {
        float: left;
        width: 20%;
    }

    #colum1, #colum2, #colum3, #colum4 {
        text-align: center;
        margin: 1.4em;
        margin-top: 6em;
        margin-bottom: 6em;
    }

    #fincolum {
        clear: both;

        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;

        text-align: center;
    }

    .navi {
        list-style-type: none;
        text-align: left;
        width: 12em;
    }

    li {
        padding-top: 0.4em;
        padding-left: 0.25em;
        padding-bottom: 0.4em;
    }

    li a {
        padding: 0.25em;
        text-decoration: none;
        color: #383838;
        background-color: #ECECEC;
        -moz-border-radius: 0.3em;
        -webkit-border-radius: 0.3em;
        border-radius: 0.3em;


    }

    li a:hover {
        background-color: #C6C6C6;
    }

    li a:active {
        background-color: #C6C6C6;
    }

    </style>
</head>

<body>
<sec:ifAnyGranted roles="AUTORIDAD,TECNICO,ADMINISTRADOR">
    <div id="colum1">

        <img src="images/icon_consultas.png">

        <h1>Informar</h1>

        <ul class="navi">
            <li><g:link controller="activo" action="listPedidos">Pedidos</g:link></li>
        </ul>

    </div>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="PORTERO,TECNICO,ADMINISTRADOR">
    <div id="colum2">

        <img src="images/icon_movimientos.png">

        <h1>Mover</h1>
        <ul class="navi">
            <li><g:link controller="prestamo">Prestamos</g:link></li>
            <li><g:link controller="cambioEstado">Cambios de estado</g:link></li>
            <li><g:link controller="movimiento">Movimientos</g:link></li>
        </ul>

    </div>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="TECNICO,ADMINISTRADOR">
    <div id="colum3">

        <img src="images/icon_activo.png">

        <h1>Inventariar</h1>
        <ul class="navi">
            <li><g:link controller="activo">Activos Fijos</g:link></li>
            <li><g:link controller="tipoActivo">Tipos de Activos</g:link></li>
        </ul>

    </div>
</sec:ifAnyGranted>
<sec:ifAllGranted roles="ADMINISTRADOR">
    <div id="colum4">

        <img src="images/icon_admin.png">

        <h1>Administrar</h1>
        <ul class="navi">
            <li><g:link controller="usuario">Usuarios</g:link></li>
            <br/>INFRAESTRUCTURA
            <li><g:link controller="ambiente">Ambientes</g:link></li>
            <li><g:link controller="tipoAmbiente">Tipos de Ambientes</g:link></li>
            <li><g:link controller="nivel">Niveles</g:link></li>
        </ul>

    </div>
</sec:ifAllGranted>

<div id="fincolum">
    ${Usuario.findByUsername(sec.username()).cargo},
    <g:link action="show" controller="usuario"
            id="${Usuario.findByUsername(sec.username()).id}">Configurar cuenta</g:link>
</div>
</body>
</html>
