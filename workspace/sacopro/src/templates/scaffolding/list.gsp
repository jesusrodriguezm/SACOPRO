
<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<r:require module="application" />
<r:require modules="bootstrap" />
<r:require module="filterpane" />
</head>
<body>

	<a href="#list-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="\${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
			<li><a href="#myModal" role="button" class="miInformacion"
				data-toggle="modal">Acerca de...</a></li>
		</ul>
	</div>

	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<g:render template="../inicio/acercaDe" />
	</div>

	<div id="list-${domainClass.propertyName}"
		class="content scaffold-list" role="main">

		<div class="row-fluid">
			<div class="span12">
				<div class="span10">
					<div class="row-fluid">
							<g:link action="list" class="btn">
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>				
					</div>
				</div>
				<div class="span2">
					<filterpane:filterButton class="btn" />
				</div>

				<filterpane:filterPane domain="${domainClass.fullName}"
					associatedProperties="posicion.posicion.nombre, departamento.nombre, tipo.nombre, banda.nombre, nivel.nombre, 
						posicion.nombre, competencia.nombre, nivel.nombre,
						posicion.posicion.nombre, posicion.nivel.nombre, posicion.banda.nombre,						
						competenciaNivel.competencia.nombre, competenciaNivel.nivel.nombre,
						competencia.competencia.nombre, competencia.nivel.nombre, 
						colaborador.username, colaborador.primerNombre, colaborador.apellidos, 
						curso.nombre "
					titleKey="fp.tag.filterPane.titleText" dialog="false" visible="n"
					showSortPanel="y" showTitle="n" listDistinct="true"
					distinctColumnName="id" fullAssociationPathFieldNames="false" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
				<g:if test="\${flash.message}">
					<div class="message" role="status">\${flash.message}</div>
				</g:if>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">Nº Elementos Listado: \${${propertyName}Total}</div>
		</div>		
		
		<div class="row-fluid">
			<div class="span12 scrolls">

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="40"></th>
							<%  excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'password' << 'accountLocked' << 'accountExpired' << 'passwordExpired'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 15) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}"  params="\${filterParams}" />
					<%  }   }   } %>
						</tr>
					</thead>
					<tbody>
						<g:each in="\${${propertyName}List}" status="i"
							var="${propertyName}">
							<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
								<td width="40">
									<div class="btn-group">
										<a class="btn dropdown-toggle btn-success"
											data-toggle="dropdown" href="#"><span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><g:link action='show' id="\${${propertyName}.id}">
													<i class="icon-eye-open"></i>
													<g:message code="default.show.label" args="[entityName]" />
												</g:link></li>
											<li><g:link action='edit' id="\${${propertyName}.id}">
													<i class="icon-pencil"></i>
													<g:message code="default.edit.label" args="[entityName]" />
												</g:link></li>
											<li><g:link action='delete' id="\${${propertyName}.id}"
													onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
													<i class="icon-trash"></i>
													<g:message code="default.delete.label" args="[entityName]" />
												</g:link></li>
										</ul>
									</div>
								</td>

								<%  props.eachWithIndex { p, i ->
								if (i == 0) { %>
									<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
								<%      } else if (i < 15) {
											if (p.type == Boolean || p.type == boolean) { %>
									<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
								<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
									<td><g:formatDate date="\${${propertyName}.${p.name}}" format="dd-MM-yyyy" /></td>
								<%          } else { %>
									<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
								<%  }   }   } %>
							</tr>
						</g:each>
					</tbody>
				</table>
				<br>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="pagination">
					<g:paginate total="\${${propertyName}Total}"
						params="\${filterParams}" />
				</div>
			</div>
		</div>
	</div>

</body>
</html>
