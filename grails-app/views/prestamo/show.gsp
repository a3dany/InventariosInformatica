
<%@ page import="ii.Prestamo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prestamo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prestamo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prestamo">
			
				<g:if test="${prestamoInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="prestamo.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="activo" action="show" id="${prestamoInstance?.item?.id}">${prestamoInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.detalleItem}">
				<li class="fieldcontain">
					<span id="detalleItem-label" class="property-label"><g:message code="prestamo.detalleItem.label" default="Detalle Item" /></span>
					
						<span class="property-value" aria-labelledby="detalleItem-label"><g:fieldValue bean="${prestamoInstance}" field="detalleItem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.solicitante}">
				<li class="fieldcontain">
					<span id="solicitante-label" class="property-label"><g:message code="prestamo.solicitante.label" default="Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="solicitante-label"><g:link controller="usuario" action="show" id="${prestamoInstance?.solicitante?.id}">${prestamoInstance?.solicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.motivo}">
				<li class="fieldcontain">
					<span id="motivo-label" class="property-label"><g:message code="prestamo.motivo.label" default="Motivo" /></span>
					
						<span class="property-value" aria-labelledby="motivo-label"><g:fieldValue bean="${prestamoInstance}" field="motivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.ambienteDondeEstara}">
				<li class="fieldcontain">
					<span id="ambienteDondeEstara-label" class="property-label"><g:message code="prestamo.ambienteDondeEstara.label" default="Ambiente Donde Estara" /></span>
					
						<span class="property-value" aria-labelledby="ambienteDondeEstara-label"><g:link controller="ambiente" action="show" id="${prestamoInstance?.ambienteDondeEstara?.id}">${prestamoInstance?.ambienteDondeEstara?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="prestamo.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:fieldValue bean="${prestamoInstance}" field="fechaInicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="prestamo.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:fieldValue bean="${prestamoInstance}" field="fechaFin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaEntrega}">
				<li class="fieldcontain">
					<span id="fechaEntrega-label" class="property-label"><g:message code="prestamo.fechaEntrega.label" default="Fecha Entrega" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:fieldValue bean="${prestamoInstance}" field="fechaEntrega"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaDevolucion}">
				<li class="fieldcontain">
					<span id="fechaDevolucion-label" class="property-label"><g:message code="prestamo.fechaDevolucion.label" default="Fecha Devolucion" /></span>
					
						<span class="property-value" aria-labelledby="fechaDevolucion-label"><g:fieldValue bean="${prestamoInstance}" field="fechaDevolucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.observacionDevolucion}">
				<li class="fieldcontain">
					<span id="observacionDevolucion-label" class="property-label"><g:message code="prestamo.observacionDevolucion.label" default="Observacion Devolucion" /></span>
					
						<span class="property-value" aria-labelledby="observacionDevolucion-label"><g:fieldValue bean="${prestamoInstance}" field="observacionDevolucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="prestamo.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario" action="show" id="${prestamoInstance?.responsable?.id}">${prestamoInstance?.responsable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="prestamo.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:fieldValue bean="${prestamoInstance}" field="fechaRegistro"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prestamoInstance?.id}" />
					<g:link class="edit" action="edit" id="${prestamoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
