
<%@ page import="ii.TipoAmbiente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoambiente.label" /></title>
	</head>
	<body>
		<a href="#show-tipoAmbiente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="tipoambiente.tiposambiente.label" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="tipoambiente.nuevo.label" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoAmbiente" class="content scaffold-show" role="main">
			<h1><g:message code="tipoambiente.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoAmbiente">
			
				<g:if test="${tipoAmbienteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tipoAmbiente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipoAmbienteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoAmbienteInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipoAmbiente.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoAmbienteInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoAmbienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoAmbienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
