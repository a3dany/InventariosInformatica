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

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'estadoActual', 'error')} required">
	<label for="estadoActual">
		<g:message code="activo.estadoActual.label" default="Estado Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estadoActual" name="estadoActual.id" from="${ii.EstadoActivo.list()}" optionKey="id" required="" value="${activoInstance?.estadoActual?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'responsable', 'error')} ">
	<label for="responsable">
		<g:message code="activo.responsable.label" default="Responsable" />
		
	</label>
	<g:select id="responsable" name="responsable.id" from="${ii.Usuario.list()}" optionKey="id" value="${activoInstance?.responsable?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div id="selector1" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'perteneceActivo', 'error')} ">
	<label for="perteneceActivo">
		<g:message code="activo.perteneceAUnActivo" />
		
	</label>
	<g:checkBox name="perteneceActivo" value="${activoInstance?.perteneceActivo}" />
</div>

<div id="control1" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'activoAlQuePertenece', 'error')} ">
	<label for="activoAlQuePertenece">
		<g:message code="activo.activoAlQuePerteneces" />
	</label>
	<g:select id="activoAlQuePertenece" name="activoAlQuePertenece.id" from="${ii.Activo.list()}" optionKey="id" value="${activoInstance?.activoAlQuePertenece?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div id="selector2" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'esAsignadoAmbiente', 'error')} ">
	<label for="esAsignadoAmbiente">
		<g:message code="activo.asignarAUnAmbiente" />
		
	</label>
	<g:checkBox name="esAsignadoAmbiente" value="${activoInstance?.esAsignadoAmbiente}" />
</div>

<div id="control2" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'ambienteActual', 'error')} ">
	<label for="ambienteActual">
		<g:message code="activo.ambienteActual" />
		
	</label>
	<g:select id="ambienteActual" name="ambienteActual.id" from="${ii.Ambiente.list()}" optionKey="id" value="${activoInstance?.ambienteActual?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>




<div id="controlEsComprado" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'esComprado', 'error')} ">
    <label for="esComprado">
        <g:message code="activo.seTieneDatosCompra" />

    </label>
    <g:checkBox name="esComprado" value="${activoInstance?.esComprado}" />
</div>


<div id="controlCompra1" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'costo', 'error')} required">
	<label for="costo">
		<g:message code="activo.costo.label" default="Costo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="costo" required="" value="${fieldValue(bean: activoInstance, field: 'costo')}"/>
</div>

<div id="controlCompra2" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'diasGarantia', 'error')} required">
	<label for="diasGarantia">
		<g:message code="activo.diasGarantia.label" default="Dias Garantia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="diasGarantia" required="" value="${fieldValue(bean: activoInstance, field: 'diasGarantia')}"/>
</div>

<div id="controlCompra3" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'factura', 'error')} ">
	<label for="factura">
		<g:message code="activo.factura.label" default="Factura" />
		
	</label>
	<g:textField name="factura" maxlength="50" value="${activoInstance?.factura}"/>
</div>

<div id="controlCompra4" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'proveedor', 'error')} ">
	<label for="proveedor">
		<g:message code="activo.proveedor.label" default="Proveedor" />
		
	</label>
	<g:textField name="proveedor" maxlength="50" value="${activoInstance?.proveedor}"/>
</div>


<div id="controlCompra5" class="fieldcontain ${hasErrors(bean: activoInstance, field: 'fechaCompra', 'error')} ">
    <label for="fechaCompra">
        <g:message code="activo.fechaCompra.label" default="Fecha Compra" />

    </label>
    <joda:dateTimePicker name="fechaCompra" value="${activoInstance?.fechaCompra}" default="${LocalDateTime.now()}" noSelection="['': '']"></joda:dateTimePicker>
</div>



<div class="fieldcontain ${hasErrors(bean: activoInstance, field: 'fechaActivo', 'error')} ">
	<label for="fechaActivo">
		<g:message code="activo.fechaActivo.label" default="Fecha Activo" />
		
	</label>
	<joda:dateTimePicker name="fechaActivo" value="${activoInstance?.fechaActivo}" default="${LocalDateTime.now()}" noSelection="['': '']"></joda:dateTimePicker>
</div>

