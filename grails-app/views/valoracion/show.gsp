<%@ page import="com.proyectospots.Valoracion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'valoracion.label', default: 'Valoracion')}" />
	<title>
		<g:message code="default.show.label" args="[entityName]" />
	</title>
</head>

<body>
	<a href="#show-valoracion" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="show-valoracion" class="content scaffold-show" role="main">
		<h1>
			Valoracion - ${valoracionInstance.spot.nombre}
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<ol class="property-list valoracion">

			<g:if test="${valoracionInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label">
						<g:message code="valoracion.titulo.label" default="Titulo" /></span>

					<span class="property-value" aria-labelledby="titulo-label">
						<g:fieldValue bean="${valoracionInstance}" field="titulo" /></span>

				</li>
			</g:if>

			<g:if test="${valoracionInstance?.puntuacion}">
				<li class="fieldcontain">
					<span id="puntuacion-label" class="property-label">
						<g:message code="valoracion.puntuacion.label" default="Puntuacion" /></span>

					<span class="property-value" aria-labelledby="puntuacion-label">
						<g:fieldValue bean="${valoracionInstance}" field="puntuacion" /></span>

				</li>
			</g:if>

			<g:if test="${valoracionInstance?.detalles}">
				<li class="fieldcontain">
					<span id="detalles-label" class="property-label">
						<g:message code="valoracion.detalles.label" default="Detalles" /></span>

					<span class="property-value" aria-labelledby="detalles-label">
						<g:fieldValue bean="${valoracionInstance}" field="detalles" /></span>

				</li>
			</g:if>

			<g:if test="${valoracionInstance?.spot}">
				<li class="fieldcontain">
					<span id="spot-label" class="property-label">
						Ver spot
					</span>

					<span class="property-value" aria-labelledby="spot-label">
						<g:link controller="spot" action="show" id="${valoracionInstance?.spot?.id}">
							${valoracionInstance?.spot?.encodeAsHTML()}</g:link>
					</span>

				</li>
			</g:if>

			<g:if test="${valoracionInstance?.autor}">
				<li class="fieldcontain">
					<span id="autor-label" class="property-label">
						<g:message code="valoracion.autor.label" default="Autor" /></span>

					<span class="property-value" aria-labelledby="autor-label">
						<g:link controller="usuario" action="show" id="${valoracionInstance?.autor?.id}">
							${valoracionInstance?.autor?.encodeAsHTML()}</g:link>
					</span>

				</li>
			</g:if>

			<%-- <g:if test="${request.getSession(false) && (session.user.admin || params.id == String.valueOf(session.user.id))}"> --%>
				<br/>
				<li class="fieldcontain">
					<span id="acciones-label" class="property-label">
						Acciones
					</span>

					<span class="property-value" aria-labelledby="acciones-label">
						<g:form url="[resource:valoracionInstance, action:'delete']" method="DELETE">
							
							<div class="d-grid gap-2 d-md-block">
								<g:link style="color:#fff" class="btn btn-sm btn-primary" action="edit"
									resource="${valoracionInstance}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<g:actionSubmit class="btn btn-sm btn-outline-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm(${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')});" />
							</div>

						</g:form>
					</span>

				</li>
				<%-- </g:if> --%>

		</ol>
	</div>
</body>

</html>