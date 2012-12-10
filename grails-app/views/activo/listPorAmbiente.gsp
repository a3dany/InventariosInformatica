<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="activo.activos"/></title>
</head>

<body>
<a href="#list-activo" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAnyGranted roles="ADMINISTRADOR,TECNICO">
            <li><g:link class="create" action="create"><g:message code="activo.nuevoactivo"/></g:link></li>
            <li><g:link class="list" action="listPedidos"><g:message code="activo.pedidos"/></g:link></li>
            <li><g:link class="create" action="createPedido"><g:message code="activo.nuevopedido"/></g:link></li>
        </sec:ifAnyGranted>
    </ul>
</div>

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

            <th>Ambiente</th>

            <g:sortableColumn property="ambienteActual.nivel.nombre" title="Piso" defaultOrder="asc"/>

            <th><g:message code="activo.responsable.label"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${activoInstanceList}" status="i" var="activoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:link action="show"
                            id="${activoInstance.id}">${fieldValue(bean: activoInstance, field: "serie")}</g:link>
                </td>

                <td>${fieldValue(bean: activoInstance, field: "tipo")}</td>

                <td>${fieldValue(bean: activoInstance, field: "nombre")}</td>

                <td>${activoInstance.ambienteActual}</td>

                <td>${fieldValue(bean: activoInstance, field: "ambienteActual.nivel.nombre")}</td>

                <td><g:link action="show" controller="usuario"
                            id="${activoInstance.responsable.id}">${activoInstance.responsable}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${activoInstanceTotal}"/>
    </div>
</div>
</body>
</html>
