<div class="statusMessage" id="message_${messageCounter}">
    
    <g:if test="${statusMessage.autor.id == session.colaboradorLogueado.id }">
    	<strong>Tu </strong>
     	dijiste
    </g:if>
    <g:else>
    	<strong>${statusMessage.autor}</strong> 
    	dijo
    </g:else>
    
    <%--(el <sacopro:fechaYHora date="${statusMessage.dateCreated}"/>): --%>
    <prettytime:display date="${statusMessage.dateCreated}" />
    <sacopro:textoAParrafo>${statusMessage.mensaje}</sacopro:textoAParrafo><br/>
        
</div>
