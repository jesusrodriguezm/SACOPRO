package com.jrm.sacopro.tareas

import java.util.Date;

import com.jrm.sacopro.colaboradores.*


class Tarea {
	
	String nombre
	String descripcion
	Date fechaCreacion = new Date()
	Date fechaTope = new Date() + 7
	String prioridad
	String estado = "Abierta"
	Long tiempoUtilizado = 0L
	String comentariosResolucion
	Date fechaFinalizacion 
	
	static hasOne = [ejecutor: Colaborador, creador: Colaborador]
	
	static hasMany = [etiquetas: EtiquetasTareas]
	
	Date dateCreated
	Date lastUpdated
	
	//def springSecurityService

    static constraints = {
		prioridad blank:false, inList:["Proxima Accion","Accion","Algun dia"]
		nombre(blank:false)
		estado blank:false, inList:["Abierta", "Finalizada"]	
		descripcion(blank:false, maxSize:1000) //, widget:"textArea")
		fechaTope(nullable:true)
		tiempoUtilizado min:0L
		comentariosResolucion nullable:true, maxSize:1000
		fechaFinalizacion nullable:true
		//colaborador defaultValue: springSecurityService.currentUser
		//colaborador editable: false
    }
	
	String toString(){
		return nombre
	}
}
