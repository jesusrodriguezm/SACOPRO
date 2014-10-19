package com.jrm.sacopro.empresa

import java.util.Date;

class BandaProfesional {
	
	String nombre

	static hasMany = [bandaNivelPosicion: BandaNivelPosicion]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		nombre(blank:false, minSize:1, unique:true)
    }
	
	String toString(){
		return nombre
	}
}
