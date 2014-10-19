<%@ page import="com.jrm.sacopro.tareas.Tarea" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require module="application"/>
		<r:require modules="bootstrap"/>
	</head>
	<body>
	
		<a href="#edit-tarea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
					
		<div id="edit-tarea" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${tareaInstance}">
			<ul class="alert alert-error" role="alert">
				<g:eachError bean="${tareaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${tareaInstance?.id}" />
				<g:hiddenField name="version" value="${tareaInstance?.version}" />
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'prioridad', 'error')} required">
					<label for="prioridad">
						<g:message code="tarea.prioridad.label" default="Prioridad" />
						<span class="required-indicator">*</span>
					</label>
					<g:select name="prioridad" from="${tareaInstance.constraints.prioridad.inList}" required="" value="${tareaInstance?.prioridad}" valueMessagePrefix="tarea.prioridad"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'nombre', 'error')} required">
					<label for="nombre">
						<g:message code="tarea.nombre.label" default="Nombre" />
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="nombre" required="" value="${tareaInstance?.nombre}"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'estado', 'error')} required">
					<label for="estado">
						<g:message code="tarea.estado.label" default="Estado" />
						<span class="required-indicator">*</span>
					</label>
					<g:select name="estado" from="${tareaInstance.constraints.estado.inList}" required="" value="${tareaInstance?.estado}" valueMessagePrefix="tarea.estado"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'descripcion', 'error')} required">
					<label for="descripcion">
						<g:message code="tarea.descripcion.label" default="Descripcion" />
						<span class="required-indicator">*</span>
					</label>
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" required="" value="${tareaInstance?.descripcion}" />
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'fechaTope', 'error')} ">
					<label for="fechaTope">
						<g:message code="tarea.fechaTope.label" default="Fecha Tope" />
						
					</label>
					<%--<g:datePicker name="fechaTope" precision="day"  value="${tareaInstance?.fechaTope}" default="none" noSelection="['': '']" />
					 --%>
					<calendar:datePicker name="fechaTope" defaultValue="none" dateFormat="%d/%m/%Y" value="${tareaInstance?.fechaTope}"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'tiempoUtilizado', 'error')} required">
					<label for="tiempoUtilizado">
						<g:message code="tarea.tiempoUtilizado.label" default="Tiempo Utilizado" />
						<span class="required-indicator">*</span>
					</label>
					<g:field name="tiempoUtilizado" type="number" min="0" value="${tareaInstance.tiempoUtilizado}" required=""/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'comentariosResolucion', 'error')} ">
					<label for="comentariosResolucion">
						<g:message code="tarea.comentariosResolucion.label" default="Comentarios Resolucion" />
						
					</label>
					<g:textArea name="comentariosResolucion" cols="40" rows="5" maxlength="1000" value="${tareaInstance?.comentariosResolucion}"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'creador', 'error')} required">
					<label for="creador">
						<g:message code="tarea.creador.label" default="Creador" />
						<%--<span class="required-indicator">*</span> --%>
					</label>
					<%--<g:select id="creador" name="creador.id" from="${com.jrm.sacopro.colaboradores.Colaborador.list()}" optionKey="id" required="" value="${tareaInstance?.creador?.id}" class="many-to-one" readonly="true"/>
					 --%>
					 <label> ${  tareaInstance.creador } </label>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'ejecutor', 'error')} required">
					<label for="ejecutor">
						<g:message code="tarea.ejecutor.label" default="Ejecutor" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="ejecutor" name="ejecutor.id" from="${com.jrm.sacopro.colaboradores.Colaborador.list()}" optionKey="id" required="" value="${tareaInstance?.ejecutor?.id}" class="many-to-one"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'etiquetas', 'error')} ">
					<label for="etiquetas">
						<g:message code="tarea.etiquetas.label" default="Etiquetas" />
						
					</label>
					<g:select name="etiquetas" from="${com.jrm.sacopro.tareas.EtiquetasTareas.list()}" multiple="multiple" optionKey="id" size="5" value="${tareaInstance?.etiquetas*.id}" class="many-to-many"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'fechaCreacion', 'error')} required">
					<label for="fechaCreacion">
						<g:message code="tarea.fechaCreacion.label" default="Fecha Creacion" />
						<%--<span class="required-indicator">*</span> --%>
					</label>
					<%--<g:datePicker name="fechaCreacion" precision="day"  value="${tareaInstance?.fechaCreacion}"  />  --%>
					<%--<sacopro:fechaCorta date="${tareaInstance?.fechaCreacion}"/> --%>
					<g:formatDate date="${tareaInstance?.fechaCreacion}" />
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
	</body>
</html>
