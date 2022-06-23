<%@ page import="com.proyectospots.Spot" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'spot.label', default: 'Spot')}" />
	<title>
		<g:message code="default.edit.label" args="[entityName]" />
	</title>
</head>

<body>
	<a href="#edit-spot" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="edit-spot" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${spotInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${spotInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">
						data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:spotInstance, action:'update']" method="PUT">
			<g:hiddenField name="version" value="${spotInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
				<g:actionSubmit class="w-100 btn btn-lg btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
</body>

</html>