<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<r:require modules="bootstrap" />
</head>
<body data-spy="scroll" data-target=".navbar">
	<g:render template='navegacion' />
	<%--<div class="row-fluid">
		<div class="span12">
			<p class="text-center">		
				<i class="icon-eye-open"></i> <strong>Empresa</strong>
			</p>
		</div>
	</div>
	 --%>
	<div class="row-fluid">
		<div class=span10>

			<section id="colaboradores">
				<div class="row-fluid">
					<div class=span12>
						<h1>Colaboradores</h1>
					</div>
				</div>
				<div class="row-fluid">
					<div class=span12>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Colaborador</th>
									<th>Email</th>
									<th>Teléfono</th>
									<th>Departamento</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${colaboradores}" status="i" var="colaborador">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td>
											${ colaborador }
										</td>
										<td>
											${ colaborador.email }
										</td>
										<td>
											${ colaborador.telefono }
										</td>
										<td>
											${ colaborador.departamento }
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section id="informacion">
				<div class="row-fluid">
					<div class=span12>
						<div class=span6>
							<div class="row-fluid">
								<h1>Bandas</h1>
							</div>

							<div class="row-fluid">
								<ul>
									<g:each in="${bandasLista}" status="i" var="bandaLista">
										<li>
											${bandaLista }
										</li>
									</g:each>
								</ul>
							</div>
						</div>
						<div class=span6>
							<div class="row-fluid">
								<h1>Niveles Profesionales</h1>

							</div>
							<div class="row-fluid">
								<ul>
									<g:each in="${nivelesLista}" status="i" var="nivel">
										<li>
											${nivel }
										</li>
									</g:each>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="posiciones">
				<div class="row-fluid">
					<div class=span12>
						<h1>Puestos</h1>
					</div>
				</div>
				<div class="row-fluid">
					<div class=span12>

						<div class="span12">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Banda</th>
										<th>Nivel</th>
										<th>Posicion</th>
										<%--<th>Descripción</th>--%>
										<th>Salario</th>
										<th>Nº Col</th>
										<th>Comp.</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${bandas}" status="i" var="banda">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
											<td>
												${ banda.banda }
											</td>
											<td>
												${ banda.nivel }
											</td>
											<td>
												${ banda.posicion }
											</td>
											<%--<td>
												${ banda.posicion.descripcion }
											</td> --%>
											
											<td>Min: ${ banda.minSalario } | Max: ${ banda.maxSalario }
											</td>

											<td>
												${ banda.colaborador.size() }
											</td>

											<td width="50px"><a href="#myModal${ banda.id }"
												class="btn" data-toggle="modal"> <span
													class="badge badge-success"> ${ banda.competencias.size() }</span>
											</a> <!-- Modal -->
												<div id="myModal${ banda.id }" class="modal hide fade"
													tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
													aria-hidden="true">
													<g:render template="../competencia/competenciasPosicion"
														collection="${ banda }" var="banda" />
												</div></td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>

			<section id="competencias">
				<div class="row-fluid">
					<div class=span12>
						<h1>Competencias</h1>
					</div>
				</div>

				<div class="row-fluid">
					<div class=span12>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Descripción</th>
									<th>Tipo</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${competencias}" status="i" var="c">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td>
											${ c.nombre }
										</td>
										<td>
											${ c.descripcion }
										</td>
										<td>
											${ c.tipo }
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section id="nivelescompetencias">
				<div class="row-fluid">
					<div class=span12>
						<h1>Niveles Competencias</h1>
					</div>
				</div>


				<div class="row-fluid">
					<div class=span12>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Competencia</th>
									<th>Nivel</th>
									<th>Descripción</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${competenciaNivel}" status="i" var="cn">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td>
											${ cn.competencia }
										</td>
										<td>
											${ cn.nivel }
										</td>
										<td>
											${ cn.descripcion }
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>


		<div class="span2">
			<ul class="nav affix">
				<li><p class='text-center'>
						<i class="icon-eye-open"></i> <strong>Empresa</strong>
					</p></li>
				<br>
				<li><a href="#top" class=""><i class="icon-chevron-up"></i>Arriba</a></li>
				<br>
				<li><a href="#colaboradores" class=""><i
						class="icon-chevron-left"></i>Colaboradores</a></li>
				<br>
				<li><a href="#informacion" class=""><i
						class="icon-chevron-left"></i>Bandas</a></li>
				<br>
				<li><a href="#posiciones"><i class="icon-chevron-left"></i>Puestos</a></li>
				<br>
				<li><a href="#competencias"><i class="icon-chevron-left"></i>Competencias</a></li>
				<br>
				<li><a href="#nivelescompetencias"><i
						class="icon-chevron-left"></i>Niveles Comp.</a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>