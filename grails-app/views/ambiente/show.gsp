<%@ page import="ii.Ambiente" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="ambiente.label"/></title>
</head>

<body>
<a href="#show-ambiente" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAnyGranted roles="ADMINISTRADOR,TECNICO">
            <li><g:link class="list" action="list"><g:message code="ambiente.ambientes.label"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="ambiente.nuevo.label"/></g:link></li>
        </sec:ifAnyGranted>
    </ul>
</div>

<div id="show-ambiente" class="content scaffold-show" role="main">
    <h1><g:message code="ambiente.label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list ambiente">

        <g:if test="${ambienteInstance?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="ambiente.nombre.label"
                                                                          default="Nombre"/></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${ambienteInstance}"
                                                                                          field="nombre"/></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.tipo}">
            <li class="fieldcontain">
                <span id="tipo-label" class="property-label"><g:message code="ambiente.tipo.label"
                                                                        default="Tipo"/></span>

                <span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoAmbiente"
                                                                                  action="show"
                                                                                  id="${ambienteInstance?.tipo?.id}">${ambienteInstance?.tipo?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.capacidad}">
            <li class="fieldcontain">
                <span id="capacidad-label" class="property-label"><g:message code="ambiente.capacidad.label"
                                                                             default="Capacidad"/></span>

                <span class="property-value" aria-labelledby="capacidad-label"><g:fieldValue bean="${ambienteInstance}"
                                                                                             field="capacidad"/></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.descripcion}">
            <li class="fieldcontain">
                <span id="descripcion-label" class="property-label"><g:message code="ambiente.descripcion.label"
                                                                               default="Descripcion"/></span>

                <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
                        bean="${ambienteInstance}" field="descripcion"/></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.edificio}">
            <li class="fieldcontain">
                <span id="edificio-label" class="property-label"><g:message code="ambiente.edificio.label"
                                                                            default="Edificio"/></span>

                <span class="property-value" aria-labelledby="edificio-label"><g:fieldValue bean="${ambienteInstance}"
                                                                                            field="edificio"/></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.nivel}">
            <li class="fieldcontain">
                <span id="nivel-label" class="property-label"><g:message code="ambiente.nivel.label"
                                                                         default="Nivel"/></span>

                <span class="property-value" aria-labelledby="nivel-label"><g:link controller="nivel" action="show"
                                                                                   id="${ambienteInstance?.nivel?.id}">${ambienteInstance?.nivel?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${ambienteInstance?.responsable}">
            <li class="fieldcontain">
                <span id="responsable-label" class="property-label"><g:message code="ambiente.responsable.label"
                                                                               default="Responsable"/></span>

                <span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario"
                                                                                         action="show"
                                                                                         id="${ambienteInstance?.responsable?.id}">${ambienteInstance?.responsable?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>


    <sec:ifAnyGranted roles="PORTERO,TECNICO,AUTORIDAD">

        <div id="list-activo" class="content scaffold-list" role="main">
            <h1><g:message code="activo.activos"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="serie" title="${message(code: 'activo.serie.label')}"/>

                    <th><g:message code="activo.tipo.label"/></th>

                    <g:sortableColumn property="nombre" title="${message(code: 'activo.nombre.label')}"/>

                    <th><g:message code="activo.marca.label"/></th>

                    <g:sortableColumn property="modelo" title="${message(code: 'activo.modelo.label')}"/>

                    <th><g:message code="activo.responsable.label"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${activoInstanceList}" status="i" var="activoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" controller="activo"
                                    id="${activoInstance.id}">${fieldValue(bean: activoInstance, field: "serie")}</g:link></td>

                        <td>${fieldValue(bean: activoInstance, field: "tipo")}</td>

                        <td>${fieldValue(bean: activoInstance, field: "nombre")}</td>

                        <td>${fieldValue(bean: activoInstance, field: "marca")}</td>

                        <td>${fieldValue(bean: activoInstance, field: "modelo")}</td>

                        <td><g:link action="show" controller="usuario"
                                    id="${activoInstance.responsable.id}">${activoInstance.responsable}</g:link></td>

                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${activoInstanceTotal}"/>
            </div>
        </div>

    </sec:ifAnyGranted>










    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${ambienteInstance?.id}"/>
            <g:link class="edit" action="edit" id="${ambienteInstance?.id}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>

</body>
</html>
