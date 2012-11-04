<%@ page import="ii.Ambiente" %>



<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="ambiente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${ambienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="ambiente.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${ii.TipoAmbiente.list()}" optionKey="id" required="" value="${ambienteInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="ambiente.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="capacidad" from="${ambienteInstance.constraints.capacidad.inList}" required="" value="${fieldValue(bean: ambienteInstance, field: 'capacidad')}" valueMessagePrefix="ambiente.capacidad"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="ambiente.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${ambienteInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'edificio', 'error')} required">
	<label for="edificio">
		<g:message code="ambiente.edificio.label" default="Edificio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="edificio" from="${ambienteInstance.constraints.edificio.inList}" required="" value="${ambienteInstance?.edificio}" valueMessagePrefix="ambiente.edificio"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="ambiente.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivel" name="nivel.id" from="${ii.Nivel.list()}" optionKey="id" required="" value="${ambienteInstance?.nivel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ambienteInstance, field: 'responsable', 'error')} ">
	<label for="responsable">
		<g:message code="ambiente.responsable.label" default="Responsable" />
		
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" value="${ambienteInstance?.responsable?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

