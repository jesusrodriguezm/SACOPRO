package com.jrm.sacopro.empresa

import java.util.Date;

import com.jrm.sacopro.colaboradores.Colaborador;

class Departamento {
	String nombre
	Date dateCreated
	Date lastUpdated
	static hasMany = [colaboradores: Colaborador]

	String toString(){
		return this.nombre
	}
	
    static constraints = {
		nombre(blank:false, unique:true)
    }
}
