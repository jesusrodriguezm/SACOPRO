package com.jrm.sacopro.colaboradores

import java.util.Date;

import com.jrm.sacopro.formacion.*;

class ColaboradorCurso {

	static hasOne = [colaborador: Colaborador, curso: Curso, estado: ColaboradorCursoEstado]
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [colaborador: Colaborador, curso: Curso]
		
	String toString(){
		String salida
		if (curso != null) {
			salida = curso
		}
		if (colaborador != null) {
			salida = salida + ' ' + colaborador
		}
		if (estado != null) {
			salida = salida +  ' Estado: ' + estado
		}
		return salida.trim()
	}
	
	static constraints = {
		id composite: ['curso', 'colaborador']
		curso(blank:false, unique:['colaborador'])
		colaborador(blank:false)
		estado(blank:false)
	}
}
