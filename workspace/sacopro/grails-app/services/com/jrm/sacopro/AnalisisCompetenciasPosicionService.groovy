package com.jrm.sacopro

import java.util.List;

import com.jrm.sacopro.colaboradores.Colaborador
import com.jrm.sacopro.colaboradores.ColaboradorCompetenciaNivel
import com.jrm.sacopro.competencias.Competencia;
import com.jrm.sacopro.competencias.CompetenciaNivel
import com.jrm.sacopro.empresa.BandaNivelPosicion
import com.jrm.sacopro.empresa.BandaNivelPosicionCompetenciaNivel
import com.jrm.sacopro.empresa.NivelesCompetencias;

class AnalisisCompetenciasPosicionService {

	static String analisisColaboradorPosicionColaborador(Colaborador colaborador, BandaNivelPosicion posicion){
		String salida = ""
		try {
			salida = salida.concat("<h1>")
			salida = salida.concat("Colaborador: ")
			salida = salida.concat(colaborador.toString())
			salida = salida.concat(" - Posicion: ")
			salida = salida.concat(posicion.toString())
			salida = salida.concat ("</h1>")

			List<ColaboradorCompetenciaNivel> competenciasColaborador = ColaboradorCompetenciaNivel.findAllByColaborador(colaborador, [sort:"competencia" , order:"asc"])
			List<BandaNivelPosicionCompetenciaNivel> competenciasPosicion = BandaNivelPosicionCompetenciaNivel.findAllByPosicion(posicion, [sort:"competenciaNivel" , order:"asc"])
			List<CompetenciaNivel> competenciasYaTratadas = new ArrayList<CompetenciaNivel>()

			salida = salida.concat("<strong>Posicion actual: </strong>")
			salida = salida.concat(colaborador.posicion.toString())
			int total = 0

			salida = salida.concat("<table class='table table-condensed table-bordered'>")
			salida = salida.concat("<thead><th>Competencia</th><th><p class='text-center'>" + colaborador + "</p></th></thead>")

			for (int i=0; i < competenciasColaborador.size() ; i++){
				ColaboradorCompetenciaNivel cn = competenciasColaborador.get(i)

				if (exisePosicionEnLista(competenciasPosicion,cn.competencia)) {
					salida = salida.concat("<tr class='alert alert-success'>")
					salida = salida.concat("<td>")
					salida = salida.concat(cn.competencia.toString())
					salida = salida.concat("</td>")
					salida = salida.concat("<td><p class='text-center'><i class='icon-ok-sign'></i></p></td>")
					salida = salida.concat("</tr>")
					total++
				}
				else {
					int res = 0
					res = analisisNivel(competenciasPosicion, cn.competencia.competencia, cn.competencia.nivel, competenciasYaTratadas)
					if (res < 0) {
						salida = salida.concat("<tr class='alert alert-block'>")
						salida = salida.concat("<td>")
						salida = salida.concat(cn.competencia.toString())
						salida = salida.concat("</td>")
						salida = salida.concat("<td><p class='text-center'><i class='icon-minus-sign'></i></p></td>")
						salida = salida.concat("</tr>")
					}
					else {
						if (res > 0) {
							salida = salida.concat("<tr class='alert alert-success'>")
							salida = salida.concat("<td>")
							salida = salida.concat(cn.competencia.toString())
							salida = salida.concat("</td>")
							salida = salida.concat("<td><p class='text-center'><i class='icon-plus-sign'></i></p></td>")
							salida = salida.concat("</tr>")
							total++
						}
						else {
							salida = salida.concat("<tr class='alert alert-info'>")
							salida = salida.concat("<td>")
							salida = salida.concat(cn.competencia.toString())
							salida = salida.concat("</td>")
							salida = salida.concat("<td><p class='text-center'><i class='icon-info-sign'></i></p></td>")
							salida = salida.concat("</tr>")
						}
					}
				}
				competenciasYaTratadas.add(cn.competencia)
			}

			for (int i=0; i < competenciasPosicion.size() ; i++){
				BandaNivelPosicionCompetenciaNivel cn = competenciasPosicion.get(i)

				if (! competenciasYaTratadas.contains(cn.competenciaNivel)) {
					salida = salida.concat("<tr class='alert alert-error'>")
					salida = salida.concat("<td>")
					salida = salida.concat(cn.competenciaNivel.toString())
					salida = salida.concat("</td>")
					salida = salida.concat("<td><p class='text-center'><i class='icon-remove-circle'></i></p></td>")
					salida = salida.concat("</tr>")
					total--
				}
			}
			salida = salida.concat("<tr><td><strong>Total</strong></td><td><p class='text-center'><strong>" + total.toString() + "</strong></p></td></tr>")

			salida = salida.concat("</table>")
		} catch (Exception e) {
			salida = "<BR><sacopro:textoAParrafo>"
			salida = salida.concat(e.toString())
			salida = salida.concat("</sacopro:textoAParrafo>")
		}
	}

