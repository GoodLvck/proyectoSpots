<%@ page import="com.proyectospots.Valoracion" %>


<div class="form-floating mb-3">
	<input type="text" class="form-control" id="titulo" value="${valoracionInstance?.titulo}" name="titulo" placeholder="titulo" required/>
	<label for="titulo">Titulo
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<textArea id="autoresizing" style="height: 100px" maxlength="2000" type="text" class="form-control" id="detalles" name="detalles" placeholder="detalles" required>${valoracionInstance?.detalles}</textArea>
	<label for="detalles">Detalles<span class="required-indicator">*</span></label>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="puntuacion" value="${valoracionInstance?.puntuacion}" name="puntuacion" placeholder="puntuacion" required/>
	<label for="puntuacion">Puntuacion
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="fieldcontain ${hasErrors(bean: valoracionInstance, field: 'spot', 'error')} required">
	<label for="spot">
		<g:message code="valoracion.spot.label" default="Spot" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="spot" name="spot.id" from="${com.proyectospots.Spot.list()}" optionKey="id" required="" value="${valoracionInstance?.spot?.id}" class="many-to-one"/>

</div>

<div hidden>
	<g:select id="autor" name="autor.id" value="${session.user.id}" from="${com.proyectospots.Usuario.list()}" optionKey="id" />
</div>

<script type="text/javascript">
        textarea = document.querySelector("#autoresizing");
        textarea.addEventListener('input', autoResize, false);
      
        function autoResize() {
            this.style.height = 'auto';
            this.style.height = this.scrollHeight + 'px';
        }
</script>