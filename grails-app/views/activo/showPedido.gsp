<%@ page import="ii.Activo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activo.label', default: 'Activo')}"/>
    <title><g:message code="activo.pedido"/></title>
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
<h1><g:message code="activo.pedido"/></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<ol class="property-list activo">

<g:if test="${activoInstance?.serie}">
    <li class="fieldcontain">
        <span id="serie-label" class="property-label"><g:message code="activo.serie.label" default="Serie"/></span>

        <span class="property-value" aria-labelledby="serie-label"><g:fieldValue bean="${activoInstance}"
                                                                                 field="serie"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.tipo}">
    <li class="fieldcontain">
        <span id="tipo-label" class="property-label"><g:message code="activo.tipo.label" default="Tipo"/></span>

        <span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoActivo" action="show"
                                                                          id="${activoInstance?.tipo?.id}">${activoInstance?.tipo?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.nombre}">
    <li class="fieldcontain">
        <span id="nombre-label" class="property-label"><g:message code="activo.nombre.label" default="Nombre"/></span>

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

<g:if test="${activoInstance?.marca}">
    <li class="fieldcontain">
        <span id="marca-label" class="property-label"><g:message code="activo.marca.label" default="Marca"/></span>

        <span class="property-value" aria-labelledby="marca-label"><g:link controller="marca" action="show"
                                                                           id="${activoInstance?.marca?.id}">${activoInstance?.marca?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.modelo}">
    <li class="fieldcontain">
        <span id="modelo-label" class="property-label"><g:message code="activo.modelo.label" default="Modelo"/></span>

        <span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${activoInstance}"
                                                                                  field="modelo"/></span>

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

