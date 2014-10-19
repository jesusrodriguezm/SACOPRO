package com.jrm.sacopro.proyectos

import java.util.Date;

class Tecnologia {

	String nombre
	
	static hasMany = [proyectos: Proyecto]
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [Proyecto]
	
    static constraints = {
		nombre blank:false, unique:true, minSize:2, maxSize:20
    }
	
	String toString(){
		return nombre
	}
}
