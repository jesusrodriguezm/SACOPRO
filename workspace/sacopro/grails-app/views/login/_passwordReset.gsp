<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">×</button>
	<h3 id="myModalLabel">Cambio de Contraseña</h3>
</div>
<div class="modal-body">
	<div class="container-fluid">
		<div class="row-fluid">
			<div id="resultadoCambio"></div>
		</div>

		<div class="row-fluid">
			<g:formRemote name="myForm" on404="alert('not found!')"
				update="resultadoCambio"
				url="[controller: 'passwordReset', action:'passwordReset']">
				<g:hiddenField name='t' value='${token}' />

				<br />
				<h4>
					<g:message code='spring.security.ui.resetPassword.description' />
				</h4>
				<br />
				
				<div class="row-fluid">
					<table>
						<s2ui:passwordFieldRow name='password'
							labelCode='resetPasswordCommand.password.label' bean="${command}"
							labelCodeDefault='Password' value="${command?.password}" />

						<s2ui:passwordFieldRow name='password2'
							labelCode='resetPasswordCommand.password2.label'
							bean="${command}" labelCodeDefault='Repita la Password'
							value="${command?.password2}" />
					</table>
				</div>
				<div class="row-fluid">
					<p>La Password debe contener al menos 6 caracteres, una
						mayúscula, un número, y un carácter especial.</p>
				</div>
				<br />

				<div class="row-fluid">
					<fieldset class="buttons">						
						<g:submitButton class="btn" name="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>						
					</fieldset>
				</div>
			</g:formRemote>
		</div>
	</div>

	<script>
	function() {
		$('#password').reset();
		$('myForm')[0].reset();
		$('#password').focus();
	}
	</script>
	<script>
		$(document).ready(function() {
			$('#password').reset();
			$('#myForm')[0].reset();
			$('#password').focus();
			$(document).getElementById('myForm').reset();
		});
	</script>
</div>
<%--
<div class="modal-footer">
	<fieldset class="buttons">
		<g:submitButton class="btn" name="update" value="Update" />
		<g:actionSubmit class="btn" action="update"
			value="${message(code: 'default.button.update.label', default: 'Update')}" />
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
	</fieldset>
</div>
 --%>
