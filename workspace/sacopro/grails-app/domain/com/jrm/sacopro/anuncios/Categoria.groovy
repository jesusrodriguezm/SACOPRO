package com.jrm.sacopro.anuncios

import java.util.Date;

class Categoria {
	
	String nombre
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [anuncios: Anuncio]

    static constraints = {
		nombre(blank:false, minSize:5, maxSize:25, unique:true)
    }
	
	String toString() {
		return nombre
	}
	
}
