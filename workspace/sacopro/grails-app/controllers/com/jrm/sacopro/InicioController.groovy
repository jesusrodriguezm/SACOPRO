package com.jrm.sacopro

import grails.plugins.springsecurity.Secured

import com.jrm.sacopro.tareas.*
import com.jrm.sacopro.anuncios.*
import com.jrm.sacopro.colaboradores.*
import com.jrm.sacopro.competencias.Competencia
import com.jrm.sacopro.competencias.CompetenciaNivel
import com.jrm.sacopro.competencias.CompetenciaNivelController;
import com.jrm.sacopro.proyectos.*
import com.jrm.sacopro.empresa.*

@Secured(["ROLE_USUARIO"])
class InicioController {

	def springSecurityService

	def index() {
		def colaborador = Colaborador.read (springSecurityService.principal.id)
		session.colaboradorLogueado = colaborador


		def tareas = Tarea.findAllByEstadoAndEjecutor("Abierta", colaborador,[sort:"fechaTope", order:"asc"])

		def etiquetas = EtiquetasTareas.list(sort:"nombre", order:"asc")
		Date fecha = new Date()
		fecha = fecha - 1
		
		def anuncios = Anuncio.findAllByFechaExpiracionGreaterThanEquals(fecha)
		def usuarios = Usuario.findAllByUsernameNotEqual (springSecurityService.principal.username)
		def proyectos = ProyectoColaborador.findAllByColaborador(colaborador)

		session.usuariosSuplantar = usuarios

		return [tareas: tareas, etiquetas: etiquetas, anuncios: anuncios, proyectos: proyectos] //, usuarios: usuarios]
	}

	def miInformacion(){
		//def colaborador = Colaborador.read (springSecurityService.principal.id)
		//session.colaboradorLogueado = colaborador

		if (session.colaboradorLogueado != null) {
			if (!session.colaboradorLogueado.isAttached()) {
				session.colaboradorLogueado.attach()
			}

			def competencias = ColaboradorCompetenciaNivel.findAllByColaborador(session.colaboradorLogueado, [sort:"competencia" , order:"asc"])

			def competenciasPosicion = BandaNivelPosicionCompetenciaNivel.findAllByPosicion(session.colaboradorLogueado.posicion, [sort:"competenciaNivel" , order:"asc"])

			def posiciones = BandaNivelPosicion.findAll()

			return [colaborador:session.colaboradorLogueado, competencias:competencias, competenciasPosicion: competenciasPosicion, posiciones:posiciones] //, usuarios: usuarios]
		}
		else {
			redirect(controller: "login", action: "denied")
		}
	}

	def empresa() {
		def bandasLista = BandaProfesional.findAll()
		def nivelesProfesionales = NivelProfesional.findAll ()
		def colaboradores = Colaborador.findAll ()
		def competenciaNivel = CompetenciaNivel.findAll ()
		def bandas = BandaNivelPosicion.getAll()
		def competencias = Competencia.getAll()
		return [bandas:bandas, bandasLista: bandasLista, nivelesLista:nivelesProfesionales, colaboradores:colaboradores, competenciaNivel:competenciaNivel, competencias:competencias]
	}

	@Secured([
		"ROLE_ADMIN",
		"ROLE_CapitalHumano",
		"ROLE_Gerencia"
	])
	def analisis() {
		def colaboradores = Colaborador.findAll()
		
		//def posiciones1 = BandaNivelPosicion.findAll()
		//println posiciones1.size
		
		//def posiciones2 = BandaNivelPosicion.findAllByCompetenciasIsNotNull()
		//println posiciones2.size
		
		def query = BandaNivelPosicion.where {
			competencias.id != null
		 }
		
		def posiciones = query.list()
		//println posiciones.size
		return [colaboradores:colaboradores, posiciones:posiciones]
	}

	@Secured(["ROLE_USUARIO"])
	def analisisColaboradorPosicion () {
		String salida = ""

		if (params.colaborador == "") {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe seleccionar un colaborador</div>")
			return
		}

		if (params.posicion == "") {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe seleccionar un colaborador</div>")
			return
		}
		Colaborador colaborador = Colaborador.get(params.colaborador)
		BandaNivelPosicion posicion = BandaNivelPosicion.get(params.posicion)

		salida = AnalisisCompetenciasPosicionService.analisisColaboradorPosicionColaborador (Colaborador.get(params.colaborador), BandaNivelPosicion.get(params.posicion))

		render(contentType:'text/plain', text: salida)
	}

	@Secured([
		"ROLE_ADMIN",
		"ROLE_CapitalHumano",
		"ROLE_Gerencia"
	])
	def analisisColaboradoresPosicion () {
		String salida = ""

		if (params.colaborador == null) {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe seleccionar un colaborador</div>")
			return
		}

		if (params.posicion == "") {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe seleccionar un colaborador</div>")
			return
		}

		ArrayList<Colaborador> colaboradores = new ArrayList<Colaborador>()
		for (int i=0; i<params.colaborador.size();i++){
			colaboradores.add(Colaborador.get(params.colaborador.getAt(i)))			
		}
		
		BandaNivelPosicion posicion = BandaNivelPosicion.get(params.posicion)

		salida = AnalisisCompetenciasPosicionService.analisisColaboradoresPosicion(colaboradores, posicion)

		render(contentType:'text/plain', text: salida)
	}

	@Secured(["ROLE_ADMIN"])
	def adminOnly() {  }
}
