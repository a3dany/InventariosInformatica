<%@ page import="ii.Movimiento" %>



<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'item', 'error')} required">
    <label for="item">
        <g:message code="movimiento.item.label" default="Item"/>
    </label>
    <g:hiddenField name="item.id" value="${activoInstance.id}"></g:hiddenField>
    <g:textField name="activo" disabled="" value="${activoInstance}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'origen', 'error')} required">
    <label for="origen">
        <g:message code="movimiento.origen.label" default="Origen"/>
    </label>
    <g:hiddenField name="origen.id" value="${activoInstance.ambienteActual.id}"></g:hiddenField>
    <g:textField name="ambiente" disabled="" value="${activoInstance.ambienteActual}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'destino', 'error')} required">
    <label for="destino">
        <g:message code="movimiento.destino.label" default="Destino"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="destino" name="destino.id" from="${ii.Ambiente.list()}" optionKey="id" required=""
              value="${movimientoInstance?.destino?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'descripcion', 'error')} ">
    <label for="descripcion">
        <g:message code="movimiento.descripcion.label" default="Descripcion"/>

    </label>
    <g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${movimientoInstance?.descripcion}"/>
</div>

