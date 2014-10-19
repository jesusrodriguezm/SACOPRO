package com.jrm.sacopro.anuncios

import java.util.Date;

class Etiqueta {
	
	String nombre
	Date dateCreated
	Date lastUpdated
	
	static hasMany =[anuncios: Anuncio]
	
	static belongsTo = [Anuncio]

    static constraints = {
		nombre(blank:false, minSize: 3, maxSize:25, unique:true)
    }
	
	String toString(){
		return nombre
	}
}
