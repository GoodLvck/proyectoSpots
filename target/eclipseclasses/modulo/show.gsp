
<%@ page import="com.proyectospots.Modulo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-modulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-modulo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modulo">
			
				<g:if test="${moduloInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="modulo.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${moduloInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.inclinacion}">
				<li class="fieldcontain">
					<span id="inclinacion-label" class="property-label"><g:message code="modulo.inclinacion.label" default="Inclinacion" /></span>
					
						<span class="property-value" aria-labelledby="inclinacion-label"><g:fieldValue bean="${moduloInstance}" field="inclinacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="modulo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${moduloInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>

				<g:if test="${request.getSession(false) && (session.user.admin || moduloInstance.publicador.id == session.user.id)}">
				<br/>
				<li class="fieldcontain">
					<span id="acciones-label" class="property-label">
						Acciones
					</span>

					<span class="property-value" aria-labelledby="acciones-label">
						<g:form url="[resource:moduloInstance, action:'delete']" method="DELETE">
							
							<div class="d-grid gap-2 d-md-block">
								<g:link style="color:#fff" class="btn btn-sm btn-primary" action="edit"
									resource="${moduloInstance}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<g:actionSubmit class="btn btn-sm btn-outline-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm(${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')});" />
							</div>

						</g:form>
					</span>

				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
