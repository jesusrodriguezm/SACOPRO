	<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" controller='inicio' action='index'><g:message code="default.home.label"/></g:link></li>
				<li><g:link controller='inicio' action='miInformacion'><i class="icon-user"></i>  Mi información</g:link></li>
				<li><g:link controller='inicio' action='empresa'><i class="icon-eye-open"></i>  Empresa</g:link></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_CapitalHumano, ROLE_Gerencia">
					<li><g:link controller='inicio' action='analisis'><i class="icon-filter"></i>  Analisis</g:link></li>
				</sec:ifAnyGranted>
				<li><g:link controller='estado'><i class="icon-comment"></i>  Social</g:link></li>
				<li><a href="#acercaDe" role="button" class="miInformacion" data-toggle="modal">Acerca de...</a></li>
			</ul>
	</div>
	
	<!-- Modal -->
	<div id="acercaDe" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		 <g:render template="../inicio/acercaDe"/>
	</div>
	