	static private int analisisNivel (List<BandaNivelPosicionCompetenciaNivel> lista, Competencia cn, NivelesCompetencias nc, List<CompetenciaNivel> competenciasYaTratadas){
		for (int i=0; i < lista.size() ; i++){
			if (lista.get(i).competenciaNivel.competencia.id == cn.id) {
				if (lista.get(i).competenciaNivel.nivel.nombre  < nc.toString()) {
					competenciasYaTratadas.add(lista.get(i).competenciaNivel)
					return -1
				}
				else {
					if (lista.get(i).competenciaNivel.nivel.nombre  > nc.toString()) {
						competenciasYaTratadas.add(lista.get(i).competenciaNivel)
						return 1
					}
				}
			}
		}
		return 0
	}

	static private boolean exisePosicionEnLista(List<BandaNivelPosicionCompetenciaNivel> lista, CompetenciaNivel cn){
		for (int i=0; i < lista.size() ; i++){
			if (lista.get(i).competenciaNivel == cn) {
				return true
			}
		}
		return false
	}

	static String analisisColaboradoresPosicion(ArrayList<Colaborador> colaboradores, BandaNivelPosicion posicion){
		String salida=""
		ArrayList<Integer> resultados = new ArrayList<Integer>()
		for (int i=0; i<colaboradores.size();i++){			
			resultados.add(0)
		}
		
		try{
			List<BandaNivelPosicionCompetenciaNivel> competenciasPosicion = BandaNivelPosicionCompetenciaNivel.findAllByPosicion(posicion, [sort:"competenciaNivel" , order:"asc"])
			salida = salida.concat("<br>")
			salida = salida.concat("<h4>Resultado:</h4>")
			salida = salida.concat("<br>")
			salida = salida.concat("<table class='table table-condensed table-bordered'>")
			salida = salida.concat("<thead><th>Competencias Posicion</th>")
			for (int i = 0; i< colaboradores.size(); i++ ){
				salida = salida.concat("<th><p class='text-center'>" + colaboradores.getAt(i) + "</p></th>")
			}
			salida = salida.concat("</thead>")

			for (int i = 0; i< competenciasPosicion.size();i++){
				CompetenciaNivel compentenciaNivelPosicion = competenciasPosicion.getAt(i).competenciaNivel
				salida = salida.concat("<tr>")
				salida = salida.concat("<td> " + compentenciaNivelPosicion + " </td>")
				for (int j=0; j<colaboradores.size();j++){
					Colaborador c = colaboradores.getAt(j)
					ColaboradorCompetenciaNivel competenciaNivelColaborador = ColaboradorCompetenciaNivel.findByCompetenciaAndColaborador(compentenciaNivelPosicion,c)
					if (competenciaNivelColaborador != null) {
						salida = salida.concat("<td class='alert alert-success'><p class='text-center'><i class='icon-ok-sign'></i></p>")
						resultados.set(j, resultados.getAt(j) + 1)
					}
					else {
						ArrayList<ColaboradorCompetenciaNivel> listaCompetenciasColaborador = ColaboradorCompetenciaNivel.findAllByColaborador(c)
						boolean encontrada = false
						for (int l = 0; l<listaCompetenciasColaborador.size(); l++){
							CompetenciaNivel cnColaborador = listaCompetenciasColaborador.getAt(l).competencia
							if (cnColaborador.competencia == compentenciaNivelPosicion.competencia){
								if (cnColaborador.nivel.nombre < compentenciaNivelPosicion.nivel.nombre){
									salida = salida.concat("<td class='alert alert-success'><p class='text-center'><i class='icon-plus-sign'></i></p>")
									resultados.set(j, resultados.getAt(j) + 1)
									encontrada = true
									l = listaCompetenciasColaborador.size()
								}
								else {
									salida = salida.concat("<td class='alert alert-block'><p class='text-center'><i class='icon-minus-sign'></i></p>")
									resultados.set(j, resultados.getAt(j) + 0)
									encontrada = true
									l = listaCompetenciasColaborador.size()
								}
							}
						}
						if (!encontrada) {
							salida = salida.concat("<td class='alert alert-error'><p class='text-center'><i class='icon-remove-circle'></i></p>")
							resultados.set(j, resultados.getAt(j) - 1)
						}
					}
					salida = salida.concat("</td>")
				}

				salida = salida.concat("</tr>")
			}

			salida = salida.concat("<tr>")
			salida = salida.concat("<td><strong> Total</strong></td>")
			for (int i = 0; i < resultados.size(); i++){
				salida = salida.concat("<td><p class='text-center'><strong>"+ resultados.getAt(i) + "</strong></p></td>")
			}
			salida = salida.concat("</tr>")

			salida = salida.concat("</table>")
		} catch (Exception e) {
			salida = "<BR><sacopro:textoAParrafo>"
			salida = salida.concat(e.toString())
			salida = salida.concat("</sacopro:textoAParrafo>")
		}
	}
}
