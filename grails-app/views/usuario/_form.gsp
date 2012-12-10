<%@ page import="ii.UserRole; ii.Role; ii.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
    <label for="nombres">
        <g:message code="usuario.nombres.label"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombres" required="" value="${usuarioInstance?.nombres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
    <label for="apellidos">
        <g:message code="usuario.apellidos.label"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="apellidos" required="" value="${usuarioInstance?.apellidos}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="usuario.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${usuarioInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="usuario.password.label"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="password" required="" value="${usuarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'ci', 'error')} ">
    <label for="ci">
        <g:message code="usuario.ci.label"/>

    </label>
    <g:textField name="ci" value="${usuarioInstance?.ci}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cargo', 'error')} ">
    <label for="cargo">
        <g:message code="usuario.cargo.label"/>

    </label>
    <g:select name="cargo" from="${usuarioInstance.constraints.cargo.inList}" value="${usuarioInstance?.cargo}"
              valueMessagePrefix="usuario.cargo" noSelection="['': '']"/>
</div>



<sec:ifAllGranted roles="ADMINISTRADOR">

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
        <label for="accountExpired">
            <g:message code="usuario.accountExpired.label"/>

        </label>
        <g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
        <label for="accountLocked">
            <g:message code="usuario.accountLocked.label"/>

        </label>
        <g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
        <label for="enabled">
            <g:message code="usuario.enabled.label"/>
        </label>
        <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" checked="true"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
        <label for="passwordExpired">
            <g:message code="usuario.passwordExpired.label"/>

        </label>
        <g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}"/>
    </div>

    <!-- ROLES -->
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'item', 'error')} required">
        <label for="rol">
            <g:message code="usuario.rol.label"/>
            <span class="required-indicator">*</span>
        </label>
        <g:if test="${usuarioInstance.username && UserRole.countByUser(usuarioInstance) > 0}">
            <g:select id="rol" name="rolId" from="${ii.Role.list()}"
                      value="${UserRole.findByUser(usuarioInstance).role?.id}"
                      optionKey="id" required="required" class="many-to-one"/>
        </g:if>
        <g:else>
            <g:select id="rol" name="rolId" from="${ii.Role.list()}"
                      optionKey="id" required="required" class="many-to-one"/>
        </g:else>
    </div>

</sec:ifAllGranted>