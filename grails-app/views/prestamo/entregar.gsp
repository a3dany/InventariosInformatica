<%@ page import="ii.Prestamo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}"/>
<title><g:message code="prestamo.entregar.label"/></title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="prestamo.prestamos"/></g:link></li>
    </ul>
</div>

<div id="create-prestamo" class="content scaffold-create" role="main">
    <h1><g:message code="prestamo.entregar.label"/></h1>
    <g:form action="saveEntrega">
        <fieldset class="form">

            <g:hiddenField name="id" value="${prestamoInstance?.id}"/>

            <div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'observacionDevolucion', 'error')} ">

                <label for="observacionDevolucion">
                    <g:message code="prestamo.observacionDevolucion.label"/>

                </label>
                <g:textArea name="observacionDevolucion" cols="40" rows="5" maxlength="999999"
                            value="${prestamoInstance?.observacionDevolucion}">Sin novedad.</g:textArea>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.guardar.label')}"/>
        </fieldset>
    </g:form>
</div>
</body>

</body>
</html>