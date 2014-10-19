package com.jrm.sacopro.colaboradores

import com.jrm.sacopro.MIControlador;

class ColaboradorController extends MIControlador {
    /*def scaffold=true
    def index() {
        redirect(action: "list")
    }*/
	
	static List buscarColaboradores(String cadena){
		def listaColaboradores // = Colaborador.findAll()
		
		def c = Colaborador.createCriteria()
		
		listaColaboradores = c.list {
			or{
				ilike("username", "%" + cadena + "%")
				ilike("primerNombre", "%" + cadena + "%")
				ilike("segundoNombre", "%" + cadena + "%")
				ilike("apellidos", "%" + cadena + "%")
				ilike("telefono", "%" + cadena + "%")
			}
		}
	}
	
	def buscar() {
		String cadena = params.cadena
		def listaColaboradores = ColaboradorController.buscarColaboradores(cadena)
		render "<strong>Resultado de la busqueda</strong>"
		render(template:'colaboradorResultadoBusqueda', collection:listaColaboradores, var:'colaborador')
	}
	
}
