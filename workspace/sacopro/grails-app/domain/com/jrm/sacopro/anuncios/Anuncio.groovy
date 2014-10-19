package com.jrm.sacopro.anuncios

import java.util.Date;

class Anuncio {
	
	String titulo
	String mensaje
	Date fechaPublicacion
	Date fechaExpiracion
	Date dateCreated
	Date lastUpdated
	
	static hasOne = [categoria: Categoria]
	static hasMany = [etiquetas: Etiqueta, comentarios: AnuncioComentario]
	
    static constraints = {
		titulo(blank:false, minSize:5, maxSize:100)
		categoria()		
		mensaje(blank:false, minSize:5, maxSize:2000)		
		fechaPublicacion()
		etiquetas()
		fechaExpiracion()
    }
	
	String toString(){
		return titulo
	}
}
