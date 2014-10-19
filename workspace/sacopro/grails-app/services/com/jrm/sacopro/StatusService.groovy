package com.jrm.sacopro

import grails.plugin.cache.CacheEvict
import grails.plugin.cache.Cacheable
import com.jrm.sacopro.colaboradores.Colaborador
import com.jrm.sacopro.colaboradores.Estado

class StatusService {

	static expose = ['jms']

	def springSecurityService
	
	def timelineService

	void onMessage(newMessageUserName) {
		log.debug "Message received. New status message posted by user <${newMessageUserName}>."
		println "Message received. New status message posted by user <${newMessageUserName}>."
		def following = Colaborador.where { seguido.username == newMessageUserName }.property('username').list()
		following.each { uname ->
			timelineService.clearTimelineCacheForUser(uname)
		}
	}

	String updateStatus(String message) {
		def estado = new Estado(mensaje: message)
		//println estado
		estado.autor = obtenerColaboradorActual()		
		if (estado.validate()){
			estado.save()
			timelineService.clearTimelineCacheForUser(estado.autor.username)
			return ""
		}
		else {
			return "mensaje erroneo"
		}		
	}

	void follow(long personId) {
		def colaborador = Colaborador.get(personId)
		if (colaborador) {
			def currentUser = obtenerColaboradorActual()
			currentUser.addToSeguido(colaborador)

			timelineService.clearTimelineCacheForUser(currentUser.username)
		}
	}

	void unfollow(long personId) {
		def colaborador = Colaborador.get(personId)
		if (colaborador) {
			def currentUser = obtenerColaboradorActual()
			currentUser.removeFromSeguido(colaborador)

			timelineService.clearTimelineCacheForUser(currentUser.username)
		}
	}

	private obtenerColaboradorActual() {
		Colaborador.get(springSecurityService.principal.id)
	}
}
