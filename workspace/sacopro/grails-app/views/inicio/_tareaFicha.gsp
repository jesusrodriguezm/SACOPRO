<div class="tareaFicha">
	<div class="row-fluid">
		<div class="span12">
			<h4>
				<div class="btn-group">
				<a class="btn dropdown-toggle btn-success btn-mini" data-toggle="dropdown"
					href="#"><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><g:link controller = 'tarea' action='show' id="${tarea.id}">
							<i class="icon-eye-open"></i>
							<g:message code="default.show.label" args=" " />
						</g:link></li>
					<li><g:link controller = 'tarea' action='edit' id="${tarea.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.edit.label" args=" " />
						</g:link></li>
				</ul>
				</div>
				<g:link controller='tarea' action="show" id="${ tarea.id }">
					${ tarea.nombre }
				</g:link>
			</h4>
		</div>
	</div>	
	<div class="row-fluid">
		<p class="text-warning">
			<small> ${ tarea.prioridad } - ${ tarea.estado }
			</small>
		</p>
	</div>
	
	<div class="row-fluid">
		<div>
			<p>
				<sacopro:textoAParrafo>
					${ tarea.descripcion }
				</sacopro:textoAParrafo>
			</p>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<div class="due">
				<small> F. Tope: <%--<sacopro:fechaTope date="${ tarea.fechaTope }" /> --%>
					<prettytime:display date="${ tarea.fechaTope }" />
				</small>
			</div>
		</div>
		<div class="span4">
			<div class="created">
				<div class="small">
					F. Creacion:
					<%--<sacopro:fechaCorta date="${ tarea.fechaCreacion }" /> --%>
					<prettytime:display date="${ tarea.fechaCreacion }" />
				</div>
			</div>
		</div>
		<g:if test="${ tarea.creador != tarea.ejecutor }">
			<div class="span4">
				<small> Creador: ${ tarea.creador }
				</small>
			</div>
		</g:if>
	</div>
</div>