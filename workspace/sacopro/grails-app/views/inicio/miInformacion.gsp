<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<r:require modules="bootstrap" />
</head>
<body>
	<g:render template='navegacion' />
	<%-- 
	<div class="row-fluid">
		<div class="span12">
			<p class="text-center">				
				<i class="icon-user"></i> <strong>Mi información</strong>
			</p>
		</div>
	</div>
--%>
	<div class="row-fluid">
		<div class=span10>

			<section id="datosGenerales">
				<div class="row-fluid">
					<div class=span12>
						<h1>Datos Generales</h1>
					</div>
					<div class="span12">
						<div class="span6">
							<dl class="dl-horizontal">
								<dt>Nombre:</dt>
								<dd>
									${colaborador}
								</dd>
								<dt>Departamento:</dt>
								<dd>
									${colaborador.departamento }
								</dd>
								<dt>Posición:</dt>
								<dd>
									${colaborador.posicion}
								</dd>
								<dt>Ingreso:</dt>
								<dd>
									<sacopro:fechaCorta date="${colaborador.dateCreated }" />
								</dd>
							</dl>
						</div>
						<div class="span6">
							<dl class="dl-horizontal">
								<dt>Usuario:</dt>
								<dd>
									${colaborador.username}
								</dd>
								<dt>Email:</dt>
								<dd>
									${colaborador.email}
								</dd>
								<dt>Teléfono:</dt>
								<dd>
									${colaborador.telefono}
								</dd>
								<dt>F. Nacimiento:</dt>
								<dd>
									<sacopro:fechaCorta date="${colaborador.fechaNacimiento }" />
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</section>
			<br>
			<section id="competencias">
				<div class="row-fluid">
					<div class="row-fluid">
						<div class=span12>
							<h1>Competencias</h1>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="span6">
								<div class="row-fluid">
									<p class="text-center">
										<%--<strong>${message(code: "sacopro.index.mensajePaginaInicio")}</strong> --%>
										<strong>Mis Competencias</strong>
									</p>
								</div>
								<div class="row-fluid">
									<dl>
										<g:each in="${competencias}" var="competencia">
											<dt>
												${ competencia.competencia }
											</dt>
											<dd>
												${ competencia.competencia.descripcion }
											</dd>

										</g:each>
									</dl>
								</div>
							</div>
							<div class="span6">
								<div class="row-fluid">
									<p class="text-center">
										<%--<strong>${message(code: "sacopro.index.mensajePaginaInicio")}</strong> --%>
										<strong>Competencias de mi Posición</strong>
									</p>
								</div>
								<div class="row-fluid">
									<dl>
										<g:each in="${competenciasPosicion }" var="competencia">
											<dt>
												${ competencia.competenciaNivel }
											</dt>
											<dd>
												${ competencia.competenciaNivel.descripcion }
											</dd>
										</g:each>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<h1>
								<%--<g:message code='spring.security.ui.resetPassword.description' />
						 --%>
								Comparar Mis competencias con Posiciones disponibles
							</h1>

							<g:formRemote name="myForm" on404="alert('not found!')"
								update="updateMe"
								url="[controller: 'inicio', action:'analisisColaboradorPosicion']">
								<g:hiddenField name='colaborador' value='${ colaborador.id }' />

								<div class="row-fluid">
									<table class="table table-striped">
										<tr>
											<td>Posición</td>
											<td><g:select name="posicion" optionKey="id"
													from="${ posiciones }" /> <g:submitButton class="btn"
													name="ver" value="Analizar" /></td>
									</table>
								</div>
								<%--
					<div class="row-fluid">
						<fieldset class="buttons">						
							<g:submitButton class="btn" name="ver"	value="Analizar" />
						</fieldset>
					</div>
					 --%>
							</g:formRemote>
						</div>

						<div class="row-fluid">
							<div id="updateMe"></div>
						</div>
					</div>
				</div>
			</section>
			<br>
			<section id="formacion">
				<div class="row-fluid">
					<div class="span12">
						<h1>Formación</h1>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="span6">
							<strong>Estudios</strong>
							<dl>
								<g:each in="${colaborador.estudios }" var="estudio">
									<dt>
										${ estudio.titulo }
										(
										<sacopro:fechaSoloAno date="${ estudio.fechaFin }" />
										)
									</dt>
									<dd>
										${ estudio.nivel }
										-
										${ estudio.centro }
										- Fin:
										<sacopro:fechaCorta date="${ estudio.fechaFin }" />
									</dd>
								</g:each>
							</dl>
						</div>
						<div class="span6">
							<strong>Cursos</strong>
							<dl class="dl-horizontal">
								<g:each in="${colaborador.cursos }" var="curso">
									<dt>
										${ curso.curso }
									</dt>
									<dd>
										${ curso.estado }
										(${ curso.curso.proveedor })
									</dd>
								</g:each>
							</dl>
						</div>
					</div>
				</div>
			</section>
		</div>

		<div class="span2">
			<ul class="nav  affix">
				<li><p class='text-center'><i class="icon-user"></i> <strong>Mi información</strong></p></li><br>		
				<li><a href="#top" class=""><i class="icon-chevron-up"></i>Arriba</a></li><br>
				<li><a href="#datosGenerales" class=""><i
						class="icon-chevron-left"></i>D. Generales</a></li>
				<br>
				<li><a href="#competencias"><i class="icon-chevron-left"></i>Competencias</a></li>
				<br>
				<li><a href="#formacion"><i class="icon-chevron-left"></i>Formacion</a></li>
			</ul>
		</div>

	</div>

</body>
</html>