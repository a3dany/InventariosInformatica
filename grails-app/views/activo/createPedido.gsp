<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activo.activo')}"/>
    <title><g:message code="activo.nuevopedido"/></title>
</head>

<body>
<a href="#create-activo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="listPedidos"><g:message code="activo.pedidos"/></g:link></li>
    </ul>
</div>

<div id="create-activo" class="content scaffold-create" role="main">
    <h1><g:message code="activo.nuevopedido"/></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${activoInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${activoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form action="savePedido">
        <fieldset class="form">
            <g:render template="formPedido"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.guardar')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
