<%@ page import="org.joda.time.LocalDateTime; ii.Prestamo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}"/>
    <title><g:message code="prestamo.prestamos"/></title>
</head>

<body>
<a href="#list-prestamo" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="prestamo.nuevoprestamo"/></g:link></li>
        <li><g:link class="list" action="list"><g:message code="prestamo.prestamos"/></g:link></li>
    </ul>
</div>

<div id="list-prestamo" class="content scaffold-list" role="main">
    <h1><g:message code="prestamo.prestamosAnteriores"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="prestamo.item.label" default="Item"/></th>

            <th><g:message code="prestamo.solicitante.label" default="Solicitante"/></th>

            <th><g:message code="prestamo.ambiente"/></th>

            <g:sortableColumn property="fechaEntrega"
                              title="${message(code: 'prestamo.fechaEntrega.label')}"/>
            <g:sortableColumn property="fechaDevolucion" title="${message(code: 'prestamo.fechaDevolucion.label')}"/>

            <th><g:message code="prestamo.observaciones.label"/> </th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "item")}</g:link></td>

                <td>${fieldValue(bean: prestamoInstance, field: "solicitante")}</td>
                <td>${fieldValue(bean: prestamoInstance, field: "ambienteDondeEstara")}</td>
                <td>${fieldValue(bean: prestamoInstance, field: "fechaEntrega")}</td>
                <td>${fieldValue(bean: prestamoInstance, field: "fechaDevolucion")}</td>
                <td>${fieldValue(bean: prestamoInstance, field: "observacionDevolucion")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>