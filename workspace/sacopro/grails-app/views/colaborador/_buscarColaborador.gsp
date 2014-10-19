<div class="row-fluid">
	<div class="row-fluid">
		<g:formRemote name="myForm" on404="alert('not found!')"
			update="updateMe" url="[controller: 'colaborador', action:'buscar']">
			<br />
			<div class="row-fluid">
				<strong>Colaboradores: </strong><input name="cadena" type="text" />				
			</div>
			<div class="row-fluid">
				<fieldset class="buttons">
					<g:submitButton class="btn" name="update"
						value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" />					
				</fieldset>
			</div>
			<br />
		</g:formRemote>
		<div class="row-fluid">
			<div id="updateMe"></div>
		</div>
	</div>
</div>