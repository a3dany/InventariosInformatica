
<%@ page import="ii.Prestamo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prestamo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prestamo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="prestamo.item.label" default="Item" /></th>
					
						<g:sortableColumn property="detalleItem" title="${message(code: 'prestamo.detalleItem.label', default: 'Detalle Item')}" />
					
						<th><g:message code="prestamo.solicitante.label" default="Solicitante" /></th>
					
						<g:sortableColumn property="motivo" title="${message(code: 'prestamo.motivo.label', default: 'Motivo')}" />
					
						<th><g:message code="prestamo.ambienteDondeEstara.label" default="Ambiente Donde Estara" /></th>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'prestamo.fechaInicio.label', default: 'Fecha Inicio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "detalleItem")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "solicitante")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "motivo")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "ambienteDondeEstara")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "fechaInicio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prestamoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
