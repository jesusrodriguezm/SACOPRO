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
				<i class="icon-home"></i> <strong> ${message(code: "sacopro.index.mensajePaginaInicio")}</strong>
			</p>
		</div>
	</div>
--%>
	<div class="row-fluid">
		<div class=span10>
			<section id="busqueda">
				<sec:ifAnyGranted
					roles="ROLE_ADMIN,ROLE_CapitalHumano, ROLE_Gerencia">
					<div class="row-fluid">
						<h1>Búsqueda Rápida</h1>
					</div>
					<div class="row-fluid">
						<div class="span6">
							<g:render template="../colaborador/buscarColaborador" />
						</div>
						<div class="span6">
							<g:render template="../competenciaNivel/buscarCompetenciaNivel" />
						</div>
					</div>
				</sec:ifAnyGranted>
			</section>

			<section id="admin">
				<sec:ifAnyGranted
					roles="ROLE_ADMIN,ROLE_CapitalHumano, ROLE_Gerencia">
					<div class="row-fluid">
						<div class="span12">
							<h1>Administración</h1>
						</div>
					</div>
					<br>
					<div class="row-fluid">
						<div class="span12">
							<strong>Principal</strong>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span12">
							<ul class="inline">
								<li><g:link controller='colaborador' class="btn">
										${message(code: "sacopro.index.linkListadoColaboradores")}
									</g:link></li>
								<li><g:link controller='bandaNivelPosicion' class="btn">
										${message(code: "sacopro.index.linkListadoPuestos")}
									</g:link></li>
								<li><g:link controller='competenciaNivel' class="btn">Comp. / Niveles</g:link></li>
								<li><g:link controller='bandaNivelPosicionCompetenciaNivel'
										class="btn">Comp. / Puestos</g:link></li>
								<li><g:link controller='colaboradorCompetenciaNivel' class="btn">Comp. / Colaborador</g:link></li>
								<li><g:link controller='usuario' action='userSearch'
										class="btn">Seguridad</g:link></li>
							</ul>
						</div>
					</div>

					<br>
					<div class="row-fluid">
						<div class="span12">
							<strong>Competencias</strong>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span12">
							<div class="span4">
								<ul class="nav-list">
									<li class="nav-header">Competencias</li>
									<li><g:link controller='competencia'>${message(code: "sacopro.index.linkListadoCompetencias")}</g:link></li>
									<li><g:link controller='nivelesCompetencias'>Niveles Competencias</g:link></li>
									<li><g:link controller='competenciaTipo'>Tipo Competencias</g:link></li>									
								</ul>
							</div>
							
								<div class="span4">
									<ul class="nav-list">
										<li class="nav-header">Posiciones</li>
										<li><g:link controller='departamento'>
											${message(code: "sacopro.index.linkListadoDepartamentos")}
										</g:link></li>
										<li><g:link controller='bandaProfesional'>
												${message(code: "sacopro.index.linkListadoBandasProfesionales")}
											</g:link></li>
										<li><g:link controller='nivelProfesional'>
												${message(code: "sacopro.index.linkListadoNivelesProfesionales")}
											</g:link></li>
										<li><g:link controller='posicion'>
												${message(code: "sacopro.index.linkListadoPosiciones")}
											</g:link></li>
									</ul>
								</div>
								<div class="span4">
									<ul class="nav-list">
										<li class="nav-header">Proyectos</li>
										<li><g:link controller='proyecto'>
												${message(code: "sacopro.index.linkListadoProyectos")}
											</g:link></li>
										<li><g:link controller='proyectoColaborador'>Proyecto / Colaboradores</g:link></li>
										<li><g:link controller='tecnologia'>
												${message(code: "sacopro.index.linkListadoTecnologias")}
											</g:link></li>
										<li><g:link controller='funcion'>
												${message(code: "sacopro.index.linkListadoFunciones")}
											</g:link></li>
									</ul>
								</div>							
						</div>
					</div>
					<br>
					<div class="row-fluid">
						<div class="span12">
							<strong>Otras Acciones</strong>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="span4">
								<ul class="nav-list">
									<li class="nav-header">Anuncios</li>
									<li><g:link controller='anuncio'>Anuncios</g:link></li>
									<li><g:link controller='categoria'>Categoria</g:link></li>
									<li><g:link controller='etiqueta'>Etiqueta</g:link></li>
								</ul>
							</div>
							<div class="span4">
								<ul class="nav-list">
									<li class="nav-header">Formación</li>
									<li><g:link controller='centroEducativo'>Centro Educativo</g:link></li>
									<li><g:link controller='estudio'>Estudios</g:link></li>
									<li><g:link controller='nivelEstudio'>Niveles Estudios</g:link></li>
									<li><g:link controller='curso'>
											${message(code: "sacopro.index.linkListadoCursos")}
										</g:link></li>
									<li><g:link controller='cursoCompetenciaNivel'>Curso / Competencias</g:link></li>
									<li><g:link controller='cursoHorario'>Curso / Horario</g:link></li>
									<li><g:link controller='colaboradorCurso'>Curso / Colaborador</g:link></li>
								</ul>
							</div>

							<div class="span4">
								<ul class="nav-list">
									<li class="nav-header">Otros</li> 									
									<li><g:link controller='etiquetasTareas'>
											${message(code: "sacopro.index.linkListadoEtiquetasTareas")}
										</g:link></li>
									<li><g:link controller='moneda'>
											${message(code: "sacopro.index.linkListadoMonedas")}
										</g:link></li>
									<li><g:link controller='colaboradorCursoEstado'>Estado Curso Colaborador</g:link></li>
									<li class="nav-header">Entes Externos</li>
									<li><g:link controller='proveedor'>
											${message(code: "sacopro.index.linkListadoProveedores")}
										</g:link></li>
									<li><g:link controller='cliente'>
											${message(code: "sacopro.index.linkListadoClientes")}
										</g:link></li>
								</ul>
							</div>
						</div>
					</div>
					<br>
				</sec:ifAnyGranted>
			</section>
			<section id="anuncios">
				<div class="row-fluid">
					<div class="row-fluid">
						<div class="span12">
							<div class="span4">
								<h1>Anuncios</h1>
							</div>

							<sec:ifAnyGranted
								roles="ROLE_ADMIN,ROLE_CapitalHumano, ROLE_Gerencia, ROLE_Anuncios">
								<div class="span4">
									<g:link controller='anuncio' action="create" class="btn">
										<i class="icon-pencil"></i>
										${message(code: "sacopro.index.linkNuevaAnuncio")}
									</g:link>
									<g:link controller='anuncio' class="btn">
										<i class="icon-list"></i> Ver Todos
						</g:link>
								</div>
							</sec:ifAnyGranted>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<g:render template="anuncioFicha" collection="${anuncios}"
									var="anuncio" />
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="tareas">
				<%-- Si se está logueado con el administrador, que no salga esta sección --%>
				<g:if test="${ session.colaboradorLogueado != null }">
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<h1>Tareas Abiertas</h1>
								</div>
								<div class="span2">
									<g:link controller='tarea' action="create" class="btn">
										<i class="icon-tasks"></i>
										${message(code: "sacopro.index.linkNuevaTarea")}
									</g:link>
								</div>
								<div class="span2">
									<g:link controller='tarea' action="list" class="btn">
										<i class="icon-list-alt"></i>
										${message(code: "sacopro.index.linkTodasTarea")}
									</g:link>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span10">
									<g:render template="tareaFicha" collection="${tareas}"
										var="tarea" />
								</div>

								<div class="span2">
									<dl class="sidebar">
										<%--<dt>
											<i class="icon-list-alt"></i> Ver
										</dt>
										<dd>
											<ul>											
												<g:link controller='tarea' action="list">
													${message(code: "sacopro.index.linkTodasTarea")}
												</g:link>
											</ul>
										</dd>
										 --%>
										<g:if test="${ tareas != []}">
											<dt>
												<i class="icon-tags"></i> Ver
											</dt>
											<dd>
												<ul>
													<g:each in="${ etiquetas }" var="etiqueta">
														<g:link controller='tarea' action="listarPorEtiqueta"
															params="[id:etiqueta.id]">
															${ etiqueta.nombre }
														</g:link>
														<br>
													</g:each>
												</ul>
											</dd>
										</g:if>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</g:if>
			</section>
			<section id="proyectos">
				<div class="row-fluid">
					<div class="span12">
						<g:if test="${ proyectos != []}">
							<div class="row-fluid">
								<div class="span12">
									<h1>Mis proyectos</h1>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span12">
									<g:render template="proyectoFicha" collection="${proyectos}"
										var="proyecto" />
								</div>
							</div>
						</g:if>
					</div>
				</div>
			</section>
		</div>
		<div class="span2">
			<ul class="nav affix">
				<li><p class='text-center'>
						<i class="icon-home"></i> <strong> ${message(code: "sacopro.index.mensajePaginaInicio")}</strong>
					</p></li>
				<br>
				<li class=""><a href="#top" class=""><i
						class="icon-chevron-up"></i>Arriba</a></li>
				<br>
				<sec:ifAnyGranted
					roles="ROLE_ADMIN,ROLE_CapitalHumano, ROLE_Gerencia">
					<li class=""><a href="#busqueda" class=""><i
							class="icon-chevron-left"></i>Búsqueda</a></li>
					<br>
					<li class=""><a href="#admin" class=""><i
							class="icon-chevron-left"></i>Admin</a></li>
					<br>
				</sec:ifAnyGranted>

				<li class=""><a href="#anuncios"><i
						class="icon-chevron-left"></i>Anuncios</a></li>
				<br>
				<g:if test="${ session.colaboradorLogueado != null }">
					<li><a href="#tareas" class=""><i
							class="icon-chevron-left"></i>Tareas</a></li>
					<br>
				</g:if>
				<g:if test="${ proyectos != []}">
					<li class=""><a href="#proyectos"><i
							class="icon-chevron-left"></i>Proyectos</a></li>
				</g:if>
			</ul>
		</div>

	</div>
</body>
</html>