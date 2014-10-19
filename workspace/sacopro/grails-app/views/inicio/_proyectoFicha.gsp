<div class="proyectoFicha">
    <h4><g:link controller='proyecto' action="show" id="${ proyecto.proyecto.id }">${  proyecto.proyecto.nombre }
    | ${ proyecto.proyecto.cliente.nombre }</g:link></h4>
    
    
    <div class="small">
    	Proyecto: <sacopro:fechaCorta date="${ proyecto.proyecto.fechaInicio }"/>  - <sacopro:fechaCorta date="${ proyecto.proyecto.fechaFin }"/>
    	(Participación: ${ proyecto.funcion } -  <sacopro:fechaCorta date="${ proyecto.fechaInicio }"/>  -  <sacopro:fechaCorta date="${ proyecto.fechaFin }"/>) 
 	</div>
    
    <div><sacopro:textoAParrafo>${ proyecto.proyecto.descripcion }</sacopro:textoAParrafo></div>  
  
    <%--    <div class="append-bottom">
    	<div class="span-4">
	    	<div class="due"><div class="small">F. Tope: <sacopro:fechaTope date="${ tarea.fechaTope }"/></div></div>
	    </div>
	    <div class="span-4">
    		<div class="created"><div class="small">F. Creacion: <sacopro:fechaCorta date="${ tarea.fechaCreacion }"/></div></div>
    	</div>
    </div>
    --%>
</div>