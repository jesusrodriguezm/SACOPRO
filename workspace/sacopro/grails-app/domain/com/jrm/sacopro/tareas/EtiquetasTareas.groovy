package com.jrm.sacopro.tareas

import java.util.Date;

class EtiquetasTareas {
	
	String nombre
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [tareas: Tarea]
	
	static belongsTo = Tarea

    static constraints = {
		nombre blank:false, unique:true, minSize:3, maxSize:25
    }
	
	String toString() {
		return nombre
	}
}
