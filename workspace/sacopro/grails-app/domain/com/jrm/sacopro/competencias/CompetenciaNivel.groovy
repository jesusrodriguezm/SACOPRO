package com.jrm.sacopro.competencias

import java.util.Date;

import com.jrm.sacopro.colaboradores.ColaboradorCompetenciaNivel;
import com.jrm.sacopro.empresa.BandaNivelPosicionCompetenciaNivel;
import com.jrm.sacopro.empresa.NivelesCompetencias;
import com.jrm.sacopro.formacion.CursoCompetenciaNivel;

class CompetenciaNivel {
	String descripcion
	
	static hasMany = [colaboradores: ColaboradorCompetenciaNivel, posiciones: BandaNivelPosicionCompetenciaNivel, cursos: CursoCompetenciaNivel]
	
	//static hasOne = [competencia: Competencia, nivel: NivelesCompetencias]
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [competencia: Competencia, nivel: NivelesCompetencias]

	String toString(){
		String salida
		if (competencia != null ) {
			salida = competencia
		}
		if (nivel!= null) {
			salida = salida + ' Nivel: ' +  nivel
		}
		return salida.trim()
	}
	
    static constraints = {
		id composite: ['competencia', 'nivel']
		competencia(blank:false)
		nivel(blank:false, unique:['competencia'])
		descripcion (blank:false, widget:"textarea", maxSize:2000)
    }
}
