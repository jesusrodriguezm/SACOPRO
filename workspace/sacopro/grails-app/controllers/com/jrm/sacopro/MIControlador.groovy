package com.jrm.sacopro

import grails.plugins.springsecurity.Secured


@Secured(["ROLE_ADMIN", "ROLE_CapitalHumano", "ROLE_Gerencia"])
class MIControlador {
	def scaffold=true
	def index() {
		redirect(action: "list")
	}
}
