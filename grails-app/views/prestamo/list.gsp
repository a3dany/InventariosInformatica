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
        <li><g:link class="list" action="listPrestamosAnteriores"><g:message
                code="prestamo.anterioresPrestamos"/></g:link></li>
    </ul>
</div>

<div id="list-prestamo" class="content scaffold-list" role="main">
    <h1><g:message code="prestamo.prestamos"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="prestamo.item.label"/></th>

            <th><g:message code="prestamo.solicitante.label"/></th>

            <th><g:message code="prestamo.ambiente"/></th>

            <g:sortableColumn property="fechaInicio" title="${message(code: 'prestamo.fechaInicio.label')}"/>
            <g:sortableColumn property="fechaFin" title="${message(code: 'prestamo.fechaFin.label')}"/>

            <th>Estado</th>
            <th></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "item")}</g:link></td>

                <td>${fieldValue(bean: prestamoInstance, field: "solicitante")}</td>

                <td>${fieldValue(bean: prestamoInstance, field: "ambienteDondeEstara")}</td>

                <td>${fieldValue(bean: prestamoInstance, field: "fechaInicio")}</td>

                <td>${fieldValue(bean: prestamoInstance, field: "fechaFin")}</td>



                <g:if test="${prestamoInstance.prestado}">
                    <g:if test="${LocalDateTime.now() > prestamoInstance.fechaFin}">
                        <td id="rojo">Tiempo exedido</td>
                    </g:if>
                    <g:else>
                        <td id="verde">En prestamo</td>
                    </g:else>
                </g:if>
                <g:else>
                    <td>Reservado</td>
                </g:else>

                <td>
                    <g:if test="${prestamoInstance.prestado}">
                        <g:link action="entregar" id="${prestamoInstance.id}">Entregar</g:link>
                    </g:if>
                    <g:else>
                        <g:link action="prestar" id="${prestamoInstance.id}">Prestar</g:link>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<g:javascript src="actualizacion.js"></g:javascript>
</body>
</html>
