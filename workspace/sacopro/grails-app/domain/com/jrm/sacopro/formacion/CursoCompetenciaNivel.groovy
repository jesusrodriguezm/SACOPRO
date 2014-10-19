package com.jrm.sacopro.formacion

import java.util.Date;

import com.jrm.sacopro.competencias.CompetenciaNivel;

class CursoCompetenciaNivel {

    //static hasOne = [curso: Curso, competenciaNivel: CompetenciaNivel]
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [curso: Curso, competenciaNivel: CompetenciaNivel]
		
	String toString(){
		String salida
		if (curso != null) {
			salida = curso
		}
		if (competenciaNivel != null) {
			salida = salida + ' Competencia: ' + competenciaNivel
		}
		return salida.trim()
	}
	
    static constraints = {
		id composite: ['curso', 'competenciaNivel']
		curso(blank:false)
		competenciaNivel(blank:false, unique:['curso'])
    }
}
