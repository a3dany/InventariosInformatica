<%@ page import="ii.TipoActivo" %>



<div class="fieldcontain ${hasErrors(bean: tipoActivoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipoActivo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipoActivoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoActivoInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="tipoActivo.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoria" required="" value="${tipoActivoInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoActivoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoActivo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoActivoInstance?.descripcion}"/>
</div>

