<html>

<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.login.title" /></title>
<r:require modules='application, login' />
<r:require modules="bootstrap" />
</head>
<body>
	
		<div class="row-fluid">
			<div class="span12">
				<div class="nav" role="navigation">
					<ul>
						<li><a href="#myModal" role="button" class="miInformacion"
							data-toggle="modal">Acerca de...</a></li>
					</ul>
				</div>
			</div>
			<!-- Modal -->
			<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<g:render template="../inicio/acercaDe" />
			</div>
		</div>
		<div class="row-fluid">
			<br> <strong><g:message code="sacopro.main.titulo" /></strong>

			<div id='login'>
				<div class="row-fluid">
					<g:if test='${flash.message}'>
						<div class='alert alert-error'>
							${flash.message}
						</div>
					</g:if>
				</div>

				<div class="row-fluid">
					<form action='${postUrl}' method='POST' id="loginForm"
						name="loginForm" autocomplete='off'>

						<div class="span6 offset3">
							<div style="text-align: center">
								<h1>
									<g:message code='springSecurity.login.header' />
								</h1>
							</div>
							<table>
								<tr>
									<td><label for="username"><i class="icon-user"></i>
											<g:message code='springSecurity.login.username.label' /></label></td>
									<td><input name="j_username" id="username" size="40" /></td>
								</tr>
								<tr>
									<td><label for="password"><i
											class="icon-question-sign"></i> <g:message
												code='springSecurity.login.password.label' /></label></td>
									<td><input type="password" name="j_password" id="password"
										size="40" /></td>
								</tr>
								<tr>
									<td colspan='2'>
										<div style="text-align: center">
											<input type="checkbox" class="checkbox"
												name="${rememberMeParameter}" id="remember_me"
												checked="checked" /> <label for='remember_me'><g:message
													code='springSecurity.login.remember.me.label' /></label>
											<%-- | <span class="forgot-link">
								<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
							</span> --%>
										</div>
									</td>
								</tr>
								<tr>
									<%--<td colspan='2'>
							<s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>
							<s2ui:submitButton elementId='loginButton' form='loginForm' messageCode='spring.security.ui.login.login'/>
						</td>
						 --%>
								</tr>
							</table>
							<fieldset class="buttons">
								<div style="text-align: center">
									<s2ui:submitButton class='login' elementId='loginButton'
										form='loginForm' messageCode='springSecurity.login.button' />
								</div>
							</fieldset>
						</div>

					</form>
				</div>
			</div>
		</div>
	
	<script>
		$(document).ready(function() {
			$('#username').focus();
		});

		<s2ui:initCheckboxes/>
	</script>

</body>
</html>
