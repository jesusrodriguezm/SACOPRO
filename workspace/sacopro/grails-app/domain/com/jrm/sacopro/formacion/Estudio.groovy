package com.jrm.sacopro.formacion

import java.util.Date;

import com.jrm.sacopro.colaboradores.Colaborador

class Estudio {
	
	String titulo
	Date fechaInicio
	Date fechaFin
	
	//static hasOne = [colaborador: Colaborador, centro: CentroEducativo, nivel:NivelEstudio]
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [colaborador: Colaborador, centro: CentroEducativo, nivel:NivelEstudio]

    static constraints = {
		nivel(blank:false)
		titulo(minSize:5, mazSize: 200)
		centro(blank:false)
    }
	
	String toString(){
		return titulo + ' - ' + centro
	}
	
}
