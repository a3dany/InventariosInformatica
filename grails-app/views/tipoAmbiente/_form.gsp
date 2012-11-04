<%@ page import="ii.TipoAmbiente" %>



<div class="fieldcontain ${hasErrors(bean: tipoAmbienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipoAmbiente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipoAmbienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoAmbienteInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoAmbiente.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoAmbienteInstance?.descripcion}"/>
</div>

