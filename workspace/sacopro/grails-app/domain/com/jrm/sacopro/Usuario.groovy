package com.jrm.sacopro


class Usuario {

	transient springSecurityService

	String username
	String password
	String email
	boolean enabled = false
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	
	//static hasMany = [perfiles: UsuarioPerfil]

	static constraints = {
		username(blank:false, unique:true, size: 4..15)//,matches: "[a-zA-Z]+")
		
		password(blank:false, password:true, display:false, nullable:true/*, widget:"passwordField"/*, 
			validator: { String password, usuario ->
				if (usuario.username && usuario.username.equals(password)) {
				   return 'user.password.error.username'
				}
	  
				if (password && password.length() >= 5 && password.length() <= 64 &&
					  (!password.matches('^.*\\p{Alpha}.*$') ||
					  !password.matches('^.*\\p{Digit}.*$') )) {
				   return 'user.password.error.format'
				   //||  !password.matches('^.*[!@#$%^&].*$')
				}
			}*/)
		email(blank:false, email:true, unique:true)
		enabled display:false
		accountLocked display:false
		accountExpired display:false
		passwordExpired display:false
	}

	static mapping = {
		password column: '`password`'
		tablePerHierarchy false
	}

	Set<Perfil> getAuthorities() {
		UsuarioPerfil.findAllByUsuario(this).collect { it.perfil } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {		
		password = springSecurityService.encodePassword(password, username)		
	}
	
	String toString(){
		return username
	}
}
