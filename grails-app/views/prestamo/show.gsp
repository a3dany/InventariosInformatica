
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
			
				<g:if test="${prestamoInstance?.solicitante}">
				<li class="fieldcontain">
					<span id="solicitante-label" class="property-label"><g:message code="prestamo.solicitante.label" default="Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="solicitante-label"><g:fieldValue bean="${prestamoInstance}" field="solicitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.ciSolicitante}">
				<li class="fieldcontain">
					<span id="ciSolicitante-label" class="property-label"><g:message code="prestamo.ciSolicitante.label" default="Ci Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="ciSolicitante-label"><g:fieldValue bean="${prestamoInstance}" field="ciSolicitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.razon}">
				<li class="fieldcontain">
					<span id="razon-label" class="property-label"><g:message code="prestamo.razon.label" default="Razon" /></span>
					
						<span class="property-value" aria-labelledby="razon-label"><g:fieldValue bean="${prestamoInstance}" field="razon"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.inicioPrestamo}">
				<li class="fieldcontain">
					<span id="inicioPrestamo-label" class="property-label"><g:message code="prestamo.inicioPrestamo.label" default="Inicio Prestamo" /></span>
					
						<span class="property-value" aria-labelledby="inicioPrestamo-label"><g:fieldValue bean="${prestamoInstance}" field="inicioPrestamo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.finPrestamo}">
				<li class="fieldcontain">
					<span id="finPrestamo-label" class="property-label"><g:message code="prestamo.finPrestamo.label" default="Fin Prestamo" /></span>
					
						<span class="property-value" aria-labelledby="finPrestamo-label"><g:fieldValue bean="${prestamoInstance}" field="finPrestamo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.ambienteDondeEstara}">
				<li class="fieldcontain">
					<span id="ambienteDondeEstara-label" class="property-label"><g:message code="prestamo.ambienteDondeEstara.label" default="Ambiente Donde Estara" /></span>
					
						<span class="property-value" aria-labelledby="ambienteDondeEstara-label"><g:link controller="ambiente" action="show" id="${prestamoInstance?.ambienteDondeEstara?.id}">${prestamoInstance?.ambienteDondeEstara?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="prestamo.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario" action="show" id="${prestamoInstance?.responsable?.id}">${prestamoInstance?.responsable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="prestamo.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:fieldValue bean="${prestamoInstance}" field="fecha"/></span>
					
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
