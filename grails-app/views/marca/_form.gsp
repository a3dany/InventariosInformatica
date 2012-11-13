<%@ page import="ii.Marca" %>



<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="marca.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${marcaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="marca.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${marcaInstance?.descripcion}"/>
</div>

