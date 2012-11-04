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
    </style>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="status" role="complementary">
    <sec:ifNotLoggedIn>
        <g:link controller="login" action="auth">Ingresa al sistema</g:link>
    </sec:ifNotLoggedIn>
    <sec:ifAnyGranted roles="ROLE_USUARIO,ROLE_TECNICO,ROLE_ADMINISTRADOR">
        <h1>Registro</h1>
        <ul>
            <li>- <g:link controller="prestamo">Prestamos</g:link></li>
            <li>- <g:link controller="cambioEstado">Cambios de estado</g:link></li>
            <li>- <g:link controller="movimiento">Movimientos</g:link></li>
            <br/>
        </ul>
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_TECNICO,ROLE_ADMINISTRADOR">
        <h1>ACTIVOS</h1>
        <ul>
            <li>- <g:link controller="activo">Activos Fijos</g:link></li>
            <li>- <g:link controller="tipoActivo">Tipos de Activos</g:link></li>
            <br/>
        </ul>
    </sec:ifAnyGranted>
    <sec:ifAllGranted roles="ROLE_ADMINISTRADOR">
        <h1>Administrar</h1>
        <ul>
            <li>- <g:link controller="usuario">Usuarios</g:link></li>
            <li>- <g:link controller="ambiente">Ambientes</g:link></li>
            <li>- <g:link controller="tipoAmbiente">Tipos de Ambientes</g:link></li>
            <li>- <g:link controller="nivel">Niveles</g:link></li>
            <br/>
        </ul>
    </sec:ifAllGranted>
</div>

<div id="page-body" role="main">
    <h1>Bienvenido</h1>

    <p>Inventarios Informática es un sistema web moderno que permite la administración de los activos fijos de la carrera de Informática de la Universidad Mayor de San Andrés. Este sistema ademas cuenta con una aplicación móvil para Android con la cual se podran hacer registros mas rapidos.</p>
    <br/>
    <p align="center"><img src="${resource(dir: 'images', file: 'laboratorio_informatica.png')}" alt="Informática"/></p>
</div>
</body>
</html>
