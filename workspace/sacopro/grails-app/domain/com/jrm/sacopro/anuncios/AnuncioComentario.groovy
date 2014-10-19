package com.jrm.sacopro.anuncios

import java.util.Date;

import com.jrm.sacopro.colaboradores.Colaborador

class AnuncioComentario {
	
	String comentario	
	Date fecha = new Date()
	Date dateCreated
	Date lastUpdated
	
	static hasOne = [colaborador: Colaborador, anuncio:Anuncio]

    static constraints = {
		anuncio editable:false
		colaborador editable:false
		comentario blank:false, minSize:2, maxSize:250
		fecha editable:false				
    }
	
	static mapping = {
		sort fecha: "asc" // or "desc"
	}
	
	String toString() {
		if (comentario.size() > 51 ) {
			return colaborador.toString() + ': ' + comentario.subSequence(0, 50)
		}
		else {
			return colaborador.toString() + ': '  + comentario
		} 		
	}
}
