package com.jrm.sacopro.empresa

import java.util.Date;

import com.jrm.sacopro.competencias.CompetenciaNivel;

class BandaNivelPosicionCompetenciaNivel {

   	//static hasOne = [posicion: BandaNivelPosicion, competenciaNivel: CompetenciaNivel]
	
	static belongsTo = [posicion: BandaNivelPosicion, competenciaNivel: CompetenciaNivel]
		
	Date dateCreated
	Date lastUpdated
	
	String toString(){
		String salida
		if (posicion != null) {
			salida = posicion
		}
		if (competenciaNivel != null) {
			salida = salida + ' Compentencia: ' + competenciaNivel
		}
		return salida.trim()
	}
	
	static constraints = {
		id composite: ['posicion', 'competenciaNivel']
		posicion(blank:false)
		competenciaNivel(blank:false, unique:['posicion'])
	}
}
