
<%@ page import="ii.Ambiente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ambiente.label', default: 'Ambiente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ambiente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ambiente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'ambiente.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="ambiente.tipo.label" default="Tipo" /></th>
					
						<g:sortableColumn property="capacidad" title="${message(code: 'ambiente.capacidad.label', default: 'Capacidad')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'ambiente.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="edificio" title="${message(code: 'ambiente.edificio.label', default: 'Edificio')}" />
					
						<th><g:message code="ambiente.nivel.label" default="Nivel" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ambienteInstanceList}" status="i" var="ambienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ambienteInstance.id}">${fieldValue(bean: ambienteInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: ambienteInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: ambienteInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: ambienteInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: ambienteInstance, field: "edificio")}</td>
					
						<td>${fieldValue(bean: ambienteInstance, field: "nivel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ambienteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
