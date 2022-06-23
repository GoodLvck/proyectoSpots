<%@ page import="com.proyectospots.Valoracion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'valoracion.label', default: 'Valoracion')}" />
	<title>
		<g:message code="default.list.label" args="[entityName]" />
	</title>
</head>

<body>
	<a href="#list-valoracion" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="list-valoracion" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="titulo"
						title="${message(code: 'valoracion.titulo.label', default: 'Titulo')}" />

					<th>
						<g:message code="valoracion.spot.label" default="Spot" />
					</th>

					<g:sortableColumn property="puntuacion"
						title="${message(code: 'valoracion.puntuacion.label', default: 'Puntuacion')}" />

					<g:sortableColumn property="detalles"
						title="${message(code: 'valoracion.detalles.label', default: 'Detalles')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${valoracionInstanceList}" status="i" var="valoracionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							<g:link action="show" id="${valoracionInstance.id}">${fieldValue(bean: valoracionInstance,
								field: "titulo")}</g:link>
						</td>

						<td>${fieldValue(bean: valoracionInstance, field: "spot")}</td>

						<td>${fieldValue(bean: valoracionInstance, field: "puntuacion")}</td>

						<td>${fieldValue(bean: valoracionInstance, field: "detalles")}</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${valoracionInstanceCount ?: 0}" />
		</div>
	</div>
</body>

</html>