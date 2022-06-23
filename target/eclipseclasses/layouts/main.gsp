<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
		<g:layoutTitle default="ProyectoSpots" />
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<asset:stylesheet src="application.css" />
	<asset:javascript src="application.js" />
	<g:layoutHead />
</head>

<body>
	<header class="sticky-top bg-white d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 px-5 border-bottom shadow-sm">
		<a href="${createLink(uri:'/')}" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<img src="${resource(dir:'images',file:'ps_logo.png')}" alt="ProyectoSpots" />
		</a>

		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="${createLink(uri:'/')}" class="nav-link px-2 link-secondary">Home</a></li>
			<li>
				<g:link class="nav-link px-2 link-dark" controller="spot">Buscar spots</g:link>
			</li>
			<li>
				<g:link class="nav-link px-2 link-dark" controller="spot" action="create">Añadir spot</g:link>
			</li>
			<li><a href="#" class="nav-link px-2 link-secondary">About</a></li>
			<li><a href="#" class="nav-link px-2 link-secondary">Contacto</a></li>
		</ul>

		<g:if test="${!session.user}">
			<div class="col-md-3 text-end">
				<g:link style="color:#0d6efd" onmouseover="this.style.color='#fff';"
					onmouseout="this.style.color='#0d6efd';" controller="usuario" action="login"
					class="btn btn-outline-primary me-2">Iniciar sesión</g:link>
				<g:link style="color:#fff;" controller="usuario" action="signup" class="btn btn-primary">Registrarse
				</g:link>
			</div>
		</g:if>
		<g:else>
			<div class="col-md-3 dropdown text-end">
				<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle show" id="dropdownUser1"
					data-bs-toggle="dropdown" aria-expanded="true">
					<img src="https://github.com/mdo.png" width="32" height="32" class="rounded-circle">
				</a>
				<ul class="dropdown-menu text-small show" aria-labelledby="dropdownUser1"
					style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 34px, 0px);"
					data-popper-placement="bottom-end">
					<li><g:link class="dropdown-item" controller='usuario' action='show' id="${session.user.id}">Ver perfil</g:link></li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li><g:link class="dropdown-item" controller='spot' action='create'>Añadir spot</g:link></li>
					<li><g:link class="dropdown-item" controller='modulo' action='create'>Añadir módulos</g:link></li>
					<li><g:link class="dropdown-item" controller='modulo' action='index'>Ver módulos</g:link></li>
					<g:if test="${session.user.admin}">
						<li><g:link class="dropdown-item" controller='usuario' action='create'>Añadir usuarios</g:link></li>
						<li><g:link class="dropdown-item" controller='usuario' action='index'>Ver usuarios</g:link></li>
					</g:if>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li><g:link class="dropdown-item" controller='usuario' action='logout'>Cerrar sesión</g:link></li>
				</ul>
			</div>
		</g:else>
		
	</header>

	<g:layoutBody />

	<div class="container">
		<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<p class="col-md-4 mb-0 text-muted">© 2022 ProyectoSpots</p>

			<a href="${createLink(uri:'/')}"
				class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				<img src="${resource(dir:'images',file:'ps_logo.png')}" alt="ProyectoSpots" />
			</a>

			<ul class="nav col-md-4 justify-content-end">
				<li class="nav-item"><a href="${createLink(uri:'/')}" class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item">
					<g:link class="nav-link px-2 text-muted" controller="spot">Buscar spots</g:link>
				</li>
				<li class="nav-item">
					<g:link class="nav-link px-2 text-muted" controller="spot" action="create">Añadir spot</g:link>
				</li>
				<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
				<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Contacto</a></li>
			</ul>
		</footer>
	</div>

	<div id="spinner" class="spinner" style="display:none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
	</script>
</body>

</html>
