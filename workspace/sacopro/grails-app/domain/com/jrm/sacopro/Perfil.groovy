package com.jrm.sacopro

class Perfil {

	String authority
	
	//static hasMany = [usuarios: UsuarioPerfil]

	static mapping = {
		cache true
	}
	
	String toString(){
		return this.authority
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
