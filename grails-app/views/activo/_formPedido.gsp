<%@ page import="org.joda.time.LocalDateTime; ii.Activo" %>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'serie', 'error')} required">
	<label for="serie">
		<g:message code="activo.serie.label" default="Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="serie" required="" value="${activoInstance?.serie}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="activo.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${ii.TipoActivo.list()}" optionKey="id" required="" value="${activoInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="activo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="100" value="${activoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="activo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="999999" value="${activoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="activo.marca.label" default="Marca" />
		
	</label>
	<g:select id="marca" name="marca.id" from="${ii.Marca.list()}" optionKey="id" value="${activoInstance?.marca?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="activo.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" maxlength="50" value="${activoInstance?.modelo}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'responsable', 'error')} ">
	<label for="responsable">
		<g:message code="activo.responsable.label" default="Responsable" />
		
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" value="${activoInstance?.responsable?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'costo', 'error')} required">
	<label for="costo">
		<g:message code="activo.costo.label" default="Costo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="costo" required="" value="${fieldValue(bean: activoInstance, field: 'costo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'diasGarantia', 'error')} required">
	<label for="diasGarantia">
		<g:message code="activo.diasGarantia.label" default="Dias Garantia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="diasGarantia" required="" value="${fieldValue(bean: activoInstance, field: 'diasGarantia')}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'proveedor', 'error')} ">
	<label for="proveedor">
		<g:message code="activo.proveedor.label" default="Proveedor" />
		
	</label>
	<g:textField name="proveedor" maxlength="50" value="${activoInstance?.proveedor}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'fechaPedido', 'error')} ">
    <label for="fechaPedido">
        <g:message code="activo.fechaDelPedido" />

    </label>
    <joda:dateTimePicker name="fechaPedido" value="${activoInstance?.fechaPedido}" default="${LocalDateTime.now()}" noSelection="['': '']"></joda:dateTimePicker>
</div>


