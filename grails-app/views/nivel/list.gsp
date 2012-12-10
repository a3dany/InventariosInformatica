<%@ page import="ii.Nivel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="nivel.niveles.label"/></title>
</head>

<body>
<a href="#list-nivel" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="nivel.nuevoNivel.label"/></g:link></li>
    </ul>
</div>

<div id="list-nivel" class="content scaffold-list" role="main">
    <h1><g:message code="nivel.niveles.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'nivel.nombre.label', default: 'Nombre')}"/>

            <g:sortableColumn property="descripcion"
                              title="${message(code: 'nivel.descripcion.label', default: 'Descripcion')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${nivelInstanceList}" status="i" var="nivelInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${nivelInstance.id}">${fieldValue(bean: nivelInstance, field: "nombre")}</g:link></td>

                <td>${fieldValue(bean: nivelInstance, field: "descripcion")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${nivelInstanceTotal}"/>
    </div>
</div>
</body>
</html>
