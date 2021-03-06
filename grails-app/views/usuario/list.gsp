<%@ page import="ii.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.usuarios.label"/></title>
</head>

<body>
<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="usuario.nuevoUsuario.label"/></g:link></li>
    </ul>
</div>

<div id="list-usuario" class="content scaffold-list" role="main">
    <h1><g:message code="usuario.usuarios.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="username"
                              title="${message(code: 'usuario.username.label', default: 'Username')}"/>

            <g:sortableColumn property="nombres" title="${message(code: 'usuario.nombres.label', default: 'Nombres')}"/>

            <g:sortableColumn property="apellidos"
                              title="${message(code: 'usuario.apellidos.label', default: 'Apellidos')}"/>

            <g:sortableColumn property="cargo" title="${message(code: 'usuario.cargo.label', default: 'Cargo')}"/>

            <g:sortableColumn property="ci" title="${message(code: 'usuario.ci.label', default: 'Ci')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>

                <td>${fieldValue(bean: usuarioInstance, field: "nombres")}</td>

                <td>${fieldValue(bean: usuarioInstance, field: "apellidos")}</td>

                <td>${fieldValue(bean: usuarioInstance, field: "cargo")}</td>

                <td>${fieldValue(bean: usuarioInstance, field: "ci")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${usuarioInstanceTotal}"/>
    </div>
</div>
</body>
</html>
