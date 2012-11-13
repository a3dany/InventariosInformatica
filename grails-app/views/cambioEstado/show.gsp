
<%@ page import="ii.CambioEstado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioEstado.label', default: 'CambioEstado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cambioEstado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cambioEstado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cambioEstado">
			
				<g:if test="${cambioEstadoInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="cambioEstado.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="activo" action="show" id="${cambioEstadoInstance?.item?.id}">${cambioEstadoInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cambioEstadoInstance?.anterior}">
				<li class="fieldcontain">
					<span id="anterior-label" class="property-label"><g:message code="cambioEstado.anterior.label" default="Anterior" /></span>
					
						<span class="property-value" aria-labelledby="anterior-label"><g:link controller="estadoActivo" action="show" id="${cambioEstadoInstance?.anterior?.id}">${cambioEstadoInstance?.anterior?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cambioEstadoInstance?.actual}">
				<li class="fieldcontain">
					<span id="actual-label" class="property-label"><g:message code="cambioEstado.actual.label" default="Actual" /></span>
					
						<span class="property-value" aria-labelledby="actual-label"><g:link controller="estadoActivo" action="show" id="${cambioEstadoInstance?.actual?.id}">${cambioEstadoInstance?.actual?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cambioEstadoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="cambioEstado.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${cambioEstadoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cambioEstadoInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="cambioEstado.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario" action="show" id="${cambioEstadoInstance?.responsable?.id}">${cambioEstadoInstance?.responsable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cambioEstadoInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="cambioEstado.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:fieldValue bean="${cambioEstadoInstance}" field="fechaRegistro"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cambioEstadoInstance?.id}" />
					<g:link class="edit" action="edit" id="${cambioEstadoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