<g:if test="${activoInstance?.responsable}">
    <li class="fieldcontain">
        <span id="responsable-label" class="property-label"><g:message code="activo.responsable.label"
                                                                       default="Responsable"/></span>

        <span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario" action="show"
                                                                                 id="${activoInstance?.responsable?.id}">${activoInstance?.responsable?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.perteneceActivo}">
    <li class="fieldcontain">
        <span id="perteneceActivo-label" class="property-label"><g:message code="activo.perteneceActivo.label"
                                                                           default="Pertenece Activo"/></span>

        <span class="property-value" aria-labelledby="perteneceActivo-label"><g:formatBoolean
                boolean="${activoInstance?.perteneceActivo}"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.activoAlQuePertenece}">
    <li class="fieldcontain">
        <span id="activoAlQuePertenece-label" class="property-label"><g:message code="activo.activoAlQuePertenece.label"
                                                                                default="Activo Al Que Pertenece"/></span>

        <span class="property-value" aria-labelledby="activoAlQuePertenece-label"><g:link controller="activo"
                                                                                          action="show"
                                                                                          id="${activoInstance?.activoAlQuePertenece?.id}">${activoInstance?.activoAlQuePertenece?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.esAsignadoAmbiente}">
    <li class="fieldcontain">
        <span id="esAsignadoAmbiente-label" class="property-label"><g:message code="activo.esAsignadoAmbiente.label"
                                                                              default="Es Asignado Ambiente"/></span>

        <span class="property-value" aria-labelledby="esAsignadoAmbiente-label"><g:formatBoolean
                boolean="${activoInstance?.esAsignadoAmbiente}"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.ambienteActual}">
    <li class="fieldcontain">
        <span id="ambienteActual-label" class="property-label"><g:message code="activo.ambienteActual.label"
                                                                          default="Ambiente Actual"/></span>

        <span class="property-value" aria-labelledby="ambienteActual-label"><g:link controller="ambiente" action="show"
                                                                                    id="${activoInstance?.ambienteActual?.id}">${activoInstance?.ambienteActual?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.costo}">
    <li class="fieldcontain">
        <span id="costo-label" class="property-label"><g:message code="activo.costo.label" default="Costo"/></span>

        <span class="property-value" aria-labelledby="costo-label"><g:fieldValue bean="${activoInstance}"
                                                                                 field="costo"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.diasGarantia}">
    <li class="fieldcontain">
        <span id="diasGarantia-label" class="property-label"><g:message code="activo.diasGarantia.label"
                                                                        default="Dias Garantia"/></span>

        <span class="property-value" aria-labelledby="diasGarantia-label"><g:fieldValue bean="${activoInstance}"
                                                                                        field="diasGarantia"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.factura}">
    <li class="fieldcontain">
        <span id="factura-label" class="property-label"><g:message code="activo.factura.label"
                                                                   default="Factura"/></span>

        <span class="property-value" aria-labelledby="factura-label"><g:fieldValue bean="${activoInstance}"
                                                                                   field="factura"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.proveedor}">
    <li class="fieldcontain">
        <span id="proveedor-label" class="property-label"><g:message code="activo.proveedor.label"
                                                                     default="Proveedor"/></span>

        <span class="property-value" aria-labelledby="proveedor-label"><g:fieldValue bean="${activoInstance}"
                                                                                     field="proveedor"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.esPedido}">
    <li class="fieldcontain">
        <span id="esPedido-label" class="property-label"><g:message code="activo.esPedido.label"
                                                                    default="Es Pedido"/></span>

        <span class="property-value" aria-labelledby="esPedido-label"><g:formatBoolean
                boolean="${activoInstance?.esPedido}"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.esComprado}">
    <li class="fieldcontain">
        <span id="esComprado-label" class="property-label"><g:message code="activo.esComprado.label"
                                                                      default="Es Comprado"/></span>

        <span class="property-value" aria-labelledby="esComprado-label"><g:formatBoolean
                boolean="${activoInstance?.esComprado}"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.esActivo}">
    <li class="fieldcontain">
        <span id="esActivo-label" class="property-label"><g:message code="activo.esActivo.label"
                                                                    default="Es Activo"/></span>

        <span class="property-value" aria-labelledby="esActivo-label"><g:formatBoolean
                boolean="${activoInstance?.esActivo}"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.fechaPedido}">
    <li class="fieldcontain">
        <span id="fechaPedido-label" class="property-label"><g:message code="activo.fechaPedido.label"
                                                                       default="Fecha Pedido"/></span>

        <span class="property-value" aria-labelledby="fechaPedido-label"><g:fieldValue bean="${activoInstance}"
                                                                                       field="fechaPedido"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.fechaCompra}">
    <li class="fieldcontain">
        <span id="fechaCompra-label" class="property-label"><g:message code="activo.fechaCompra.label"
                                                                       default="Fecha Compra"/></span>

        <span class="property-value" aria-labelledby="fechaCompra-label"><g:fieldValue bean="${activoInstance}"
                                                                                       field="fechaCompra"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.fechaActivo}">
    <li class="fieldcontain">
        <span id="fechaActivo-label" class="property-label"><g:message code="activo.fechaActivo.label"
                                                                       default="Fecha Activo"/></span>

        <span class="property-value" aria-labelledby="fechaActivo-label"><g:fieldValue bean="${activoInstance}"
                                                                                       field="fechaActivo"/></span>

    </li>
</g:if>

<g:if test="${activoInstance?.usuarioAltaSistema}">
    <li class="fieldcontain">
        <span id="usuarioAltaSistema-label" class="property-label"><g:message code="activo.usuarioAltaSistema.label"
                                                                              default="Usuario Alta Sistema"/></span>

        <span class="property-value" aria-labelledby="usuarioAltaSistema-label"><g:link controller="usuario"
                                                                                        action="show"
                                                                                        id="${activoInstance?.usuarioAltaSistema?.id}">${activoInstance?.usuarioAltaSistema?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${activoInstance?.fechaAltaSistema}">
    <li class="fieldcontain">
        <span id="fechaAltaSistema-label" class="property-label"><g:message code="activo.fechaAltaSistema.label"
                                                                            default="Fecha Alta Sistema"/></span>

        <span class="property-value" aria-labelledby="fechaAltaSistema-label"><g:fieldValue bean="${activoInstance}"
                                                                                            field="fechaAltaSistema"/></span>

    </li>
</g:if>

</ol>
<g:form>
    <fieldset class="buttons">
        <g:hiddenField name="id" value="${activoInstance?.id}"/>
        <g:link class="edit" action="editPedido" id="${activoInstance?.id}"><g:message code="default.button.edit.label"
                                                                                 default="Edit"/></g:link>
        <g:link class="esactivo" action="edit" id="${activoInstance?.id}"><g:message code="activo.convertirActivo"/></g:link>
        <g:actionSubmit class="delete" action="deletePedido"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
</g:form>
</div>
</body>
</html>
