
<%@ page import="ii.Movimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="movimiento.movimientos.label" /></title>
	</head>
	<body>
		<a href="#list-movimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="movimiento.nuevo.label" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimiento" class="content scaffold-list" role="main">
			<h1><g:message code="movimiento.movimientos.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="movimiento.item.label" default="Item" /></th>
					
						<th><g:message code="movimiento.origen.label" default="Origen" /></th>
					
						<th><g:message code="movimiento.destino.label" default="Destino" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'movimiento.descripcion.label')}" />
					
						<th><g:message code="movimiento.responsable.label" default="Responsable" /></th>
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'movimiento.fechaRegistro.label', default: 'Fecha Registro')}" />
					
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
					
						<td>${fieldValue(bean: movimientoInstance, field: "fechaRegistro")}</td>
					
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
