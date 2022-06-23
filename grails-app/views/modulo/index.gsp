
<%@ page import="com.proyectospots.Modulo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-modulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-modulo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'modulo.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="inclinacion" title="${message(code: 'modulo.inclinacion.label', default: 'Inclinacion')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'modulo.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${moduloInstanceList}" status="i" var="moduloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${moduloInstance.id}">${fieldValue(bean: moduloInstance, field: "tipo")}</g:link></td>
					
						<td>${fieldValue(bean: moduloInstance, field: "inclinacion")}</td>
					
						<td>${fieldValue(bean: moduloInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${moduloInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
