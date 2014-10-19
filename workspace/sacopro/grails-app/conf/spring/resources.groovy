// Place your Spring DSL code here
beans = {
	//este bean es para poder entrar el sistema con el nombre de usuario o con el email
	userDetailsService(com.jrm.sacopro.CustomUserDetailsService)
}
