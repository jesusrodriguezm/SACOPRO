<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">×</button>
	<h3 id="myModalLabel">Competencias</h3>
</div>
<div class="modal-body">
	<h1>
		${ banda.banda }
		-
		${ banda.nivel }
		-
		${ banda.posicion }
	</h1>

	<g:each in="${banda.competencias}" status="i" var="competencia">		
		<dt>
			${competencia.competenciaNivel.competencia} (${competencia.competenciaNivel.nivel})
		</dt>
		<dd>
			<sacopro:textoAParrafo> ${competencia.competenciaNivel.descripcion}</sacopro:textoAParrafo>
		</dd>
	</g:each>
</div>

<div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
	<%--<button class="btn btn-primary">Save changes</button> --%>
</div>