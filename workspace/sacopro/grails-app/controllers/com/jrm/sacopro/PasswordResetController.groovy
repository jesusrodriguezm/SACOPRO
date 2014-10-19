package com.jrm.sacopro

import grails.plugins.springsecurity.ui.ResetPasswordCommand
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_USUARIO"])
class PasswordResetController {

	def saltSource
	
	def springSecurityService
	def springSecurityUiService
	
	def index() {
		
	}
	
	def passwordReset = {ResetPasswordCommand command ->
		//render(contentType:'text/plain', text: command)
		//render(contentType:'text/plain', text: params)	
		
		if (params.password == "") {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe digitar la password</div>")
			return
		}
		
		if (params.password2 == "") {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>Debe digitar la password de nuevo</div>")
			return
		}
		
		if (params.password != params.password2) {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>La password debe coincidir</div>")
			return
		}
				
		//flash.error = 'prueba'		
		String token = params.t
		
		
		def usuario = Usuario.read (springSecurityService.principal.id)
		
		//def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
		def registrationCode = new RegistrationCode(username: usuario.username)			

		//def registrationCode = token ? RegistrationCode.findByToken(token) : null
		if (!registrationCode) {
			//flash.error = message(code: 'spring.security.ui.resetPassword.badCode')
			render(contentType:'text/plain', text: "<div class='alert alert-error'>" + message(code: 'spring.security.ui.resetPassword.badCode') + "</div>")
			//redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
			return
		}

		if (!request.post) {
			return [token: token, command: new ResetPasswordCommand()]
		}

		command.username = registrationCode.username
		//render(contentType:'text/plain', text: '1----' + command.constraints + '-----1')	
		
		command.validate()

		if (command.hasErrors()) {
			render(contentType:'text/plain', text: "<div class='alert alert-error'>El formato de la password no es correcta. Debe aumentar su seguridad.</div>")
			return [token: token, command: command]
		}

		String salt = saltSource instanceof NullSaltSource ? null : registrationCode.username
		RegistrationCode.withTransaction { status ->
			def user = Usuario.findByUsername(registrationCode.username)
			user.password = springSecurityUiService.encodePassword(command.password, salt)
			user.save()
			registrationCode.delete()
		}

		springSecurityService.reauthenticate registrationCode.username

		//flash.message = message(code: 'spring.security.ui.resetPassword.success')
		render(contentType:'text/plain', text: "<div class='alert alert-success>" +  message(code: 'spring.security.ui.resetPassword.success') + "</div>")
		render(contentType:'text/plain', text: "<div class='alert alert-success>" +  message(code: 'spring.security.ui.resetPassword.success') + "</div>")
		//def conf = SpringSecurityUtils.securityConfig
		//String postResetUrl = conf.ui.register.postResetUrl ?: conf.successHandler.defaultTargetUrl
		//redirect uri: postResetUrl
	}
}
