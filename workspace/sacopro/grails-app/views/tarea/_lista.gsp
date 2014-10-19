<%@ page import="com.jrm.sacopro.tareas.Tarea"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'tarea.label', default: 'Tarea')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<r:require module="application" />
<r:require modules="bootstrap" />
<r:require module="filterpane" />
<r:require module="export"/>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<a href="#list-tarea" class="skip" tabindex="-1"><g:message
					code="default.link.skip.label" default="Skip to content&hellip;" /></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message
								code="default.home.label" /></a></li>
					<li><g:link class="create" action="create">
							<g:message code="default.new.label" args="[entityName]" />
						</g:link></li>
					<li><a href="#myModal" role="button" class="miInformacion"
						data-toggle="modal">Acerca de...</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<g:render template="../inicio/acercaDe" />
	</div>

	<div id="list-tarea" class="content scaffold-list" role="main">
		<div class="row-fluid">
			<div class="span12">
				<div class="span10">
					<h1>
						<g:link action="list">
							<g:message code="default.list.label" args="[entityName]" />
						</g:link>
					</h1>
				</div>
				<div class="span2">
					<filterpane:filterButton class="btn" />
				</div>

				<%--<filterpane:filterPane domain="${Tarea}" /> --%>
				<%-- additionalProperties="identifier"--%>
				<filterpane:filterPane domain="${Tarea}"
					associatedProperties="etiquetas.nombre, creador.username, ejecutor.username"
					titleKey="fp.tag.filterPane.titleText" dialog="false" visible="n"
					showSortPanel="y" showTitle="n" listDistinct="true"
					distinctColumnName="id" fullAssociationPathFieldNames="false" />
			</div>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<br>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th width="40"></th>
					<g:sortableColumn property="prioridad"
						title="${message(code: 'tarea.prioridad.label', default: 'Prioridad')}"
						params="${filterParams}" />

					<g:sortableColumn property="nombre"
						title="${message(code: 'tarea.nombre.label', default: 'Nombre')}"
						params="${filterParams}" />

					<g:sortableColumn property="estado"
						title="${message(code: 'tarea.estado.label', default: 'Estado')}"
						params="${filterParams}" />

					<g:sortableColumn property="descripcion"
						title="${message(code: 'tarea.descripcion.label', default: 'Descripcion')}"
						params="${filterParams}" />

					<g:sortableColumn property="fechaTope"
						title="${message(code: 'tarea.fechaTope.label', default: 'Fecha Tope')}"
						params="${filterParams}" />

					<g:sortableColumn property="ejecutor"
						title="${message(code: 'tarea.ejecutor.label', default: 'Ejecutor')}"
						params="${filterParams}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${tareaInstanceList}" status="i" var="tareaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td width="40">
							<div class="btn-group">
								<a class="btn dropdown-toggle btn-success"
									data-toggle="dropdown" href="#"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><g:link action='show' id="${tareaInstance.id}">
											<i class="icon-eye-open"></i>
											<g:message code="default.show.label" args="[entityName]" />
										</g:link></li>
									<li><g:link action='edit' id="${tareaInstance.id}">
											<i class="icon-pencil"></i>
											<g:message code="default.edit.label" args="[entityName]" />
										</g:link></li>																	
									<li><g:link action='finalizar' id="${tareaInstance.id}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
											<i class="icon-flag"></i>	<g:message code="tarea.finalizar" />
										</g:link></li>																																												
								</ul>
							</div>
						</td>


						<td><g:link action="show" id="${tareaInstance.id}">
								${fieldValue(bean: tareaInstance, field: "prioridad")}
							</g:link></td>

						<td>
							${fieldValue(bean: tareaInstance, field: "nombre")}
						</td>

						<td>
							${fieldValue(bean: tareaInstance, field: "estado")}
						</td>

						<td>
							${fieldValue(bean: tareaInstance, field: "descripcion")}
						</td>

						<td><sacopro:fechaCorta date="${tareaInstance.fechaTope}" /></td>

						<td>
							${fieldValue(bean: tareaInstance, field: "ejecutor")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${tareaInstanceTotal}" params="${filterParams}" />
		</div>
		<%--<export:formats /> --%>
	</div>
</body>
</html>
