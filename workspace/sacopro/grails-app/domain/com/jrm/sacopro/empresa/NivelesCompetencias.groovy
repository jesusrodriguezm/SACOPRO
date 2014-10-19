package com.jrm.sacopro.empresa

import java.util.Date;

import com.jrm.sacopro.competencias.CompetenciaNivel;

class NivelesCompetencias {
	String nombre
	String descripcion
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [competencias: CompetenciaNivel]

	String toString(){
		return this.nombre
	}
	
    static constraints = {
		nombre(blank:false, unique:true, maxSize:1)
		descripcion(blank:false, widget:"textarea", maxSize:1000)
    }
}
