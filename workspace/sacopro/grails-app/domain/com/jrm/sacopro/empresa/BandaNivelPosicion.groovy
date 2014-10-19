package com.jrm.sacopro.empresa

import java.util.Date;

import com.jrm.sacopro.colaboradores.Colaborador;

class BandaNivelPosicion {
	
	Float minSalario
	Float maxSalario
	BandaNivelPosicion encargado
	
	static belongsTo = [banda:BandaProfesional, nivel:NivelProfesional, posicion:Posicion, departamento:Departamento]
	
	static hasMany = [competencias: BandaNivelPosicionCompetenciaNivel, colaborador: Colaborador]

	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		id composite: ['banda', 'nivel','posicion']
		posicion(unique: ['banda','nivel'])
		banda(blank:false)
		nivel(blank:false)
		posicion(blank:false)		
		minSalario(blank:false, min:0F)
		maxSalario(blank:false, min:0F)
		encargado(nullable:true)
    }
	
	String toString(){
		String salida
		if (banda != null) {
			salida = banda
		}
		if (nivel!= null) {
			salida = salida + ' ' + nivel
		}
		if (posicion != null) {
			salida = salida + ' ' + posicion
		}
		return salida.trim()
	}
}
