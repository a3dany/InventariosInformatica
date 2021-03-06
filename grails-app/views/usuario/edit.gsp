<%@ page import="ii.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="usuario.editar.label"/></title>
</head>

<body>
<a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAllGranted roles="ADMINISTRADOR">
            <li><g:link class="list" action="list"><g:message code="usuario.usuarios.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="usuario.nuevoUsuario.label"/></g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="edit-usuario" class="content scaffold-edit" role="main">
    <h1><g:message code="usuario.editar.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usuarioInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${usuarioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${usuarioInstance?.id}"/>
        <g:hiddenField name="version" value="${usuarioInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <sec:ifAllGranted roles="ADMINISTRADOR">
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                formnovalidate=""
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAllGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
