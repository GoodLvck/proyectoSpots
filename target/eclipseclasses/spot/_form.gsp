<%@ page import="com.proyectospots.Spot" %>



<div class="form-floating mb-3">
	<input type="text" class="form-control" id="nombre" value="${spotInstance?.nombre}" name="nombre" placeholder="nombre" required/>
	<label for="nombre">Nombre
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="tipo" value="${spotInstance?.tipo}" name="tipo" placeholder="tipo" required/>
	<label for="tipo">Tipo
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<textArea id="autoresizing" style="height: 100px" maxlength="5000" type="text" class="form-control" id="descripcion" name="descripcion" placeholder="descripcion">${spotInstance?.descripcion}</textArea>
	<label for="descripcion">Descripcion</label>
</div>

<div class="form-floating mb-3">
	<select style="height:auto" class="form-select" name="modulos" multiple>		
		<g:each var="o" in="${com.proyectospots.Modulo.list()}" optionKey="id" value="${spotInstance?.modulos*.id}">
			<option value="${o.id}">${o.tipo} : ${o.inclinacion}</option>
		</g:each>
	</select>
	<label for="modulos">Módulos</label>
</div>

<div class="form-floating mb-3">
	<input type="url" class="form-control" id="web" value="${spotInstance?.web}" name="web" placeholder="web"/>
	<label for="web">Web</label>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="provincia" value="${spotInstance?.provincia}" name="provincia" placeholder="provincia" required/>
	<label for="provincia">Provincia
		<span class="required-indicator">*</span>
	</label>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" id="direccion" value="${spotInstance?.direccion}" name="direccion" placeholder="direccion" required/>
	<label for="direccion">Direccion
		<span class="required-indicator">*</span>
	</label>
</div>

<div hidden>
	<g:datePicker name="fechaPublicacion" precision="day" default="${new Date()}" value="${spotInstance?.fechaPublicacion}" />
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
