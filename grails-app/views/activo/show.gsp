<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activo.label', default: 'Activo')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-activo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-activo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list activo">

        <g:if test="${activoInstance?.serie}">
            <li class="fieldcontain">
                <span id="serie-label" class="property-label"><g:message code="activo.serie.label"
                                                                         default="Serie"/></span>

                <span class="property-value" aria-labelledby="serie-label"><g:fieldValue bean="${activoInstance}"
                                                                                         field="serie"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="activo.nombre.label"
                                                                          default="Nombre"/></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${activoInstance}"
                                                                                          field="nombre"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.descripcion}">
            <li class="fieldcontain">
                <span id="descripcion-label" class="property-label"><g:message code="activo.descripcion.label"
                                                                               default="Descripcion"/></span>

                <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${activoInstance}"
                                                                                               field="descripcion"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.tipo}">
            <li class="fieldcontain">
                <span id="tipo-label" class="property-label"><g:message code="activo.tipo.label" default="Tipo"/></span>

                <span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoActivo" action="show"
                                                                                  id="${activoInstance?.tipo?.id}">${activoInstance?.tipo?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.modelo}">
            <li class="fieldcontain">
                <span id="modelo-label" class="property-label"><g:message code="activo.modelo.label"
                                                                          default="Modelo"/></span>

                <span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${activoInstance}"
                                                                                          field="modelo"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.marca}">
            <li class="fieldcontain">
                <span id="marca-label" class="property-label"><g:message code="activo.marca.label"
                                                                         default="Marca"/></span>

                <span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${activoInstance}"
                                                                                         field="marca"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.estadoActual}">
            <li class="fieldcontain">
                <span id="estadoActual-label" class="property-label"><g:message code="activo.estadoActual.label"
                                                                                default="Estado Actual"/></span>

                <span class="property-value" aria-labelledby="estadoActual-label"><g:link controller="estadoActivo"
                                                                                          action="show"
                                                                                          id="${activoInstance?.estadoActual?.id}">${activoInstance?.estadoActual?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.asignado}">
            <li class="fieldcontain">
                <span id="asignado-label" class="property-label"><g:message code="activo.asignado.label"
                                                                            default="Asignado"/></span>

                <span class="property-value" aria-labelledby="asignado-label"><g:formatBoolean
                        boolean="${activoInstance?.asignado}"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.ambienteActual}">
            <li class="fieldcontain">
                <span id="ambienteActual-label" class="property-label"><g:message code="activo.ambienteActual.label"
                                                                                  default="Ambiente Actual"/></span>

                <span class="property-value" aria-labelledby="ambienteActual-label"><g:link controller="ambiente"
                                                                                            action="show"
                                                                                            id="${activoInstance?.ambienteActual?.id}">${activoInstance?.ambienteActual?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.fechaAlta}">
            <li class="fieldcontain">
                <span id="fechaAlta-label" class="property-label"><g:message code="activo.fechaAlta.label"
                                                                             default="Fecha Alta"/></span>

                <span class="property-value" aria-labelledby="fechaAlta-label"><g:fieldValue bean="${activoInstance}"
                                                                                             field="fechaAlta"/></span>

            </li>
        </g:if>

        <g:if test="${activoInstance?.responsable}">
            <li class="fieldcontain">
                <span id="responsable-label" class="property-label"><g:message code="activo.responsable.label"
                                                                               default="Responsable"/></span>

                <span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario"
                                                                                         action="show"
                                                                                         id="${activoInstance?.responsable?.id}">${activoInstance?.responsable?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${activoInstance?.id}"/>
            <g:link class="edit" action="edit" id="${activoInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
