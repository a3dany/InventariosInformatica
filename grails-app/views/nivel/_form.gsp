<%@ page import="ii.Nivel" %>



<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="nivel.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${nivelInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="nivel.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${nivelInstance?.descripcion}"/>
</div>

