package com.jrm.sacopro.proyectos

import java.util.Date;

class Cliente {

	String nombre
	String direccion
	String url
	String contacto
	String telefono
	
	static hasMany = [proyectos: Proyecto]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		nombre(minSize:3, maxSize:300)
		direccion(nullable:true)
		url(nullable:true, url:true)
		contacto(nullable:true)
		telefono(nullable:true)
    }
	
	String toString(){
		return nombre
	}
}
