<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<r:require modules="bootstrap" />
</head>
<body>
	<g:render template='navegacion' />
	<div class="row-fluid">
		<div class="span12">
			<p class="text-center">
				<%--<strong>${message(code: "sacopro.index.mensajePaginaInicio")}</strong> --%>
				<i class="icon-filter"></i> <strong>Analisis</strong>
			</p>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<g:formRemote name="myForm" on404="alert('not found!')"
					update="updateMe"
					url="[controller: 'inicio', action:'analisisColaboradoresPosicion']">
					<%-- url="[controller: 'inicio', action:'analisisColaboradorPosicion']">--%>					
					<br />
					<h1>
						<%--<g:message code='spring.security.ui.resetPassword.description' />
						 --%>
						Seleccione Colaborador y Posición
					</h1>
					<br />

					<div class="row-fluid">
						<table class="table table-striped">
							<tr>
								<td>Colaborador:</td>
								<%--<td><g:select name="colaborador" optionKey="id"	from="${ colaboradores }" /></td> --%>
								<td><g:select name="colaborador" optionKey="id"	from="${ colaboradores }" multiple="true" /></td>
								<td>Posición</td>
								<td><g:select name="posicion" optionKey="id"
										from="${ posiciones }" /></td>
						</table>
					</div>

					<div class="row-fluid">
						<fieldset class="buttons">
							<g:submitButton class="btn" name="ver" value="Analizar" />
						</fieldset>
					</div>
				</g:formRemote>
			</div>
			<div class="row-fluid">
				<div class="span12 scrolls">
					<div id="updateMe"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>