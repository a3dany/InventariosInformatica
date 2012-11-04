
<%@ page import="ii.Movimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="movimiento.item.label" default="Item" /></th>
					
						<th><g:message code="movimiento.origen.label" default="Origen" /></th>
					
						<th><g:message code="movimiento.destino.label" default="Destino" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'movimiento.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="movimiento.responsable.label" default="Responsable" /></th>
					
						<g:sortableColumn property="fechaHora" title="${message(code: 'movimiento.fechaHora.label', default: 'Fecha Hora')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoInstanceList}" status="i" var="movimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movimientoInstance.id}">${fieldValue(bean: movimientoInstance, field: "item")}</g:link></td>
					
						<td>${fieldValue(bean: movimientoInstance, field: "origen")}</td>
					
						<td>${fieldValue(bean: movimientoInstance, field: "destino")}</td>
					
						<td>${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: movimientoInstance, field: "responsable")}</td>
					
						<td>${fieldValue(bean: movimientoInstance, field: "fechaHora")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
