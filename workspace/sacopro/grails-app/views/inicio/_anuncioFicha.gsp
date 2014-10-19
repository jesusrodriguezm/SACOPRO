<div class="anuncioFicha">
	<div class="row-fluid">
		 
		<h4>
			<a href="#myModal${ anuncio.id }" data-toggle="modal"> 
			 <span class="badge badge-success">
					${ anuncio.comentarios.size() } <i
					class="icon-comment icon-white"></i></span></a>
			<g:link controller='anuncio' action="show" id="${ anuncio.id }">
				${ anuncio.titulo }
			</g:link>
		</h4>
	</div>

	<div id="myModal${ anuncio.id }" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<g:render template="../anuncioComentario/anuncioComentarios" collection="${ anuncio }" var="anuncio" />
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