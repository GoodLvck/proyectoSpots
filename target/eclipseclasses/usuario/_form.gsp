<%@ page import="com.proyectospots.Usuario" %>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="usuario" value="${usuarioInstance?.usuario}" name="usuario" placeholder="usuario" required/>
	<label for="usuario">Usuario<span class="required-indicator">*</span>
	</label>
</div>
<div class="form-floating mb-3">
	<input type="text" class="form-control" id="nombre" value="${usuarioInstance?.nombre}" name="nombre" placeholder="nombre" required>
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" /><span class="required-indicator">*</span>
	</label>
</div>
<div class="form-floating mb-3">
	<input type="text" class="form-control" id="apellido" value="${usuarioInstance?.apellido}" name="apellido" placeholder="apellido" required>
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" /><span class="required-indicator">*</span>
	</label>
</div>
<div class="form-floating mb-3">
	<input type="email" class="form-control" id="email" value="${usuarioInstance?.email}" name="email" placeholder="email" required>
	<label for="email">
		<g:message code="usuario.email.label" default="Correo electrónico" /><span class="required-indicator">*</span>
	</label>
</div>
<div class="form-floating mb-3">
	<input type="password" class="form-control" id="password" value="${usuarioInstance?.password}" name="password" placeholder="contraseña" required>
	<label for="password">
		<g:message code="usuario.password.label" default="Contraseña" /><span class="required-indicator">*</span>
	</label>
</div>