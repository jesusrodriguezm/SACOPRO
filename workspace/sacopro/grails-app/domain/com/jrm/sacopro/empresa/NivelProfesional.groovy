package com.jrm.sacopro.empresa

import java.util.Date;

class NivelProfesional {

    String nombre
	Date dateCreated
	Date lastUpdated

	static hasMany = [bandaNivelPosicion: BandaNivelPosicion]
	
    static constraints = {
		nombre(blank:false, minSize:1, unique:true)
    }
	
	String toString(){
		return nombre
	}
	
}
