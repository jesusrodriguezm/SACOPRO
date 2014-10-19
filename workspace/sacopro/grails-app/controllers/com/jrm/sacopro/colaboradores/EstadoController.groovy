package com.jrm.sacopro.colaboradores

import grails.plugins.springsecurity.Secured


//@Secured(["ROLE_USUARIO"])
@Secured(["IS_AUTHENTICATED_FULLY"])
class EstadoController {
	int maxResultados = 20
	
	def statusService
	def timelineService
	def springSecurityService

	def index() {
		Colaborador colaborador = Colaborador.get(springSecurityService.currentUser.id)

		if (colaborador != null) {
			timelineService.clearTimelineCacheForUser(colaborador.username)
			if (params.offset == null) {
				params.offset = 0
			}
			def messages = timelineService.getTimelineForUser(colaborador.username)
			[statusMessages: messages, seguidos:colaborador.seguido]
		}
		else {
			redirect(controller: "login", action: "denied")
		}
	}

	def updateStatus(String message) {
		Colaborador colaborador = Colaborador.get(springSecurityService.currentUser.id)

		if (colaborador != null) {
			String salida = ""
			println salida
			salida = statusService.updateStatus message
			println salida
			if (params.offset == null) {
				params.offset = 0
			}
			def messages = timelineService.getTimelineForUser(colaborador.username)
			def content = sacopro.mostrarEstados messages: messages
			if (salida == ""){
				render content
			}
			else {
				render "<div class='alert alert-error'>" + salida + "</div>"
				render content
			}
		}
		else {
			redirect(controller: "login", action: "denied")
		}
	}

	def follow(long id) {
		Colaborador colaborador = Colaborador.get(springSecurityService.currentUser.id)

		if (colaborador != null) {
			println "colaborador a seguir: " + id
			statusService.follow id
			redirect action: 'index'
		}
		else {
			redirect(controller: "login", action: "denied")
		}
	}
	
	def unfollow(long id) {
		Colaborador colaborador = Colaborador.get(springSecurityService.currentUser.id)

		if (colaborador != null) {
			println "colaborador a dejar de seguir: " + id
			statusService.unfollow id
			redirect action: 'index'
		}
		else {
			redirect(controller: "login", action: "denied")
		}
	}

	def buscarSeguir() {
		String cadena = params.cadena
		def listaColaboradores = ColaboradorController.buscarColaboradores(cadena)

		Colaborador colActual = Colaborador.get(springSecurityService.currentUser.id)

		listaColaboradores.removeAll(colActual)
		listaColaboradores.removeAll(colActual.seguido)

		if (listaColaboradores.size() > 0 ) {
			render "<strong>Colaboradores a seguir:</strong>"
			render(template:'../estado/colaboradorResultadoBusqueda', collection:listaColaboradores, var:'colaborador')
		}
		else {
			render "<strong>No quedan colaboradores a los que seguir</strong>"
		}
	}
}
