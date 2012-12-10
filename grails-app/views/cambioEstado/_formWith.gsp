<%@ page import="ii.CambioEstado" %>



<div class="fieldcontain ${hasErrors(bean: cambioEstadoInstance, field: 'item', 'error')} required">
    <label for="item">
        <g:message code="cambioEstado.item.label" default="Item"/>
    </label>

    <g:hiddenField name="item.id" value="${activoInstance.id}"></g:hiddenField>
    <g:textField name="activo" disabled="" value="${activoInstance}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: cambioEstadoInstance, field: 'anterior', 'error')} required">
    <label for="anterior">
        <g:message code="cambioEstado.anterior.label" default="Anterior"/>
    </label>

    <g:hiddenField name="anterior.id" value="${activoInstance.estadoActual.id}"></g:hiddenField>
    <g:textField name="estado" disabled="" value="${activoInstance.estadoActual}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: cambioEstadoInstance, field: 'actual', 'error')} required">
    <label for="actual">
        <g:message code="cambioEstado.actual.label" default="Actual"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="actual" name="actual.id" from="${ii.EstadoActivo.list()}" optionKey="id" required=""
              value="${cambioEstadoInstance?.actual?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cambioEstadoInstance, field: 'descripcion', 'error')} ">
    <label for="descripcion">
        <g:message code="cambioEstado.descripcion.label"/>

    </label>
    <g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${cambioEstadoInstance?.descripcion}"/>
</div>

