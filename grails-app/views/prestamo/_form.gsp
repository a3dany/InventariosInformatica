<%@ page import="ii.Prestamo" %>



<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="prestamo.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${ii.Activo.list()}" optionKey="id" required="" value="${prestamoInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="prestamo.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="solicitante" required="" value="${prestamoInstance?.solicitante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'ciSolicitante', 'error')} required">
	<label for="ciSolicitante">
		<g:message code="prestamo.ciSolicitante.label" default="Ci Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ciSolicitante" required="" value="${prestamoInstance?.ciSolicitante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'razon', 'error')} required">
	<label for="razon">
		<g:message code="prestamo.razon.label" default="Razon" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razon" required="" value="${prestamoInstance?.razon}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'inicioPrestamo', 'error')} required">
	<label for="inicioPrestamo">
		<g:message code="prestamo.inicioPrestamo.label" default="Inicio Prestamo" />
		<span class="required-indicator">*</span>
	</label>
	<joda:dateTimePicker name="inicioPrestamo" value="${prestamoInstance?.inicioPrestamo}" ></joda:dateTimePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'finPrestamo', 'error')} required">
	<label for="finPrestamo">
		<g:message code="prestamo.finPrestamo.label" default="Fin Prestamo" />
		<span class="required-indicator">*</span>
	</label>
	<joda:dateTimePicker name="finPrestamo" value="${prestamoInstance?.finPrestamo}" ></joda:dateTimePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'ambienteDondeEstara', 'error')} ">
	<label for="ambienteDondeEstara">
		<g:message code="prestamo.ambienteDondeEstara.label" default="Ambiente Donde Estara" />
		
	</label>
	<g:select id="ambienteDondeEstara" name="ambienteDondeEstara.id" from="${ii.Ambiente.list()}" optionKey="id" value="${prestamoInstance?.ambienteDondeEstara?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="prestamo.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" required="" value="${prestamoInstance?.responsable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="prestamo.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<joda:dateTimePicker name="fecha" value="${prestamoInstance?.fecha}" ></joda:dateTimePicker>
</div>

