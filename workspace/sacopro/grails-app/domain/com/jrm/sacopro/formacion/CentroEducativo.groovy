package com.jrm.sacopro.formacion

import java.util.Date;

class CentroEducativo {
	
	String nombre
	String pais
	String url
	Date dateCreated
	Date lastUpdated
	static hasMany = [estudios: Estudio]
	
    static constraints = {
		nombre(minSize:3, maxSize:200)
		pais(minSize:2, maxSize:100)
		url(nullable:true, url:true)
    }
	
	String toString() {
		return nombre
	}
}
