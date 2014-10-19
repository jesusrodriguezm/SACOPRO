package com.jrm.sacopro.empresa

import java.util.Date;

class Posicion {
	String nombre
	//Posicion encargado
	String descripcion
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [bandaNivelPosicion: BandaNivelPosicion]
	
	static constraints = {
		nombre(blank:false, unique:true)
		descripcion(blank: false, widget:"textarea", maxSize:1000)
		//encargado(nullable:true)
    }
	
	String toString(){
		return this.nombre
	}
}
