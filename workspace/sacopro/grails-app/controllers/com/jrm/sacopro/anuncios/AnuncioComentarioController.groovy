package com.jrm.sacopro.anuncios

import grails.plugins.springsecurity.Secured
import com.jrm.sacopro.colaboradores.Colaborador

@Secured(["ROLE_USUARIO"])
class AnuncioComentarioController {
	// extends MIControlador {

	def scaffold=true

	def springSecurityService

	def index() {
		redirect(action: "list")
	}

	def insertar() {
		AnuncioComentario an = new AnuncioComentario()
		an.comentario = params.nuevoComentario
		//an.fecha = new Date()
		an.colaborador = Colaborador.read (springSecurityService.principal.id)
		an.anuncio =  Anuncio.read(params.anuncioId)

		if (an.colaborador == null){
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Usuario incorrecto</div>")
		}
		else {

			if (!an.validate()){
				render(contentType:'text/plain', text: "<div class='alert alert-error'>Comentario invalido (longitud 2 a 250)</div>")
			}
			else {
				if (an.save(flush: true)) {
					render(contentType:'text/plain', text: "<div class='alert alert-success'>Comentario guardado</div>")
				}
				else {
					render(contentType:'text/plain', text: "<div class='alert alert-error'>Error al guardar el comentario</div>")
				}
			}
		}

	}

}