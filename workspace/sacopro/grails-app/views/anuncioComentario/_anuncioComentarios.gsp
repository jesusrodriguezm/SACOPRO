<div class="modal-body">
	<div class="anuncioFicha">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<h4>
						<g:link controller='anuncio' action="show" id="${ anuncio.id }">
							${ anuncio.titulo }
						</g:link>

						<small> (Comentarios: <span class="badge badge-success">
								${ anuncio.comentarios.size() }
						</span>)
						</small>
					</h4>
				</div>
				<div class="row-fluid">
					<p class="text-warning">
						<small> ${ anuncio.categoria }
						</small>
					</p>
				</div>
				<div class="row-fluid">
					<div>
						<p>
							<sacopro:textoAParrafo>
								${ anuncio.mensaje }
							</sacopro:textoAParrafo>
						</p>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<div class="created">
							<div class="small">
								Publicado
								<%--<sacopro:fechaTope date="${ anuncio.fechaPublicacion }" /> --%>
								<prettytime:display date="${ anuncio.fechaPublicacion }" />
							</div>
						</div>
					</div>
					<div class="span4">
						<div class="created">
							<small> Expira <%--<sacopro:fechaCorta	date="${ anuncio.fechaExpiracion }" /> --%>
								<prettytime:display date="${ anuncio.fechaExpiracion }" />
							</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<strong>Comentarios</strong>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<g:render template="../anuncioComentario/anuncioComentario"
				collection="${ anuncio.comentarios.sort{it.fecha} }"
				var="comentario" />
		</div>
	</div>

	<div class="row-fluid">
		<div class="row-fluid">
			<div id="resultado${ anuncio.id }"></div>
		</div>
		<g:formRemote name="myForm" on404="alert('not found!')"
			update="resultado${ anuncio.id }"
			url="[controller: 'anuncioComentario', action:'insertar']">
			<br />
			<div class="row-fluid">
				<strong>Añade un comentario </strong>
			</div>
			<div class="row-fluid">
				<div class="span8">
					<g:hiddenField name='anuncioId' value='${ anuncio.id }' />
					<g:textArea name="nuevoComentario" value="" />
				</div>
				<div class="span4">
					<g:submitButton class="btn" name="add"
						value="${message(code: 'default.button.create.label', default: 'Add')}" />
				</div>
			</div>
			<%--
		<div class="row-fluid">
			<fieldset class="buttons">
				<g:submitButton class="btn" name="add"
					value="${message(code: 'default.button.create.label', default: 'Add')}" />			
			</fieldset>
		</div>
		 --%>
			<br />
		</g:formRemote>
	</div>
</div>

