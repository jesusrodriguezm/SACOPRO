package com.jrm.sacopro.competencias

import java.util.Date;

class CompetenciaTipo {
	
	String nombre
	
	static hasMany = [competencias: Competencia]

	Date dateCreated
	Date lastUpdated
	
	String toString() {
		return nombre
	}
	
    static constraints = {
		nombre(blank:false, minSize:3, unique: true)
    }
}
