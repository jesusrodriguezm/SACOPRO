package com.jrm.sacopro

import java.util.Date;

import com.jrm.sacopro.formacion.Curso;

class Proveedor {
	
	String nombre
	String url
	String direccion
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [cursos: Curso]
	
    static constraints = {
		nombre(blank:false, minSize:3, unique:true)
		direccion(blank:true, nullable:true, maxSize:1000)
		url(blank:true, nullable:true, url:true)
    }
	
	String toString(){
		return nombre
	}
}
