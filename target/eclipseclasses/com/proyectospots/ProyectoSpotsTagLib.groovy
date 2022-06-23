package com.proyectospots

class ProyectoSpotsTagLib {
    static defaultEncodeAs = [taglib:'html']
    // static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def loginToggle = {

		

		// <g:if test="${!session.user}">
		// 	<div class="col-md-3 text-end">
		// 		<g:link style="color:#0d6efd" onmouseover="this.style.color='#fff';"
		// 			onmouseout="this.style.color='#0d6efd';" controller="usuario" action="login"
		// 			class="btn btn-outline-primary me-2">Iniciar sesión</g:link>
		// 		<g:link style="color:#fff;" controller="usuario" action="create" class="btn btn-primary">Registrarse
		// 		</g:link>
		// 	</div>
		// </g:if>
		// <g:else>
		// 	<div class="col-md-3 dropdown text-end">
		// 		<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle show" id="dropdownUser1"
		// 			data-bs-toggle="dropdown" aria-expanded="true">
		// 			<img src="https://github.com/mdo.png" width="32" height="32" class="rounded-circle">
		// 		</a>
		// 		<ul class="dropdown-menu text-small show" aria-labelledby="dropdownUser1"
		// 			style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 34px, 0px);"
		// 			data-popper-placement="bottom-end">
		// 			<li><g:link class="dropdown-item" controller='spot' action='create'>Añadir spot</g:link></li>
		// 			<li><g:link class="dropdown-item" controller='usuario' action='show' id="${session.user.id}">Ver perfil</g:link></li>
		// 			<li>
		// 				<hr class="dropdown-divider">
		// 			</li>
		// 			<li><g:link class="dropdown-item" controller='usuario' action='logout'>Cerrar sesión</g:link></li>
		// 		</ul>
		// 	</div>
		// </g:else>

	}
}