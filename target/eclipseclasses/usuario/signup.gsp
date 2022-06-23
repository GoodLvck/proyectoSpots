<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Registrar</title>

</head>

<body>

    <div class="container col-xl-10 col-xxl-8 px-4">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${usuarioInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${usuarioInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">
                        data-field-id="${error.field}"</g:if>>
                        <g:message error="${error}" />
                    </li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="row align-items-center g-lg-5 py-5">
            <div class="col-lg-7 text-center text-lg-start">
                <h1 class="display-4 fw-bold lh-1 mb-3">Regístrate para contribuir</h1>
                <p class="col-lg-10 fs-5">Al crear una cuenta de usuario no solo podrás guardar tus spots favoritos y
                    añadir valoraciones, también podrás registrar tus spots favoritos que todavía no estén disponibles.
                </p>
            </div>
            <div class="col-md-10 mx-auto col-lg-5">
                <g:form class="p-4 p-md-5 border rounded-3 bg-light" url="[resource:usuarioInstance, action:'save']">
                    <g:render template="form" />
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" required> He leído y acepto los términos y condiciones.
                        </label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit" value="create">Crear cuenta</button>
                    <hr class="my-4">
                    <small class="text-muted">¿Ya tienes una cuenta?
                        <g:link controller="usuario" action="login"> Inicia sesión aquí.</g:link>
                    </small>
                </g:form>
            </div>
        </div>
    </div>
</body>

</html>