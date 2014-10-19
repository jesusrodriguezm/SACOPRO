package com.jrm.sacopro.competencias

import java.util.Date;

class Competencia {
	
	String nombre
	String descripcion	
	
	static hasOne = [tipo: CompetenciaTipo]
	
	static hasMany = [niveles: CompetenciaNivel]
	
	Date dateCreated
	Date lastUpdated
	
	String toString(){
		return this.nombre + " (" + tipo + ")"
	}
	
    static constraints = {
		nombre(blank:false, unique:true)
		descripcion(blank:false, widget:"textarea", maxSize:2000)
    }
}
