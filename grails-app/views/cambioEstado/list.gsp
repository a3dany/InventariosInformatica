
<%@ page import="ii.CambioEstado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cambioEstado.label', default: 'CambioEstado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cambioEstado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="cambioEstado.nuevoCambioEstado.label" /></g:link></li>
                <li><g:link class="create" action="listPdf" >Generar PDF</g:link></li>
			</ul>
		</div>
		<div id="list-cambioEstado" class="content scaffold-list" role="main">
			<h1><g:message code="cambioEstado.cambiosEstado.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="cambioEstado.item.label" default="Item" /></th>
					
						<th><g:message code="cambioEstado.anterior.label" default="Anterior" /></th>
					
						<th><g:message code="cambioEstado.actual.label" default="Actual" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'cambioEstado.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="cambioEstado.responsable.label" default="Responsable" /></th>
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'cambioEstado.fechaRegistro.label', default: 'Fecha Registro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cambioEstadoInstanceList}" status="i" var="cambioEstadoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cambioEstadoInstance.id}">${fieldValue(bean: cambioEstadoInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: cambioEstadoInstance, field: "anterior")}</td>
					
						<td>${fieldValue(bean: cambioEstadoInstance, field: "actual")}</td>
					
						<td>${fieldValue(bean: cambioEstadoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: cambioEstadoInstance, field: "responsable")}</td>
					
						<td>${fieldValue(bean: cambioEstadoInstance, field: "fechaRegistro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cambioEstadoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
