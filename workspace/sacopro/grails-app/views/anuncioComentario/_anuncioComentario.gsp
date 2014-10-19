<div class="anuncioComentario">
	<div class="row-fluid">	
			<p>	<sacopro:textoAParrafo>
					${ comentario.comentario }
				</sacopro:textoAParrafo>
			</p>
			<p class="text-right muted"><em>
					 <strong>${ comentario.colaborador }</strong>
					 (<%--<sacopro:fechaYHora date="${ comentario.fecha }" /> --%>
					 <prettytime:display date="${ comentario.fecha }" />)
				</em>
			</p>				
	</div>
</div>