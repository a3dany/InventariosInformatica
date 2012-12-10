<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="activo.activos"/></title>
    <style type="text/css" media="screen">
    #busqueda {
        text-align: center;
        margin: 1em;
        margin-left: 17em;
        margin-bottom: 0em;
        width: 25em;
    }
    </style>
</head>

<body>
<a href="#list-activo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<input type="text" name="busqueda" id="busqueda" value="" placeholder="Ingrese una palabra"/>

<div id="list-activo" class="content scaffold-list" role="main">

    <h1><g:message code="activo.activos"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="serie" title="${message(code: 'activo.serie.label')}"/>

            <th><g:message code="activo.tipo.label"/></th>

            <g:sortableColumn property="nombre" title="${message(code: 'activo.nombre.label')}"/>

            <th><g:message code="activo.marca.label"/></th>

            <g:sortableColumn property="modelo" title="${message(code: 'activo.modelo.label')}"/>

            <th>Acciones</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${activoInstanceList}" status="i" var="activoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${activoInstance.id}">${fieldValue(bean: activoInstance, field: "serie")}</g:link></td>

                <td>${fieldValue(bean: activoInstance, field: "tipo")}</td>

                <td>${fieldValue(bean: activoInstance, field: "nombre")}</td>

                <td>${fieldValue(bean: activoInstance, field: "marca")}</td>

                <td>${fieldValue(bean: activoInstance, field: "modelo")}</td>

                <td>
                    <g:link action="createWith" controller="prestamo" id="${activoInstance.id}">Prestar</g:link>
                    |
                    <g:link action="createWith" controller="cambioEstado" id="${activoInstance.id}">Cambiar estado</g:link>
                    |
                    <g:link action="createWith" controller="movimiento" id="${activoInstance.id}">Mover</g:link>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${activoInstanceTotal}"/>
    </div>

</div>
<g:javascript src="busqueda.js"></g:javascript>
</body>
</html>
