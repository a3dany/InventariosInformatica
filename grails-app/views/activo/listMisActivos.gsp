<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="activo.misActivos.label"/></title>
</head>

<body>
<a href="#list-activo" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="documento" href="#"><g:message code="Generar PDF"/></a></li>
    </ul>
</div>

<div id="list-activo" class="content scaffold-list" role="main">
    <h1><g:message code="activo.misActivos.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="serie" title="${message(code: 'activo.serie.label', default: 'Serie')}"/>

            <th><g:message code="activo.tipo.label" default="Tipo"/></th>

            <g:sortableColumn property="nombre" title="${message(code: 'activo.nombre.label', default: 'Nombre')}"/>

            <th><g:message code="activo.marca.label" default="Marca"/></th>

            <g:sortableColumn property="modelo" title="${message(code: 'activo.modelo.label', default: 'Modelo')}"/>
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
