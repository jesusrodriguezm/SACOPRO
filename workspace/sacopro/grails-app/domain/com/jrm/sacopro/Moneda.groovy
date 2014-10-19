package com.jrm.sacopro

import com.jrm.sacopro.formacion.Curso;

class Moneda {
	
	String nombre
	String simbolo
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [cursos: Curso]
	
    static constraints = {
		nombre(blank:false, minSize:3, unique: true)
		simbolo(blank:false, minSize:1)
		cursos: display:false
    }
	
	String toString(){
		return nombre
	}
}
