package com.jrm.sacopro.colaboradores

import java.util.Date;

class ColaboradorCursoEstado {

    String nombre
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [colaboradorCurso: ColaboradorCurso]
	
	String toString(){
		return this.nombre
	}
	
    static constraints = {
		nombre(blank:false)
    }
}
