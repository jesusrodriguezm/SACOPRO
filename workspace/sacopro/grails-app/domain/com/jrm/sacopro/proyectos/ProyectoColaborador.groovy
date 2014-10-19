package com.jrm.sacopro.proyectos

import java.util.Date;

import com.jrm.sacopro.colaboradores.Colaborador

class ProyectoColaborador {

	Date fechaInicio
	Date fechaFin
		
	static hasOne = [proyecto: Proyecto, colaborador: Colaborador, funcion: Funcion]
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		proyecto()
		colaborador()
		funcion()
		fechaInicio()
		fechaFin nullable:true
    }
	
	String toString(){
		String salida
		salida = proyecto
		salida = salida + ' ' + colaborador 
		salida = salida + ' (' + funcion + ')'
		return salida
	}
}
