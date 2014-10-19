package com.jrm.sacopro.formacion

import java.util.Date;


class CursoHorario {
	Date fechaInicio
	Date fechaFin
	String detalleHorario

	//static hasOne = [curso: Curso]
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [curso:Curso]
	
    static constraints = {
		curso()
		fechaInicio(blank:false)
		fechaFin(blank:false)
		detalleHorario(blank:false, widget:"textArea")
    }
	
	String toString() {
		return fechaInicio.toString() + ' / ' + fechaFin.toString() + ' - ' + detalleHorario 
	}
}
