package com.jrm.sacopro.colaboradores

import java.util.Date;

import com.jrm.sacopro.competencias.CompetenciaNivel;

class ColaboradorCompetenciaNivel {

	static belongsTo = [colaborador: Colaborador, competencia: CompetenciaNivel]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		id composite: ['colaborador', 'competencia']
		colaborador(unique:['competencia'])
    }
	
	String toString(){
		return colaborador.toString()  + ' ' + competencia
	}
}
