<%@ page import="org.joda.time.LocalDateTime; ii.Prestamo" %>



<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="prestamo.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${ii.Activo.list()}" optionKey="id" required="" value="${prestamoInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'detalleItem', 'error')} ">
	<label for="detalleItem">
		<g:message code="prestamo.detallePrestamo" />
		
	</label>
	<g:textArea name="detalleItem" cols="40" rows="5" maxlength="999999" value="${prestamoInstance?.detalleItem}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="prestamo.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitante" name="solicitante.id" from="${ii.Usuario.list()}" optionKey="id" required="" value="${prestamoInstance?.solicitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'motivo', 'error')} ">
	<label for="motivo">
		<g:message code="prestamo.motivo.label" default="Motivo" />
		
	</label>
	<g:textArea name="motivo" cols="40" rows="5" maxlength="999999" value="${prestamoInstance?.motivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'ambienteDondeEstara', 'error')} ">
	<label for="ambienteDondeEstara">
		<g:message code="prestamo.ambienteDondeEstara.label" default="Ambiente Donde Estara" />
		
	</label>
	<g:select id="ambienteDondeEstara" name="ambienteDondeEstara.id" from="${ii.Ambiente.list()}" optionKey="id" value="${prestamoInstance?.ambienteDondeEstara?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fechaInicio', 'error')} ">
	<label for="fechaInicio">
		<g:message code="prestamo.fechaInicio.label" default="Fecha Inicio" />
		
	</label>
	<joda:dateTimePicker name="fechaInicio" value="${prestamoInstance?.fechaInicio}" default="${LocalDateTime.now()}" noSelection="['': '']"></joda:dateTimePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fechaFin', 'error')} ">
	<label for="fechaFin">
		<g:message code="prestamo.fechaFin.label" default="Fecha Fin" />
		
	</label>
	<joda:dateTimePicker name="fechaFin" value="${prestamoInstance?.fechaFin}" default="${LocalDateTime.now()}" noSelection="['': '']"></joda:dateTimePicker>
</div>

