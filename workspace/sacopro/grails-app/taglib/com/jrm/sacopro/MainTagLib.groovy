package com.jrm.sacopro

import com.sun.org.apache.xerces.internal.impl.dv.xs.DateDV;

class MainTagLib {
	static namespace = "sacopro"

	/**
	 * @attr date REQUERIDO La fecha a formatear
	 */
	def fechaCorta = { attrs ->
		if (attrs.date != null) {
			out << g.formatDate(date: attrs.date, format: "dd MMM yyyy")
		}
		else {
			out << ""
		}
	}
	
	/**
	 * @attr date REQUERIDO La fecha a formatear
	 */
	def fechaYHora = { attrs ->
		if (attrs.date != null) {
			out << g.formatDate(date: attrs.date, format: "dd MMM yyyy HH:mm:ss")
		}
		else {
			out << ""
		}
	}
	
	/**
	 * @attr date REQUERIDO La fecha a formatear
	 */
	def fechaSoloAno = { attrs ->
		if (attrs.date != null) {
			out << g.formatDate(date: attrs.date, format: "yyyy")
		}
		else {
			out << ""
		}
	}

	/**
	 * @attr date REQUERIDO la fecha tope de la tarea
	 */
	def fechaTope = { attrs ->
		def cssClass = "created"
		if (attrs.date != null) {			
			def today = new Date()
			def dateWithoutTime = attrs.date
			today.clearTime()
			dateWithoutTime.clearTime()

			def diff = dateWithoutTime - today
			if (diff < 0) {
				cssClass = "past"
			}
			else if (diff == 0) {
				cssClass = "today"
			}
			else if (diff < 5) {
				cssClass = "imminent"
			}			
		}
		out << "<span class=\"$cssClass\">" << sacopro.fechaCorta(date: attrs.date) << "</span>"
	}
	
	/**
	 * @attr date REQUERIDO La fecha a formatear
	 */
	def fechaRelativa = { attrs ->
		if (attrs.date != null) {
			def today = new Date()
			
			out << g.formatDate(date: attrs.date, format: "dd MMM yyyy")
		}
		else {
			out << ""
		}
	}

	def textoAParrafo = { attrs, body ->
		out << "<p>" << body().trim().replaceAll(/(\s*\n)+/, "<p></p>") << "</p>"
	}
	
	def mostrarEstados = { attrs ->
		def messages = attrs.messages
		messages.eachWithIndex { message, counter ->
			out << g.render(template: '../estado/statusMessages', model: [statusMessage: message, messageCounter: counter])
		}
	}
}
