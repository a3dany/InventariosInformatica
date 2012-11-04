<%@ page import="ii.Activo" %>



<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'serie', 'error')} required">
	<label for="serie">
		<g:message code="activo.serie.label" default="Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="serie" required="" value="${activoInstance?.serie}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="activo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${activoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="activo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${activoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="activo.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${ii.TipoActivo.list()}" optionKey="id" required="" value="${activoInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="activo.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" value="${activoInstance?.modelo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="activo.marca.label" default="Marca" />
		
	</label>
	<g:select name="marca" from="${activoInstance.constraints.marca.inList}" value="${activoInstance?.marca}" valueMessagePrefix="activo.marca" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'estadoActual', 'error')} required">
	<label for="estadoActual">
		<g:message code="activo.estadoActual.label" default="Estado Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estadoActual" name="estadoActual.id" from="${ii.EstadoActivo.list()}" optionKey="id" required="" value="${activoInstance?.estadoActual?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'asignado', 'error')} ">
	<label for="asignado">
		<g:message code="activo.asignado.label" default="Asignado" />
		
	</label>
	<g:checkBox name="asignado" value="${activoInstance?.asignado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'ambienteActual', 'error')} required">
	<label for="ambienteActual">
		<g:message code="activo.ambienteActual.label" default="Ambiente Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ambienteActual" name="ambienteActual.id" from="${ii.Ambiente.list()}" optionKey="id" required="" value="${activoInstance?.ambienteActual?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'fechaAlta', 'error')} required">
	<label for="fechaAlta">
		<g:message code="activo.fechaAlta.label" default="Fecha Alta" />
		<span class="required-indicator">*</span>
	</label>
	<joda:dateTimePicker name="fechaAlta" value="${activoInstance?.fechaAlta}" ></joda:dateTimePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="activo.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" required="" value="${activoInstance?.responsable?.id}" class="many-to-one"/>
</div>

