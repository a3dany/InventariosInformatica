<%@ page import="ii.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.label"/></title>
</head>

<body>
<a href="#show-usuario" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAllGranted roles="ADMINISTRADOR">
            <li><g:link class="list" action="list"><g:message code="usuario.usuarios.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="usuario.nuevoUsuario.label"/></g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="show-usuario" class="content scaffold-show" role="main">
    <h1><g:message code="usuario.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list usuario">

        <g:if test="${usuarioInstance?.username}">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><g:message code="usuario.username.label"
                                                                            default="Username"/></span>

                <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                            field="username"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.nombres}">
            <li class="fieldcontain">
                <span id="nombres-label" class="property-label"><g:message code="usuario.nombres.label"
                                                                           default="Nombres"/></span>

                <span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                           field="nombres"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.apellidos}">
            <li class="fieldcontain">
                <span id="apellidos-label" class="property-label"><g:message code="usuario.apellidos.label"
                                                                             default="Apellidos"/></span>

                <span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                             field="apellidos"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.cargo}">
            <li class="fieldcontain">
                <span id="cargo-label" class="property-label"><g:message code="usuario.cargo.label"
                                                                         default="Cargo"/></span>

                <span class="property-value" aria-labelledby="cargo-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                         field="cargo"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.ci}">
            <li class="fieldcontain">
                <span id="ci-label" class="property-label"><g:message code="usuario.ci.label" default="Ci"/></span>

                <span class="property-value" aria-labelledby="ci-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                      field="ci"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.accountExpired}">
            <li class="fieldcontain">
                <span id="accountExpired-label" class="property-label"><g:message code="usuario.accountExpired.label"
                                                                                  default="Account Expired"/></span>

                <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                        boolean="${usuarioInstance?.accountExpired}"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.accountLocked}">
            <li class="fieldcontain">
                <span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label"
                                                                                 default="Account Locked"/></span>

                <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                        boolean="${usuarioInstance?.accountLocked}"/></span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.enabled}">
            <li class="fieldcontain">
                <span id="enabled-label" class="property-label"><g:message code="usuario.estadoCuenta.label"/></span>

                <span class="property-value" aria-labelledby="enabled-label">Habilitado</span>

            </li>
        </g:if>

        <g:if test="${usuarioInstance?.passwordExpired}">
            <li class="fieldcontain">
                <span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label"
                                                                                   default="Password Expired"/></span>

                <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                        boolean="${usuarioInstance?.passwordExpired}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${usuarioInstance?.id}"/>
            <g:link class="edit" action="edit" id="${usuarioInstance?.id}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <sec:ifAllGranted roles="ADMINISTRADOR">
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAllGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
