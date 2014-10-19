package com.jrm.sacopro.colaboradores

import java.util.Date;

class Estado {

	String mensaje
	Colaborador autor
	Date dateCreated	

	transient jmsService
	
	transient afterInsert = {
		jmsService.send 'grailstwitter.status', autor.username
	}
	
    static constraints = {
		mensaje blank:false, nullable:false, minSize:1, maxSize:140
    }
	
	String toString(){
		return mensaje
	}
	
}
