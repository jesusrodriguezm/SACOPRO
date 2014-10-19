package com.jrm.sacopro.colaboradores

import java.util.Date;

import com.jrm.sacopro.Usuario;

import com.jrm.sacopro.empresa.BandaNivelPosicion;
import com.jrm.sacopro.empresa.Departamento;
import com.jrm.sacopro.tareas.*
import com.jrm.sacopro.formacion.*
import com.jrm.sacopro.proyectos.*
import com.jrm.sacopro.anuncios.*

class Colaborador extends Usuario {
	
	//String nombreUsuario
	//String password
	
	String primerNombre
	String segundoNombre
	String apellidos	
	String telefono
	//Date fechaIngreso
	String comentarios
	Date fechaNacimiento
	Date dateCreated
	Date lastUpdated
	//static searchable = [only: 'username']
	
	static hasOne = [posicion: BandaNivelPosicion, departamento: Departamento]
	
	static hasMany = [proyectos: ProyectoColaborador, competencias: ColaboradorCompetenciaNivel, 
			estudios: Estudio, cursos: ColaboradorCurso, tareasCreadas: Tarea, tareasEjecutadas: Tarea, 
			comentariosAnuncios: AnuncioComentario, seguido:Colaborador]
		
	static mappedBy = [tareasCreadas:'creador',tareasEjecutadas:'ejecutor']
	
	/*Colaborador() {
		super()
	}*/
	
	String toString(){
		String salida = this.primerNombre
		if (this.segundoNombre != '') {
			salida = salida + ' ' + segundoNombre
		}
		salida = salida + ' ' + apellidos
		return salida
	}
	
    static constraints = {		
		primerNombre(blank:false, maxSize:100)
		segundoNombre(blank:true, maxSize:100)
		apellidos(blank:false, maxSize:200)
		//email(blank:false, email:true, unique:true)
		//fechaIngreso(blank:false)
		fechaNacimiento(blank:true)
		departamento(nullable:true)
		posicion(nullable:true)		
		competencias(nullable:true)
		comentarios(blank: true, maxSize:1000)
		//password(blank:false, password:true)
		tareasCreadas display:false
		tareasEjecutadas display:false
		comentariosAnuncios display:false
		seguido display:false
    }
	
	static mapping = {	
		tablePerHierarchy false
	}
}
