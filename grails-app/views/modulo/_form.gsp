<%@ page import="com.proyectospots.Modulo" %>


<div class="form-floating mb-3">
	<input type="text" class="form-control" id="tipo" value="${moduloInstance?.tipo}" name="tipo" placeholder="tipo" required/>
	<label for="tipo">Tipo
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="inclinacion" value="${moduloInstance?.inclinacion}" name="inclinacion" placeholder="inclinacion" required/>
	<label for="inclinacion">Inclinacion
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<textArea id="autoresizing" style="height: 100px" maxlength="2000" type="text" class="form-control" id="descripcion" name="descripcion" placeholder="descripcion" required>${moduloInstance?.descripcion}</textArea>
	<label for="descripcion">Descripcion<span class="required-indicator">*</span></label>
</div>

<div hidden>
	<g:select id="publicador" name="publicador.id" value="${session.user.id}" from="${com.proyectospots.Usuario.list()}" optionKey="id" />
</div>

<script type="text/javascript">
        textarea = document.querySelector("#autoresizing");
        textarea.addEventListener('input', autoResize, false);
      
        function autoResize() {
            this.style.height = 'auto';
            this.style.height = this.scrollHeight + 'px';
        }
</script>
