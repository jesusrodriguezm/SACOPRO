package com.jrm.sacopro.anuncios

//import com.jrm.sacopro.MIControlador

import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN", "ROLE_CapitalHumano", "ROLE_Gerencia", "ROLE_Anuncios"])
class AnuncioController {// extends MIControlador {
    def scaffold=true
	def index() {
		redirect(action: "list")
	}
}
