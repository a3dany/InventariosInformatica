<%@ page import="ii.Movimiento" %>



<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="movimiento.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${ii.Activo.list()}" optionKey="id" required="" value="${movimientoInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'origen', 'error')} required">
	<label for="origen">
		<g:message code="movimiento.origen.label" default="Origen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="origen" name="origen.id" from="${ii.Ambiente.list()}" optionKey="id" required="" value="${movimientoInstance?.origen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'destino', 'error')} required">
	<label for="destino">
		<g:message code="movimiento.destino.label" default="Destino" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="destino" name="destino.id" from="${ii.Ambiente.list()}" optionKey="id" required="" value="${movimientoInstance?.destino?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="movimiento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${movimientoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="movimiento.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" required="" value="${movimientoInstance?.responsable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'fechaHora', 'error')} required">
	<label for="fechaHora">
		<g:message code="movimiento.fechaHora.label" default="Fecha Hora" />
		<span class="required-indicator">*</span>
	</label>
	<joda:dateTimePicker name="fechaHora" value="${movimientoInstance?.fechaHora}" ></joda:dateTimePicker>
</div>

