<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Iniciar sesión</title>
  
</head>

<body>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="container col-xl-10 col-xxl-8 px-4 py-5">
        <div class="row align-items-center g-lg-5 py-5">
            <div class="col-lg-7 text-center text-lg-start">
                <h1 class="display-4 fw-bold lh-1 mb-3">Qué alegría verte de nuevo</h1>
                <p class="col-lg-10 fs-4">Inicia sesión para añadir nuevos spots a tu lista de favoritos.</p>
            </div>
            <div class="col-md-10 mx-auto col-lg-5">
                <g:form action="validate" class="p-4 p-md-5 border rounded-3 bg-light">
                    <input type="hidden" name="cName" value="${cName}"> 
                    <input type="hidden" name="aName" value="${aName}">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="usuario" name="usuario" value="" placeholder="Usuario">
                        <label for="usuario">Usuario</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" name="password" value="" placeholder="Contraseña">
                        <label for="password">Contraseña</label>
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> Recordar
                        </label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar sesión</button>
                    <hr class="my-4">
                    <small class="text-muted">¿Todavía no tienes una cuenta? <g:link controller="usuario" action="signup">Regístrate aquí.</g:link></small>
                </g:form>
            </div>
        </div>
    </div>
</body>

</html>