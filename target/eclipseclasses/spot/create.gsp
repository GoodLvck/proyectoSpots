<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'spot.label', default: 'Spot')}" />
	<title>
		<g:message code="default.create.label" args="[entityName]" />
	</title>
</head>

<body>
	<a href="#create-spot" class="skip" tabindex="-1">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="create-spot" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
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

		<g:form url="[resource:spotInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
				<g:submitButton name="create" class="w-100 btn btn-lg btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>

</html>