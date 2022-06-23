<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="main" />
	<title>Welcome to Grails</title>
</head>

<body>
	<a href="#page-body" class="skip">
		<g:message code="default.link.skip.label" default="Skip to content&hellip;" />
	</a>

	<!-- INFO INICIAL -->
	<div style="background-image: url('${resource(dir:'images',file:'background.jpeg')}');" class="py-5 my-0">
		<div class="container bg-light rounded-3">
			<div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
				<div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
					<h1 class="display-4 fw-bold lh-1">Encuentra spots cercanos y disfruta donde estés</h1>
					<p class="lead">Busca fácilmente lugares donde patinar cerca tuyo o de tus destinos. De esta forma
						podrás patinar allá donde vayas y descubrir spots y skateparks mágicos. ¿Conoces un buen lugar
						para patinar que todavía no aparece? Registra tus propios lugares en menos de 5 minutos.</p>
					<div class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">
						<g:link controller="spot"><button type="button" class="btn btn-primary btn-lg px-4 me-md-2 fw-bold">Buscar spots</button></g:link>
						<g:link controller="spot" action="create"><button type="button" class="btn btn-outline-secondary btn-lg px-4">Añadir spot</button></g:link>
					</div>
				</div>
				<div class="col-lg-4 ">
					<img class="" src="${resource(dir:'images',file:'mapa.png')}" alt="" width="400">
				</div>
			</div>
		</div>
	</div>

	<!-- LISTADO DE SPOTS AÑADIDOS RECIENTEMENTE-->
	<div class="container px-4 py-5" id="custom-cards">
		<h2 class="pb-2 border-bottom">Añadidos recientemente</h2>

		<div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
			<div class="col">
				<div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg"
					style="background-image: url('${resource(dir:'images',file:'background.jpeg')}');">
					<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Short title, long jacket</h2>
						<ul class="d-flex list-unstyled mt-auto">
							<li class="me-auto">
								<img src="https://github.com/mdo.png" alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white">
							</li>
							<li class="d-flex align-items-center me-4">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									class="bi bi-geo-fill me-2" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z" />
								</svg>
								<small>Earth</small>
							</li>
							<li class="d-flex align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3 me-2" viewBox="0 0 16 16">
									<path
										d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
									<path
										d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
								</svg>
								<small>3d</small>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg"
					style="background-image: url('${resource(dir:'images',file:'background.jpeg')}');">
					<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines
						</h2>
						<ul class="d-flex list-unstyled mt-auto">
							<li class="me-auto">
								<img src="https://github.com/mdo.png" alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white">
							</li>
							<li class="d-flex align-items-center me-3">
								<svg class="bi me-2" width="1em" height="1em">
									<use xlink:href="#geo-fill"></use>
								</svg>
								<small>Pakistan</small>
							</li>
							<li class="d-flex align-items-center">
								<svg class="bi me-2" width="1em" height="1em">
									<use xlink:href="#calendar3"></use>
								</svg>
								<small>4d</small>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg"
					style="background-image: url('${resource(dir:'images',file:'background.jpeg')}');">
					<div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another longer title belongs here</h2>
						<ul class="d-flex list-unstyled mt-auto">
							<li class="me-auto">
								<img src="https://github.com/mdo.png" alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white">
							</li>
							<li class="d-flex align-items-center me-3">
								<svg class="bi me-2" width="1em" height="1em">
									<use xlink:href="#geo-fill"></use>
								</svg>
								<small>California</small>
							</li>
							<li class="d-flex align-items-center">
								<svg class="bi me-2" width="1em" height="1em">
									<use xlink:href="#calendar3"></use>
								</svg>
								<small>5d</small>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- GRAILS DEFAULT -->
	<%-- <div id="page-body" role="main">
		<h1>Welcome to Grails</h1>
		<p>Congratulations, you have successfully started your first Grails application! At the moment
			this is the default page, feel free to modify it to either redirect to a controller or display whatever
			content you may choose. Below is a list of controllers that are currently deployed in this application,
			click on each to execute its default action:</p>

		<div id="controller-list" role="navigation">
			<h2>Available Controllers:</h2>
			<ul>
				<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
					<li class="controller">
						<g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
					</li>
				</g:each>
			</ul>
		</div>
	</div> --%>


</body>

</html>