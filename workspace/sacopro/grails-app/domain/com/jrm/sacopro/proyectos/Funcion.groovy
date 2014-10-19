package com.jrm.sacopro.proyectos

import java.util.Date;

class Funcion {

	String nombre
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [proyectos: ProyectoColaborador]
	
	static belongsTo = [ProyectoColaborador]
	
    static constraints = {
		nombre unique:true, minSize:3, maxSize: 30
    }
	
	String toString() {
		return nombre
	}
}
