package com.jrm.sacopro.tareas

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured
import com.jrm.sacopro.colaboradores.*


@Secured(["ROLE_USUARIO"])
class TareaController {

	def filterPaneService
	def exportService
	def grailsApplication

	def filter = {
		validarYCargarUsuarioLogueadoEnSession()
		//println params
		if(!params.max) params.max = 10
		def tareaInstanceList = filterPaneService.filter( params, Tarea )
		def listaTareaSalida = new ArrayList<Tarea>()

		for (int i = 0; i<tareaInstanceList.size();i++){
			Tarea tarea = 	tareaInstanceList.getAt(i)
			if (tarea.ejecutor == session.colaboradorLogueado || tarea.creador == session.colaboradorLogueado ){
				listaTareaSalida.add(tarea)
			}
		}

		render( view:'list',
		model:[ tareaInstanceList: listaTareaSalida,
			tareaInstanceTotal: listaTareaSalida.size(),
			filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params),
			params:params ] )
	}


	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService

	def tareaInstanceList = null

	def index() {
		redirect(action: "list", params: params)
	}

	private void validarYCargarUsuarioLogueadoEnSession() {
		//if (session.colaboradorLogueado == null) {
		session.colaboradorLogueado = Colaborador.read (springSecurityService.principal.id)
		//}
	}


	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		//[tareaInstanceList: Tarea.list(params), tareaInstanceTotal: Tarea.count()]
		validarYCargarUsuarioLogueadoEnSession()

		def filterParams = org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params)
		def isFilterApplied = org.grails.plugin.filterpane.FilterPaneUtils.isFilterApplied(params)
		if(isFilterApplied) {
			// filterPane:
			params.sort = params.sort ?: "id"
			params.order = params.order ?: "desc"
			if(params.sort == "attentionFlag") // See ticket #64 in Trac.
				params.sort = "id"
			// Prevent tasks in the trash being returned unless explicitly requested.
			if(!params.filter.op.trash) {
				params.filter.op.trash = "Equal"
				params.filter.trash = "false"
			}
			// Call filterService.
			tareaInstanceList = filterPaneService.filter( params, Tarea )
			//tareaInstanceTotal = tareaInstanceList.count
			filterParams = org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params)
			// Remember search.
			//session.taskSearchFilterParams = new LinkedHashMap(filterParams)
			//session.taskSearchFilter = new LinkedHashMap(params.filter)
			if (params?.format && params.format != "html") {
				response.contentType = grailsApplication.config.grails.mime.types[params.format]
				response.setHeader("Content-disposition", "attachment; filename=tareas.${params.extension}")
				exportService.export(params.format, response.outputStream,tareaInstanceList, [:], [:])
			}
		}	

		if (! isFilterApplied) {
			tareaInstanceList = Tarea.findAllByEjecutorOrCreador(session.colaboradorLogueado, session.colaboradorLogueado)
			if (params?.format && params.format != "html") {
				response.contentType = grailsApplication.config.grails.mime.types[params.format]
				response.setHeader("Content-disposition", "attachment; filename=tareas.${params.extension}")
				exportService.export(params.format, response.outputStream,tareaInstanceList, [:], [:])
			}
		}
			[tareaInstanceList: tareaInstanceList, tareaInstanceTotal: tareaInstanceList.count]
	}

	def listarPorEtiqueta(Integer idEtiqueta) {
		//params.max = Math.min(max ?: 10, 100)

		validarYCargarUsuarioLogueadoEnSession()

		def etTa = EtiquetasTareas.get(params.id)

		def c = Tarea.createCriteria()

		tareaInstanceList = c.list {
			etiquetas { idEq(etTa.id) }
			and {
				or {
					creador {
						idEq(session.colaboradorLogueado.id)
					}

					ejecutor {
						idEq(session.colaboradorLogueado.id)
					}
				}
			}
		}

		[tareaInstanceList: tareaInstanceList, tareaInstanceTotal: tareaInstanceList.count]
	}

	def create() {
		[tareaInstance: new Tarea(params)]
	}

	def save() {
		def tareaInstance = new Tarea(params)

		validarYCargarUsuarioLogueadoEnSession()
		tareaInstance.creador = session.colaboradorLogueado
		tareaInstance.fechaCreacion = new Date()
		tareaInstance.estado = "Abierta"

		if (!tareaInstance.save(flush: true)) {
			render(view: "create", model: [tareaInstance: tareaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'tarea.label', default: 'Tarea'),
			tareaInstance
		])
		redirect(action: "show", id: tareaInstance.id)
	}

	def show(Long id) {
		def tareaInstance = Tarea.get(id)

		if (!tareaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}

		validarYCargarUsuarioLogueadoEnSession()
		if (tareaInstance.creador == session.colaboradorLogueado || tareaInstance.ejecutor == session.colaboradorLogueado) {
			[tareaInstance: tareaInstance]
		} else {
			flash.message = message(code: 'com.jrm.sacopro.tareas.Tarea.accesoDenegado', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}
	}

	def edit(Long id) {
		def tareaInstance = Tarea.get(id)
		if (!tareaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}

		validarYCargarUsuarioLogueadoEnSession()
		if (tareaInstance.creador == session.colaboradorLogueado || tareaInstance.ejecutor == session.colaboradorLogueado) {
			[tareaInstance: tareaInstance]
		} else {
			flash.message = message(code: 'com.jrm.sacopro.tareas.Tarea.accesoDenegado', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}
	}

	def update(Long id, Long version) {
		def tareaInstance = Tarea.get(id)
		if (!tareaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}

		validarYCargarUsuarioLogueadoEnSession()
		if (tareaInstance.creador == session.colaboradorLogueado || tareaInstance.ejecutor == session.colaboradorLogueado) {
			if (version != null) {
				if (tareaInstance.version > version) {
					tareaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
							[
								message(code: 'tarea.label', default: 'Tarea')] as Object[],
							"Another user has updated this Tarea while you were editing")
					render(view: "edit", model: [tareaInstance: tareaInstance])
					return
				}
			}
			tareaInstance.properties = params
			if (tareaInstance.estado == "Finalizada") {
				tareaInstance.fechaFinalizacion = new Date()
			} else {
				tareaInstance.fechaFinalizacion = null
			}
			if (!tareaInstance.save(flush: true)) {
				render(view: "edit", model: [tareaInstance: tareaInstance])
				return
			}
			flash.message = message(code: 'default.updated.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				tareaInstance
			])
			redirect(action: "show", id: tareaInstance.id)
		} else {
			flash.message = message(code: 'com.jrm.sacopro.tareas.Tarea.accesoDenegado', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				tareaInstance
			])
			redirect(action: "list")
			return
		}
	}

	def delete(Long id) {
		def tareaInstance = Tarea.get(id)
		if (!tareaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}

		validarYCargarUsuarioLogueadoEnSession()
		if (tareaInstance.creador == session.colaboradorLogueado || tareaInstance.ejecutor == session.colaboradorLogueado) {
			try {
				tareaInstance.delete(flush: true)
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'tarea.label', default: 'Tarea'),
					tareaInstance
				])
				redirect(action: "list")
			}
			catch (DataIntegrityViolationException e) {
				flash.message = message(code: 'default.not.deleted.message', args: [
					message(code: 'tarea.label', default: 'Tarea'),
					id
				])
				redirect(action: "show", id: id)
			}
		} else {
			flash.message = message(code: 'com.jrm.sacopro.tareas.Tarea.accesoDenegado', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				tareaInstance
			])
			redirect(action: "list")
			return
		}
	}

	def finalizar(Long id) {
		def tareaInstance = Tarea.get(id)
		if (!tareaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}

		validarYCargarUsuarioLogueadoEnSession()
		if (tareaInstance.creador == session.colaboradorLogueado || tareaInstance.ejecutor == session.colaboradorLogueado) {
			if (tareaInstance.estado != "Finalizada") {

				tareaInstance.estado = "Finalizada"
				tareaInstance.fechaFinalizacion = new Date()
				tareaInstance.save(flush: true)
				flash.message = message(code: 'tarea.finalizada.message', args: [
					message(code: 'tarea.label', default: 'Tarea'),
					id
				])
				redirect(action: "list")
			}
			else {
				flash.message = message(code: 'tarea.yafinalizada.message', args: [
					message(code: 'tarea.label', default: 'Tarea'),
					id
				])
				redirect(action: "list")
				return
			}
		} else {
			flash.message = message(code: 'com.jrm.sacopro.tareas.Tarea.accesoDenegado', args: [
				message(code: 'tarea.label', default: 'Tarea'),
				id
			])
			redirect(action: "list")
			return
		}
	}

}
