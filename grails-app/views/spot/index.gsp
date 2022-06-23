
<%@ page import="com.proyectospots.Spot" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'spot.label', default: 'Spot')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-spot" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-spot" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'spot.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'spot.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'spot.descripcion.label', default: 'Descripcion')}" />
										
						<g:sortableColumn property="provincia" title="${message(code: 'spot.provincia.label', default: 'Provincia')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'spot.direccion.label', default: 'Direccion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${spotInstanceList}" status="i" var="spotInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${spotInstance.id}">${fieldValue(bean: spotInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: spotInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: spotInstance, field: "descripcion")}</td>
										
						<td>${fieldValue(bean: spotInstance, field: "provincia")}</td>
					
						<td>${fieldValue(bean: spotInstance, field: "direccion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${spotInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
