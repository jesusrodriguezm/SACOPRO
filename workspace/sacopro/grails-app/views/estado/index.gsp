<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<r:require modules="bootstrap" />

<title>¿Qué haces?</title>
<g:javascript library="jquery" plugin="jquery" />
</head>

<body>
	<g:render template='../inicio/navegacion' />
	<div class="row-fluid">
		<div class=span10>
			<div class="row-fluid">
				<div class="span8">
					<div class="row-fluid">
						<h1>¿Qué haces?</h1>
					</div>
					<div class="row-fluid">
						<div class="updatStatusForm">
							<g:formRemote url="[action: 'updateStatus']" update="messages"
								name="updateStatusForm"
								onSuccess="document.getElementById('message').value='';">
								<g:textArea name="message" value="" />
								<br />
								<fieldset class="buttons">
									<g:submitButton class="btn" name="update"
										value="${message(code: 'default.button.enviar.label', default: 'Enviar')}" />
								</fieldset>
							</g:formRemote>
						</div>
					</div>
					<div class="row-fluid">
						<h1>Linea del Tiempo</h1>
					</div>
					<div class="row-fluid">
						<div id="messages">
							<sacopro:mostrarEstados messages="${statusMessages}" />
							<%-- <div class="pagination">
								<g:paginate total="${statusMessages.size()}" />			
							</div>--%>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="row-fluid">
						<h1>A quién sigues:</h1>
					</div>
					<div class="row-fluid">
						<g:if test="${ seguidos.size() > 0 }">
							<g:render template="seguidoFicha" collection="${seguidos}"
								var="seguido" />
						</g:if>
						<g:if test="${ seguidos.size() == 0 }">
							<strong>No sigues a nadie.</strong>
						</g:if>

					</div>

					<div class="row-fluid">
						<h1>Busca a quién seguir</h1>
					</div>
					<%--
	<div class="searchForm">
		<g:form controller="searchable" name="userSearchForm">
			<g:textField name="q" value="" />
			<g:submitButton name="Search For Users" id="search_for_users_button" />
		</g:form>
	</div>
 --%>

					<div class="row-fluid">
						<div class="row-fluid">
							<g:formRemote name="myForm" on404="alert('not found!')"
								update="busquedaAquienSeguir" url="[action:'buscarSeguir']">
								<br />
								<div class="row-fluid">
									<strong>Buscar: </strong><input name="cadena" type="text" />
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
								<div id="busquedaAquienSeguir"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="span2">
			<ul class="nav affix">
				<li><p class='text-center'>
						<i class="icon-comment"></i> <strong> Social</strong>
					</p></li>
				<br>
				<li class=""><a href="#top" class=""><i
						class="icon-chevron-up"></i>Arriba</a></li>
				<br>
			</ul>
		</div>
	</div>
</body>
</html>