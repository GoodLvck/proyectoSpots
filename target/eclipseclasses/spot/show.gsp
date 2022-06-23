<%@ page import="com.proyectospots.Spot" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'spot.label', default: 'Spot')}" />
	<title>
		<g:message code="default.show.label" args="[entityName]" />
	</title>
</head>

<body>
	<a href="#show-spot" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="show-spot" class="content scaffold-show" role="main">
		<h1>${spotInstance.nombre}</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<ol class="property-list spot">

			<g:if test="${spotInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label">
						<g:message code="spot.nombre.label" default="Nombre" /></span>

					<span class="property-value" aria-labelledby="nombre-label">
						<g:fieldValue bean="${spotInstance}" field="nombre" /></span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label">
						<g:message code="spot.tipo.label" default="Tipo" /></span>

					<span class="property-value" aria-labelledby="tipo-label">
						<g:fieldValue bean="${spotInstance}" field="tipo" /></span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label">
						<g:message code="spot.descripcion.label" default="Descripcion" /></span>

					<span class="property-value" aria-labelledby="descripcion-label">
						<g:fieldValue bean="${spotInstance}" field="descripcion" /></span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.modulos}">
				<li class="fieldcontain">
					<span id="modulos-label" class="property-label">
						<g:message code="spot.modulos.label" default="Modulos" /></span>

					<g:each in="${spotInstance.modulos}" var="m">
						<span class="property-value" aria-labelledby="modulos-label">
							<g:link controller="modulo" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link>
						</span>
					</g:each>

				</li>
			</g:if>

			<g:if test="${spotInstance?.web}">
				<li class="fieldcontain">
					<span id="web-label" class="property-label">
						<g:message code="spot.web.label" default="Web" /></span>

					<span class="property-value" aria-labelledby="web-label">
						<g:fieldValue bean="${spotInstance}" field="web" /></span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.provincia}">
				<li class="fieldcontain">
					<span id="ubicacion-label" class="property-label">
						Ubicacion
					</span>

					<span class="property-value" aria-labelledby="ubicacion-label">
						<g:fieldValue bean="${spotInstance}" field="direccion" />,
						<g:fieldValue bean="${spotInstance}" field="provincia" />
					</span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.fechaPublicacion}">
				<li class="fieldcontain">
					<span id="fechaPublicacion-label" class="property-label">
						Fecha de publicación
					</span>

					<span class="property-value" aria-labelledby="fechaPublicacion-label">
						<g:formatDate date="${spotInstance?.fechaPublicacion}" /></span>

				</li>
			</g:if>

			<g:if test="${spotInstance?.publicador}">
				<li class="fieldcontain">
					<span id="publicador-label" class="property-label">
						Publicado por
					</span>

					<span class="property-value" aria-labelledby="publicador-label">
						<g:link controller="usuario" action="show" id="${spotInstance?.publicador?.id}">
							${spotInstance?.publicador?.encodeAsHTML()}
						</g:link>
					</span>

				</li>
			</g:if>

			<br />
			<%-- <g:if test="true">
				<li class="fieldcontain">
					<span id="favorito-label" class="property-label">
						Añadir a favoritos
					</span>

					<span class="property-value" aria-labelledby="favorito-label">
						
					</span>
				</li>
			</g:if> --%>
			<li class="fieldcontain">
				<span id="acciones-label" class="property-label">
					Acciones
				</span>

				<span class="property-value" aria-labelledby="acciones-label">
					<g:form url="[resource:spotInstance, action:'delete']" method="DELETE">
						<div class="d-grid gap-2 d-md-block">
							<g:link style="color:#000" class="btn btn-sm btn-warning" controller="valoracion" action="create">Valorar</g:link>
							
							<g:if test="${request.getSession(false) && session.user && (session.user.admin || spotInstance.publicador.id == session.user.id)}">
								<g:link style="color:#fff" class="btn btn-sm btn-primary" action="edit"
									resource="${spotInstance}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<g:actionSubmit class="btn btn-sm btn-outline-danger" action="delete"
									value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm(${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')});" />
							</g:if>
						</div>
					</g:form>
				</span>

			</li>

		</ol>
		<g:if test="${spotInstance?.valoraciones}">
			<h1>Valoraciones</h1>
			<div class="fieldcontain">
				<g:each in="${spotInstance.valoraciones}" var="v">
					<span id="valoraciones-label" class="property-label">
						<g:link controller="valoracion" action="show" id="${v.id}">${v?.titulo}</g:link>
					</span>

					<span class="property-value" aria-labelledby="valoraciones-label">
						${v?.detalles}
					</span>
				</g:each>

			</div>
		</g:if>
	</div>
</body>

</html>