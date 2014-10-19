package com.jrm.sacopro.competencias

import com.jrm.sacopro.MIControlador;

class CompetenciaNivelController extends MIControlador {
    /*def scaffold=true
    def index() {
        redirect(action: "list")
    }*/
	
	def buscar() {
		String cadena = params.cadena
		
		List<CompetenciaNivel> listaSalida = new ArrayList<CompetenciaNivel>()
		
		def cc = Competencia.createCriteria()
		List<Competencia> listaCompetencias = cc.list{
			or {
				ilike("nombre", "%" + cadena + "%")
			}
		}
				
		def listaCompetenciasNivel		
		for (int i=0; i < listaCompetencias.size(); i++) {
			Competencia c = listaCompetencias.get(i)			
			listaCompetenciasNivel = CompetenciaNivel.findAllByCompetencia(c)
						
			for (int j=0; j<listaCompetenciasNivel.size(); j++){				
				CompetenciaNivel cn = listaCompetenciasNivel.get(j)
				listaSalida.add(cn)
			}
						
		}
		
		render "<strong>Resultado de la busqueda</strong>"	
		render(template:'competenciaResultadoBusqueda', collection:listaSalida, var:'competencia')
	}
}