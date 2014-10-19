package com.jrm.sacopro.formacion

import java.util.Date;

import com.jrm.sacopro.Moneda;
import com.jrm.sacopro.Proveedor;
import com.jrm.sacopro.colaboradores.ColaboradorCurso;

class Curso {

	String nombre
	String descripcion
	Integer duracion
	String tipo //online, presencial..
	Float costo
	Boolean certificacion 
	String url
	String observacion
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [proveedor: Proveedor, moneda: Moneda]
	
	static hasMany = [competencias: CursoCompetenciaNivel, colaborador: ColaboradorCurso, convocatorias: CursoHorario]
	
	//static belongsTo = [ColaboradorCurso]
	
	String toString(){
		return this.nombre
	}
	
    static constraints = {
		nombre(blank:false)
		tipo(blank:false, inList:["Online", "Presencial", "Mixto"])
		descripcion(blank:false, widget:"textarea")
		duracion(blank:false, min:1)
		costo(blank:false, min:0F)
		certificacion nullable:true
		url(blank:true, nullable:true, url:true)
		observacion(blank:true, nullable:true, widget:"textArea")
    }
}
