<!DOCTYPE html>
<html>
<head>
<title><g:if env="development">Grails Runtime Exception</g:if>
	<g:else>Error</g:else></title>
<meta name="layout" content="main">
<r:require module="application" />
<r:require modules="bootstrap" />
<g:if env="development">
	<link rel="stylesheet"
		href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
</g:if>
</head>
<body>
	<g:render template='/inicio/navegacion' />
	<g:if env="development">
		<g:renderException exception="${exception}" />
	</g:if>
	<g:else>
		<ul class="errors">
			<li>Lo sentimos, se ha producido un error, vuelva a intentarlo.</li>
		</ul>
	</g:else>
</body>
</html>
