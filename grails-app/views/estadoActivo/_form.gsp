<%@ page import="ii.EstadoActivo" %>



<div class="fieldcontain ${hasErrors(bean: estadoActivoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estadoActivo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${estadoActivoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoActivoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="estadoActivo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${estadoActivoInstance?.descripcion}"/>
</div>

