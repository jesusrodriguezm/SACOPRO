<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
 --%>
<title><g:layoutTitle
		default="${message(code: "sacopro.main.titulo")}" /></title>
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

<s2ui:resources module='spring-security-ui' />
<r:require modules="bootstrap" />
<calendar:resources lang="es" theme="tiger" />
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div class="container-fluid">
		<section id="top"></section>
		<div class="row-fluid">
			<div id="loginHeader" class="loginHeader">
				<div class="row-fluid">
					<div class="pull-right">
						<sec:ifLoggedIn>
							<a class="btn" href=""><i	class="icon-retweet" onclick="window.location.reload()" TITLE="Recargar página"></i></a>
							 							 
							<div class="btn-group">							
								<%--<a class="btn" href=""><i class="icon-user icon-white"></i> ${message(code: "sacopro.main.bienvenida")} <sec:username />!</a>
							 --%>
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><i
									class="icon-user icon-white"></i> ${message(code: "sacopro.main.bienvenida")}
									<sec:username />! <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<%--<li><a href="#"><i class="icon-eye-open"></i> Mis Competencias</a></li> --%>
									<li><g:link controller='inicio' action='miInformacion'>
											<i class="icon-user"></i>  Mi información</g:link></li>
									<li class="divider"></li>
									<li><a href="#resetPasswordModal" data-toggle="modal"><i
											class="icon-pencil"></i> Cambiar Password</a></li>
									<li class="divider"></li>
									<li><g:link controller='inicio' action='index'>
											<i class="icon-home"></i> Inicio </g:link></li>
									<li class="divider"></li>
									<li><g:link controller='logout'>
											<i class="icon-remove-sign"></i>
											${message(code: "sacopro.main.logout")}
										</g:link></li>
								</ul>
							</div>
						</sec:ifLoggedIn>

						<%--<sec:ifLoggedIn>
						${message(code: "sacopro.main.bienvenida")}
						<sec:username />! - <g:link controller='logout'>
							${message(code: "sacopro.main.logout")}
						</g:link>
					</sec:ifLoggedIn>
					 --%>
						<sec:ifNotLoggedIn>
							<g:link controller='login' action='auth'>
								${message(code: "sacopro.main.login")}
							</g:link>
						</sec:ifNotLoggedIn>
					</div>
				</div>
				<div class="row-fluid">
					<div class="pull-right">
						<%--<sec:ifAllGranted roles="ROLE_ADMIN, ROLE_Suplantar"> --%>
						<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_Suplantar">
							<g:if test="${session.usuariosSuplantar != null }">
								<g:if test="${session.usuariosSuplantar.size() >0 }">
									<form
										action='${request.contextPath}/j_spring_security_switch_user'
										method='POST'>
										<g:select from="${session.usuariosSuplantar}"
											optionKey="username" optionValue="username" name='j_username' />
										&nbsp; <input class="btn" type='submit' value='Suplantar' />
									</form>
								</g:if>
							</g:if>
						</sec:ifAnyGranted>
						<sec:ifSwitched>
							<a class="btn"
								href='${request.contextPath}/j_spring_security_exit_user'> <i
								class="icon-arrow-left"></i> Volver a <sec:switchedUserOriginalUsername />
							</a>
						</sec:ifSwitched>
					</div>
				</div>
			</div>

			<div id="grailsLogo">
				<g:link controller='inicio' action='index'>
					<img src="${resource(dir: 'images', file: 'sacopro_logo.png')}"
						alt="Sacopro" />
				</g:link>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
				<g:layoutBody />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
				<hr>
				<div class="footer">
					<p class="text-center">
						Trabajo Fin de Máster Jesús Rodríguez 2013 |
						<g:link controller='inicio' action='index'> Inicio </g:link>
						| <a href="#top" class="">Arriba</a>
					</p>
				</div>
				<div id="spinner" class="spinner" style="display: none;">
					<g:message code="spinner.alt" default="Loading&hellip;" />
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="resetPasswordModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<g:render template="../login/passwordReset" />
	</div>

	<div id="buscarColaborador" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<g:render template="../colaborador/buscarColaborador" />
	</div>

	<r:layoutResources />
</body>

</html>