<%@ page import="com.proyectospots.Usuario" %>

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title>
		Mi perfil
	</title>
</head>

<body>
	<a href="#show-usuario" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" />
	</a>
	<div id="show-usuario" class="content scaffold-show" role="main">
		<g:if test="${session.user.id == usuarioInstance.id}">
			<h1>Mi perfil</h1>
		</g:if>
		<g:else>
			<h1>Perfil de ${usuarioInstance.usuario}</h1>
		</g:else>
		
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<ol class="property-list usuario">

			<g:if test="${usuarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label">
						<g:message code="usuario.usuario.label" default="Usuario" /></span>

					<span class="property-value" aria-labelledby="usuario-label">
						<g:fieldValue bean="${usuarioInstance}" field="usuario" /></span>

				</li>
			</g:if>

			<g:if test="${usuarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label">
						Nombre completo
					</span>

					<span class="property-value" aria-labelledby="nombre-label">
						<g:fieldValue bean="${usuarioInstance}" field="nombre" />
						<g:fieldValue bean="${usuarioInstance}" field="apellido" />
					</span>

				</li>
			</g:if>

			<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label">
						<g:message code="usuario.email.label" default="Email" /></span>

					<span class="property-value" aria-labelledby="email-label">
						<g:fieldValue bean="${usuarioInstance}" field="email" /></span>

				</li>
			</g:if>

			<g:if test="${usuarioInstance?.spotsFavoritos}">
				<li class="fieldcontain">
					<span id="spotsFavoritos-label" class="property-label">
						<g:message code="usuario.spotsFavoritos.label" default="Spots Favoritos" /></span>

					<g:each in="${usuarioInstance.spotsFavoritos}" var="s">
						<span class="property-value" aria-labelledby="spotsFavoritos-label">
							<g:link controller="spot" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
						</span>
					</g:each>

				</li>
			</g:if>

			<g:if test="${request.getSession(false) && (session.user.admin || params.id == String.valueOf(session.user.id))}">
				<br/>
				<li class="fieldcontain">
					<span id="acciones-label" class="property-label">
						Acciones
					</span>

					<span class="property-value" aria-labelledby="acciones-label">
						<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
							<div class="d-grid gap-2 d-md-block">
								<g:link style="color:#fff" class="btn btn-sm btn-primary" action="edit"
									resource="${usuarioInstance}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<g:if test="${session.user.admin}">
									<g:actionSubmit class="btn btn-sm btn-outline-danger" action="delete"
									value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm(${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')});" />
								</g:if>
							</div>
						</g:form>
					</span>

				</li>
			</g:if>


		</ol>
	</div>
</body>

</html>