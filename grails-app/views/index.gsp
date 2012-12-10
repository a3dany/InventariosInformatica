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

    /* AUTORIDAD */

#columnaUno {
    text-align: right;
    margin: 1.4em;
    margin-top: 7em;
    float: left;
    width: 40%;
}

#columnaDos {
    margin: 1.4em;
    margin-top: 6em;
    text-align: left;
    float: left;
    width: 40%;
}

#columnaUno, #columnaDos {
    margin-bottom: 6em;
}

    /*PARA DOS*/

#columnaA {
    margin: 1.4em;
    margin-top: 7em;
    text-align: right;
    float: left;
    width: 20%;
}

#columnaB {
    margin: 1.4em;
    margin-top: 6em;
    text-align: left;
    float: left;
    width: 20%;
}

#columnaC {
    margin: 1.4em;
    margin-top: 7em;
    text-align: right;
    float: left;
    width: 10%;
}

#columnaD {
    margin: 1.4em;
    margin-top: 6em;
    text-align: left;
    float: left;
    width: 20%;
}

#columnaA, #columnaB, #columnaC, #columnaD {
    margin-bottom: 6em;
}

    /*PARA TRES*/

#columnaAA {
    float: left;
    width: 20%;
}

#columnaBB {
    float: left;
    width: 20%;
}

#columnaCC {
    float: left;
    width: 20%;
}

#columnaAA, #columnaBB, #columnaCC {
    text-align: center;
    margin: 1.4em;
    margin-top: 6em;
    margin-left: 5em;
    margin-bottom: 6em;
}

    /* FIN */

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

