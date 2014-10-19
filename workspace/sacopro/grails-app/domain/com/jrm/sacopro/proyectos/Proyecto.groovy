package com.jrm.sacopro.proyectos

import java.util.Date;

class Proyecto {

	String nombre
	String descripcion
	Date fechaInicio
	Date fechaFin
	
	static hasMany = [tecnologias: Tecnologia, colaboradores: ProyectoColaborador]
	
	static hasOne = [cliente: Cliente]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		nombre blank:false, unique:true, minSize:3, maxSize:100
		descripcion blank:false, minSize:3, maxSize:3000
		fechaInicio blank:false
		fechaFin nullable: true
    }
	
	String toString(){
		return nombre
	}
}
