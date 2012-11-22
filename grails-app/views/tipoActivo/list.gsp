
<%@ page import="ii.TipoActivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoactivo.tiposactivo.label" /></title>
	</head>
	<body>
		<a href="#list-tipoActivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="tipoactivo.nuevo.label" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoActivo" class="content scaffold-list" role="main">
			<h1><g:message code="tipoactivo.tiposactivo.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoActivo.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="categoria" title="${message(code: 'tipoActivo.categoria.label', default: 'Categoria')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoactivo.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoActivoInstanceList}" status="i" var="tipoActivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoActivoInstance.id}">${fieldValue(bean: tipoActivoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: tipoActivoInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: tipoActivoInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoActivoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