.micolor {
    text-align: start;
    color: #777777;
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

<!-- ADMINISTRADOR -->

<sec:ifAllGranted roles="ADMINISTRADOR">
    <div id="colum1">

        <img src="images/icon_consultas.png">

        <h1>Informar</h1>

        <ul class="navi">
            <span class="micolor">BUSQUEDA</span>
            <li><g:link controller="activo" action="buscarActivo">Buscar Activo</g:link></li>
            <span class="micolor">INFORMES</span>
            <li><g:link controller="activo" action="listPedidos">Pedidos</g:link></li>
            <li><g:link controller="activo" action="listPorAmbiente">Activos fijos</g:link></li>
            <li><g:link controller="ambiente" action="list">Ambientes</g:link></li>
        </ul>

    </div>

    <div id="colum2">

        <img src="images/icon_movimientos.png">

        <h1>Mover</h1>
        <ul class="navi">
            <li><g:link controller="prestamo">Prestamos</g:link></li>
            <li><g:link controller="cambioEstado">Cambios de estado</g:link></li>
            <li><g:link controller="movimiento">Movimientos</g:link></li>
        </ul>

    </div>

    <div id="colum3">

        <img src="images/icon_activo.png">

        <h1>Inventariar</h1>
        <ul class="navi">
            <li><g:link controller="activo">Activos Fijos</g:link></li>
            <li><g:link controller="activo" action="create">Nuevo Activo</g:link></li>
            <li><g:link controller="activo" action="createPedido">Nuevo Pedido</g:link></li>
            <li><g:link controller="tipoActivo">Tipos de Activos</g:link></li>
        </ul>

    </div>

    <div id="colum4">

        <img src="images/icon_admin.png">

        <h1>Administrar</h1>
        <ul class="navi">
            <span class="micolor">USUARIOS</span>
            <li><g:link controller="usuario">Gestionar</g:link></li>
            <li><g:link controller="usuario" action="create">Nuevo</g:link></li>
            <span class="micolor">INFRAESTRUCTURA</span>
            <li><g:link controller="ambiente">Ambientes</g:link></li>
            <li><g:link controller="nivel">Niveles</g:link></li>
            <li><g:link controller="tipoAmbiente">Tipos de Ambientes</g:link></li>
        </ul>

    </div>
</sec:ifAllGranted>

<!-- PORTERO -->

<sec:ifAllGranted roles="PORTERO">
    <div id="columnaA">

        <img src="images/icon_consultas.png">

    </div>

    <div id="columnaB">

        <h1>Informar</h1>
        <ul class="navi">
            <span class="micolor">BUSQUEDA</span>
            <li><g:link controller="activo" action="buscarActivo">Buscar Activo</g:link></li>
            <span class="micolor">INFORMES</span>
            <li><g:link controller="activo" action="listPedidos">Pedidos</g:link></li>
            <li><g:link controller="activo" action="listPorAmbiente">Activos fijos</g:link></li>
            <li><g:link controller="ambiente" action="list">Ambientes</g:link></li>
            <span class="micolor">PERSONAL</span>
            <li><g:link controller="activo" action="misActivos">Mis activos fijos</g:link></li>
            <li><g:link controller="activo" action="listPedidos">Mis prestamos</g:link></li>
        </ul>

    </div>

    <div id="columnaC">

        <img src="images/icon_movimientos.png">

    </div>

    <div id="columnaD">

        <h1>Mover</h1>
        <ul class="navi">
            <li><g:link controller="prestamo">Prestamos</g:link></li>
            <li><g:link controller="cambioEstado">Cambios de estado</g:link></li>
            <li><g:link controller="movimiento">Movimientos</g:link></li>
        </ul>

    </div>
</sec:ifAllGranted>

<!-- TECNICO -->

<sec:ifAllGranted roles="TECNICO">
    <div id="columnaAA">

        <img src="images/icon_consultas.png">

        <h1>Informar</h1>

        <ul class="navi">
            <span class="micolor">BUSQUEDA</span>
            <li><g:link controller="activo" action="buscarActivo">Buscar Activo</g:link></li>
            <span class="micolor">INFORMES</span>
            <li><g:link controller="activo" action="listPedidos">Pedidos</g:link></li>
            <li><g:link controller="activo" action="listPorAmbiente">Activos fijos</g:link></li>
            <li><g:link controller="ambiente" action="list">Ambientes</g:link></li>
            <span class="micolor">PERSONAL</span>
            <li><g:link controller="activo" action="misActivos">Mis activos fijos</g:link></li>
            <li><g:link controller="activo" action="listPedidos">Mis prestamos</g:link></li>
        </ul>

    </div>

    <div id="columnaBB">

        <img src="images/icon_movimientos.png">

        <h1>Mover</h1>
        <ul class="navi">
            <li><g:link controller="prestamo">Prestamos</g:link></li>
            <li><g:link controller="cambioEstado">Cambios de estado</g:link></li>
            <li><g:link controller="movimiento">Movimientos</g:link></li>
        </ul>

    </div>

    <div id="columnaCC">

        <img src="images/icon_activo.png">

        <h1>Inventariar</h1>
        <ul class="navi">
            <li><g:link controller="activo">Activos Fijos</g:link></li>
            <li><g:link controller="tipoActivo">Tipos de Activos</g:link></li>
        </ul>

    </div>

</sec:ifAllGranted>

<!-- AUTORIDAD y USUARIO GENERAL-->

<sec:ifAnyGranted roles="AUTORIDAD, USUARIO GENERAL">
    <div id="columnaUno">
        <img src="images/icon_consultas.png">
    </div>

    <div id="columnaDos">
        <h1>Informar</h1>
        <ul class="navi">
            <span class="micolor">BUSQUEDA</span>
            <li><g:link controller="activo" action="buscarActivo">Buscar Activo</g:link></li>
            <span class="micolor">INFORMES</span>
            <li><g:link controller="activo" action="listPedidos">Pedidos</g:link></li>
            <li><g:link controller="activo" action="listPorAmbiente">Activos fijos</g:link></li>
            <li><g:link controller="ambiente" action="list">Ambientes</g:link></li>
            <span class="micolor">PERSONAL</span>
            <li><g:link controller="activo" action="misActivos">Mis activos fijos</g:link></li>
            <li><g:link controller="prestamo" action="misPrestamos">Mis prestamos</g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>

<div id="fincolum">
    ${Usuario.findByUsername(sec.username()).cargo},
    <g:link action="show" controller="usuario"
            id="${Usuario.findByUsername(sec.username()).id}">Configurar cuenta</g:link>
</div>
</body>
</html>
