package com.jrm.sacopro

import com.jrm.sacopro.colaboradores.Colaborador
import com.jrm.sacopro.colaboradores.Estado
import grails.plugin.cache.CacheEvict
import grails.plugin.cache.Cacheable


class TimelineService {

	static transactional = false

	@CacheEvict('timeline')
	void clearTimelineCacheForUser(String username) {

	}

	@Cacheable('timeline')
	def getTimelineForUser(String username) {
		def per = Colaborador.findByUsername(username)

		def query = Estado.whereAny {
			autor { username == per.username }
			if(per.seguido) autor in per.seguido
		}.order 'dateCreated', 'desc'

		def messages = query.list(max: 100)
		messages
	}
}
