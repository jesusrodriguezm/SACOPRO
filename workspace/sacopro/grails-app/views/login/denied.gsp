<html>
<head>
	<meta name='layout' content='main' />		
	<title><g:message code="springSecurity.denied.title" /></title>
	<r:require modules = 'application, login'/>
	<r:require modules="bootstrap"/>
</head>

<body>
	<div class='body'>
		<g:render template = '../inicio/navegacion' />
		<br> <strong><g:message code="sacopro.main.titulo" /></strong>
		<br>
		<br>
		<div class='alert alert-error'><g:message code="springSecurity.denied.message" /></div>
	</div>
</body>
</html>