package com.jrm.sacopro.formacion

import java.util.Date;

class NivelEstudio {
	
	String nombre

	static hasMany = [estudios: Estudio]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		nombre nullable: false, minSize:3, maxSize: 50
    }
	
	String toString() {
		return nombre
	}
	
}
