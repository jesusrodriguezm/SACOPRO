<%@ page import="com.jrm.sacopro.tareas.Tarea" %>



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
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" required="" value="${tareaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'fechaTope', 'error')} ">
	<label for="fechaTope">
		<g:message code="tarea.fechaTope.label" default="Fecha Tope" />
		
	</label>
	<g:datePicker name="fechaTope" precision="day"  value="${tareaInstance?.fechaTope}" default="none" noSelection="['': '']" />
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

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'fechaFinalizacion', 'error')} ">
	<label for="fechaFinalizacion">
		<g:message code="tarea.fechaFinalizacion.label" default="Fecha Finalizacion" />
		
	</label>
	<g:datePicker name="fechaFinalizacion" precision="day"  value="${tareaInstance?.fechaFinalizacion}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'creador', 'error')} required">
	<label for="creador">
		<g:message code="tarea.creador.label" default="Creador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creador" name="creador.id" from="${com.jrm.sacopro.colaboradores.Colaborador.list()}" optionKey="id" required="" value="${tareaInstance?.creador?.id}" class="many-to-one"/>
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
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${tareaInstance?.fechaCreacion}"  />
</div>
