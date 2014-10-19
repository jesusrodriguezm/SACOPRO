<%@ page import="com.jrm.sacopro.tareas.Tarea" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="application"/>
		<r:require modules="bootstrap"/>
	</head>
	<body>

		<a href="#show-tarea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><a href="#myModal" role="button" class="miInformacion"
				data-toggle="modal">Acerca de...</a></li>
			</ul>
		</div>
		
		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<g:render template="../inicio/acercaDe" />
		</div>
		
		<div id="show-tarea" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tarea">
			
				<g:if test="${tareaInstance?.prioridad}">
				<li class="fieldcontain">
					<span id="prioridad-label" class="property-label"><g:message code="tarea.prioridad.label" default="Prioridad" /></span>
					
						<span class="property-value" aria-labelledby="prioridad-label"><g:fieldValue bean="${tareaInstance}" field="prioridad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tarea.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tareaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="tarea.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${tareaInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tarea.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tareaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.fechaTope}">
				<li class="fieldcontain">
					<span id="fechaTope-label" class="property-label"><g:message code="tarea.fechaTope.label" default="Fecha Tope" /></span>
					
						<span class="property-value" aria-labelledby="fechaTope-label"><g:formatDate format="dd-MM-yyyy" date="${tareaInstance?.fechaTope}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.tiempoUtilizado}">
				<li class="fieldcontain">
					<span id="tiempoUtilizado-label" class="property-label"><g:message code="tarea.tiempoUtilizado.label" default="Tiempo Utilizado" /></span>
					
						<span class="property-value" aria-labelledby="tiempoUtilizado-label"><g:fieldValue bean="${tareaInstance}" field="tiempoUtilizado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.comentariosResolucion}">
				<li class="fieldcontain">
					<span id="comentariosResolucion-label" class="property-label"><g:message code="tarea.comentariosResolucion.label" default="Comentarios Resolucion" /></span>
					
						<span class="property-value" aria-labelledby="comentariosResolucion-label"><g:fieldValue bean="${tareaInstance}" field="comentariosResolucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.fechaFinalizacion}">
				<li class="fieldcontain">
					<span id="fechaFinalizacion-label" class="property-label"><g:message code="tarea.fechaFinalizacion.label" default="Fecha Finalizacion" /></span>
	
						<span class="property-value" aria-labelledby="fechaFinalizacion-label"><g:formatDate date="${tareaInstance?.fechaFinalizacion}" /></span>						
							
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.creador}">
				<li class="fieldcontain">
					<span id="creador-label" class="property-label"><g:message code="tarea.creador.label" default="Creador" /></span>
					
						<span class="property-value" aria-labelledby="creador-label"><g:link controller="tarea" action="show" id="${tareaInstance?.id}">${tareaInstance?.creador?.encodeAsHTML()}</g:link></span>						
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.ejecutor}">
				<li class="fieldcontain">
					<span id="ejecutor-label" class="property-label"><g:message code="tarea.ejecutor.label" default="Ejecutor" /></span>
					
						<span class="property-value" aria-labelledby="ejecutor-label"><g:link controller="tarea" action="show" id="${tareaInstance?.id}">${tareaInstance?.ejecutor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.etiquetas}">
				<li class="fieldcontain">
					<span id="etiquetas-label" class="property-label"><g:message code="tarea.etiquetas.label" default="Etiquetas" /></span>
					
						<g:each in="${tareaInstance.etiquetas}" var="e">
						<span class="property-value" aria-labelledby="etiquetas-label"><g:link controller='tarea' action="listarPorEtiqueta" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tareaInstance?.fechaCreacion}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label"><g:message code="tarea.fechaCreacion.label" default="Fecha Creacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${tareaInstance?.fechaCreacion}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${tareaInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label"><g:message code="tarea.lastUpdated.label" default="Fecha Creacion" /></span>					
					<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${tareaInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tareaInstance?.id}" />
					<g:link class="edit" action="edit" id="${tareaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
	</body>
</html>
