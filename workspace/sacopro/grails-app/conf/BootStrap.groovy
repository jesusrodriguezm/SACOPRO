	import com.jrm.sacopro.*
import com.jrm.sacopro.anuncios.Anuncio
import com.jrm.sacopro.anuncios.AnuncioComentario
import com.jrm.sacopro.anuncios.Categoria
import com.jrm.sacopro.anuncios.Etiqueta
import com.jrm.sacopro.colaboradores.Colaborador;
import com.jrm.sacopro.colaboradores.ColaboradorCompetenciaNivel;
import com.jrm.sacopro.colaboradores.ColaboradorCurso;
import com.jrm.sacopro.colaboradores.ColaboradorCursoEstado;
import com.jrm.sacopro.competencias.Competencia;
import com.jrm.sacopro.competencias.CompetenciaNivel;
import com.jrm.sacopro.competencias.CompetenciaTipo;
import com.jrm.sacopro.empresa.BandaNivelPosicion;
import com.jrm.sacopro.empresa.BandaNivelPosicionCompetenciaNivel;
import com.jrm.sacopro.empresa.BandaProfesional;
import com.jrm.sacopro.empresa.Departamento;
import com.jrm.sacopro.empresa.NivelProfesional;
import com.jrm.sacopro.empresa.NivelesCompetencias;
import com.jrm.sacopro.empresa.Posicion;
import com.jrm.sacopro.formacion.CentroEducativo;
import com.jrm.sacopro.formacion.Curso;
import com.jrm.sacopro.formacion.CursoCompetenciaNivel;
import com.jrm.sacopro.formacion.CursoHorario;
import com.jrm.sacopro.formacion.Estudio
import com.jrm.sacopro.formacion.NivelEstudio
import com.jrm.sacopro.proyectos.Cliente
import com.jrm.sacopro.proyectos.Funcion
import com.jrm.sacopro.proyectos.Proyecto
import com.jrm.sacopro.proyectos.ProyectoColaborador
import com.jrm.sacopro.proyectos.Tecnologia
import com.jrm.sacopro.tareas.EtiquetasTareas
import com.jrm.sacopro.tareas.Tarea

import grails.util.Environment

class BootStrap {

	def init = { servletContext ->
		switch (Environment.current) {
			case Environment.DEVELOPMENT:
				crearDatosIniciales()
				break;
			case Environment.PRODUCTION:
				println "No special config or Bootstrapping required for the Production version..."
				break;
		}
	}
	def destroy = {
	}

	void crearDatosIniciales(){
		println "Creando datos inciales."
		String loreIpsumCorto ="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
		String loreIpsum1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nunc eu enim sodales vulputate in sit amet ligula. In hac habitasse platea dictumst. Aenean porttitor, erat at lobortis posuere, leo diam pretium eros, nec hendrerit risus lacus id nisi. Pellentesque sodales luctus sem eu mattis. In hac habitasse platea dictumst. Nunc eu blandit libero, in elementum dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque nec orci sodales, tristique erat ac, euismod orci. Duis erat est, pellentesque ac est vel, varius auctor elit. Sed rhoncus condimentum neque quis ornare. "
		String loreIpsum2 = "Cras sem diam, elementum ut fermentum vitae, lobortis vitae nunc. Pellentesque consequat venenatis libero, non interdum elit dignissim nec. Pellentesque sodales libero ornare semper mattis. Sed convallis porttitor dignissim. Pellentesque lobortis enim sed urna pretium mattis. Morbi ut suscipit eros. Nunc enim neque, pulvinar dictum justo eget, convallis pretium quam. Fusce at scelerisque erat, nec sollicitudin tellus. Nullam eget purus diam. Ut lobortis dignissim est, ac tincidunt massa sodales eget. Phasellus vestibulum rutrum lectus. Proin id enim in nisl vehicula mattis sed eu elit. Vestibulum blandit ligula quis nunc egestas pretium. Curabitur volutpat tempus odio, ut tristique sapien adipiscing vitae. "
		String loreIpsum3 = "Aenean eleifend felis a magna gravida iaculis. Mauris pellentesque nunc ipsum, et ullamcorper justo porta vitae. Etiam nec rhoncus libero. Aliquam ultrices tellus nec enim malesuada aliquet. Cras eget diam ultrices sapien consequat consectetur. Integer mollis, mi a molestie sodales, elit augue rhoncus mauris, vitae sagittis orci augue vitae enim. In laoreet hendrerit quam vel fermentum. Suspendisse potenti. Aenean ac lacus ultricies neque dignissim venenatis vitae ac ipsum. Morbi aliquam commodo sapien sit amet gravida"
		
		println "Creando monedas."
		Moneda mon1 = new Moneda(nombre:"Colones", simbolo:"C").save(failOnError:true)
		Moneda mon2 = new Moneda(nombre:"Dólares", simbolo:'$').save(failOnError:true)
		Moneda mon3 = new Moneda(nombre:"Euros", simbolo:'€').save(failOnError:true)
				
		println "Creando tipos de competencia."
		CompetenciaTipo competenciaTipoPersonal = new CompetenciaTipo(nombre:"Personal").save(failOnError:true)
		CompetenciaTipo competenciaTipoTecnica = new CompetenciaTipo(nombre:"Técnica").save(failOnError:true)
		CompetenciaTipo competenciaTipoGerencial = new CompetenciaTipo(nombre:"Gerencial").save(failOnError:true)
		
				println "Creando departamentos."
		Departamento deptDesarrolloNegocios = new Departamento(nombre:"Desarrollo de Negocios").save(failOnError:true)
		Departamento deptPotencialHumano = new Departamento(nombre:"Potencial Humano").save(failOnError:true)
		Departamento deptGerencia = new Departamento(nombre:"Gerencia").save(failOnError:true)
		Departamento deptConsultoria = new Departamento(nombre:"Consultoría").save(failOnError:true)
		Departamento deptFinanciero = new Departamento(nombre:"Financiero").save(failOnError:true)
		
		println "Creando posiciones."
		Posicion posicionTelemercadeo = new Posicion(nombre: "Telemercadeo", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionBackOffice = new Posicion(nombre: "Back Office", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionAnalistaGestionPotenciaHumano = new Posicion(nombre: "Analista de Gestión de Potencial Humano", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionAsistenteGerencia = new Posicion(nombre: "Asistente de Gerencia", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionHelpDesk = new Posicion(nombre: "Help Desk", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionEspecialistaTecnico = new Posicion(nombre: "Especialista Técnico", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionAuxiliarAdministrativo = new Posicion(nombre: "Auxiliar administrativo", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionMensajero = new Posicion(nombre: "Mensajero", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionLicitaciones = new Posicion(nombre: "Licitaciones", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionEspecialistaCompetencias = new Posicion(nombre: "Especialista en Competencia", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionDesarrolladorNegociosJr = new Posicion(nombre: "Desarrollador de Negocios Jr.", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionMercadeo = new Posicion(nombre: "Mercadeo", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionConsultorJr = new Posicion(nombre: "Consultor Junior", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionAsistenteFinanciero = new Posicion(nombre: "Asistente Financiero", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionDesarrolladorNegociosSr = new Posicion(nombre: "Desarrollador Negocios Sr", descripcion:loreIpsumCorto).save(failOnError:true)	
		Posicion posicionExpertoLicitaciones = new Posicion(nombre: "Experto Licitaciones", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionEspecialistaMercadeo = new Posicion(nombre: "Especialista Mercadeo", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionEspecialistaGestionPotencialHumano = new Posicion(nombre: "Especialista en Gestión de Potencial Humano", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionConsultroSenior = new Posicion(nombre: "Consultor Senior", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionAnalistaFinanciero = new Posicion(nombre: "Analista Financiero", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionTeamLeader = new Posicion(nombre: "Team Leader", descripcion:loreIpsumCorto).save(failOnError:true)		
		Posicion posicionKeyAccountManagerProductManager = new Posicion(nombre: "Key Account Manager/Product Manager", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionArquitectoSoluciones = new Posicion(nombre: "Arquitecto de soluciones", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionManager = new Posicion(nombre: "Manager", descripcion:loreIpsumCorto).save(failOnError:true)
		Posicion posicionCoreManager = new Posicion(nombre: "Core Manager", descripcion:loreIpsumCorto).save(failOnError:true)
		
		println "Creando competencias."
		Competencia competenciaAnalisisYsolucionDeProblemas = new Competencia(nombre: "Análisis y Solución de Problemas",tipo: competenciaTipoPersonal, descripcion:"Capacidad para realizar un análisis lógico, sistemático y estructurado de una situación o problema hasta llegar a determinar, las posibles causas o alternativas de solución de esta situación o dificultad.").save(failOnError:true)
		Competencia competenciaAtencionDetalle = new Competencia(nombre: "Atención al detalle", tipo: competenciaTipoPersonal, descripcion:"Capacidad para atender e indentificar los detalles relevantes en una tarea. Implica la habilidad para detectar de manera rápida y oportunida los posibles errores en el manejo de la información.").save(failOnError:true)
		Competencia competenciaCapacidadNegociacion = new Competencia(nombre: "Capacidad de negociación", tipo: competenciaTipoPersonal, descripcion:"Capacidad para persuadir a otras personas, utilizar argumentos sólidos y honestos y acercar posisciones mediante el ejercicio del razonamiento conjunto, que contemple los intereses de todas las partes intervinientes y los objetivos organizacionales. Implica la capacidad para influenciar a otros a través de estrategias que permitan construir acuerdos satisfactorios para todos, mediante la aplicación del concepto ganar-ganar.").save(failOnError:true)
		Competencia competenciaComunicacionEficaz = new Competencia(nombre: "Comunicación Eficaz", tipo: competenciaTipoPersonal, descripcion:"Capacidad para escuchar y entender al otro, para transmitir en forma clara y oportuna la información requerida por los demás a fin de alcanzar los objetivos organizacionales, y para mantener canales de comunicación abiertos y redes de contacto formales e informales, que abarquen los diferentes niveles de la organización.").save(failOnError:true)
		Competencia competenciaIniciativa = new Competencia(nombre: "Iniciativa", tipo: competenciaTipoPersonal, descripcion:"Capacidad para actuar proactivamente, idear e implementar soluciones a nuevas problemáticas y/o retos, con decisión e independecia de criterio. Generar ideas, desarrollarlas, enriquecerlas, someterlas a crítica y a juicio, implantarlas para construir con ellas soluciones a problemas planteados u oportunidades de innovación.").save(failOnError:true)
		Competencia competenciaFlexibilidad = new Competencia(nombre: "Flexibilidad", tipo: competenciaTipoPersonal, descripcion:"Capacidad para comprender y apreciar perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma rápida y eficiente a diversas situaciones, contextos, medios y personas.").save(failOnError:true)
		Competencia competenciaOrientacionAlCliente = new Competencia(nombre: "Orientación al Cliente", tipo: competenciaTipoPersonal, descripcion:"Capacidad para actuar con sensibilidad ante las necesidades de un cliente y/o conjunto de clientes actuales o potenciales (ya sea internos o externos). Implica una vocación permanente de servicio al cliente, comprender adecuadamente sus demandas y generar soluciones efectivas a sus necesidades.").save(failOnError:true)
		Competencia competenciaOrientacionAlLogro = new Competencia(nombre: "Orientación al Logro", tipo: competenciaTipoPersonal, descripcion:"Capacidad para orientar los comportamientos propios o de los demás hacia el logro o superación de los resultados esperados, bajo estándares de calidad establecidos, fijar metas desafiantes, mejorar y mantener altos niveles de rendimientos en el marco de la estrategia de la organización. Implica establecer indicadores de logro y hacer seguimiento permanente, enfocado en una mejora continua.").save(failOnError:true)
		Competencia competenciaOrganizacionYPlanificacion = new Competencia(nombre: "Organización y Planificación", tipo: competenciaTipoPersonal, descripcion:"Capacidad para fijar metas y prioridades a la hora de realizar una tarea, desarrollar un área o un proyecto conviniendo la acción, los plazos y los recursos que se deben utilizar. Capacidad para poner en marcha cuando se tiene que hacer concurrir las acciones coordinadas de un conjunto de personas, en tiempo y costes efectivos de modo que se aprovechen del modo más eficiente posible los esfuerzos y se alcancen los objetivos.").save(failOnError:true)
		Competencia competenciaTrabajoEnEquipo = new Competencia(nombre: "Trabajo en equipo", tipo: competenciaTipoPersonal, descripcion:"Capacidad para colaborar con los demás, formar parte de un grupo y trabajar con otras áreas de la organización con el propósito de alcanzar, en conjunto, la estrategia organizacional. Implica tener expectativas positivas respecto de los demás, comprender a los otros, y generar y matener un buen clima de trabajo.").save(failOnError:true)
		Competencia competenciaToleranciaPresion = new Competencia(nombre: "Tolerancia a la presión", tipo: competenciaTipoPersonal, descripcion:"Capacidad para trabajar con determinación, firmeza y perseverancia a fin de alcanzar objetivos difíciles o para concretar aaciones/ decisiones que requieran un compromiso y esfuerzo mayores que los habituales. Implica mantener un alto nivel de compromiso y esfuerzo mayores que los habituales. Implica matener un alto nivel de desempeño aún en situaciones exigentes y cambiantes.").save(failOnError:true)
		
		Competencia competenciaAdministracionProyectos = new Competencia(nombre: "Administración de proyectos", tipo: competenciaTipoTecnica, descripcion:"Conocimiento teórico y práctico para la gestión de proyectos de acuerdo a las mejores prácticas. Capacidad de adaptar un modelo estándar de administracion de proyectos a las particularidades de cada proyecto, manteniendo siempre los principios y buenas prácticas. Implica conocer ampliamente el modelo de gestion de proyectos, sus fases y entregables, asi como las partes involucradas con sus responsabilidades. Debe tener la capacidad de planificar de acuerdo a la realidad y brindar un excelente seguimiento a cada etapa del proyecto, tomando las medidas correctivas que sean requeridas antes de impactar de forma negativa el proyecto.").save(failOnError:true)
		Competencia competenciaConocimientosDisenoArquitecturaSoluciones = new Competencia(nombre: "Conocimiento en diseño y arquitectura de soluciones", tipo: competenciaTipoTecnica, descripcion:"Conocimiento técnico avanzado y amplia experiencia práctica en la implementación de soluciones en las área de seguridad McAfee, Colaboracion o Infraestructura. Capacidad de realizar un diseño y dimensionamiento apropiado en un escenario dado con alguna de estas soluciones, proporcionando los requerimientos técnicos y esfuerzo requerido para implementar la solución de la mejor forma posible.").save(failOnError:true)
		Competencia competenciaConocimientosProductosCompania = new Competencia(nombre: "Conocimiento de los productos Compañía", tipo: competenciaTipoTecnica, descripcion:"Capacidad para conocer los productos y/o servicios de la organización y evaluar la factibilidad de su adaptación a los requerimientos, preferencias y necesidades de los clientes. Implica la capacidad para relacionar las ventajas de los productos o servicios que se ofrecen con las necesidades de los clientes y presentar propuestas o soluciones que agreguen valor.").save(failOnError:true)
		Competencia competenciaConocimientosRedes = new Competencia(nombre: "Conocimiento en redes", tipo: competenciaTipoTecnica, descripcion:"Conocimiento de conceptos, principios y modelos de redes de datos. Entendimiento de una infraestructura de comunicaciones y la interaccion de los servicios tecnológicos dentro de la misma.").save(failOnError:true)
		Competencia competenciaConocimientosInfraestructura = new Competencia(nombre: "Conocimientos en Infraestructura", tipo: competenciaTipoTecnica, descripcion:"Conocimientos de los principales elementos que conforman una infraestructura tecnológica tales como: datacenter, nube privada, DNS, DHCP, Servicio de Directorio, dominio, virtualizacion, servicio de correo electronico, internet, entre otros.").save(failOnError:true)
		Competencia competenciaConocimientosInfraestructuraMicrosoft = new Competencia(nombre: "Conocimiento en soluciones de infraestructura Microsoft", tipo: competenciaTipoTecnica, descripcion:"Conocimiento teórico y práctico en las soluciones de infraestructura Microsoft: introduccion, instalacion, configuracion, diseño, resolucion de problemas.").save(failOnError:true)
		Competencia competenciaConocimientosSeguridadMcAfee = new Competencia(nombre: "Conocimientos en soluciones de Seguridad McAfee", tipo: competenciaTipoTecnica, descripcion:"Conocimiento teórico y práctico en las soluciones de seguridad McAfee: introduccion, instalacion, configuracion, diseño, resolucion de problemas.").save(failOnError:true)
		Competencia competenciaConocimientosSharePoint = new Competencia(nombre: "Conocimiento en soluciones Share Point", tipo: competenciaTipoTecnica, descripcion:"Conocimientos de los principales elementos que conforman Share Point tales como: Herramientas de redes sociales, Integración con sistemas externos, Construcción de soluciones no-código, automatización de formularios electrónicos, Inteligencia de negocios, Búsqueda empresarial, Administración de contenido/Arquitectura de información, Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server,ASP.NET e Internet Information Services.").save(failOnError:true)
		Competencia competenciaConocimientosSolucionesTecnicasEspecialidas = new Competencia(nombre: "Conocimientos en soluciones técnicas especializadas", tipo: competenciaTipoTecnica, descripcion:"Conocimiento técnico en soluciones de TI especializadas y puntuales tales como Microsoft Office 365.").save(failOnError:true)
		Competencia competenciaConocimientosContratacionAdministrativa = new Competencia(nombre: "Conocimientos contratación administrativa", tipo: competenciaTipoTecnica, descripcion:"Conocmiiento de los procesos de contratación administrativa desde el inicio hasta su finalización del proceso, capacidad para redactar nomas y formalizar contratos, tramitar documentos en Instituciones Públicas, puede realiar consultas escritas y verbales").save(failOnError:true)
		Competencia competenciaConocimientosTelemarketing = new Competencia(nombre: "Conocimientos telemarketing", tipo: competenciaTipoTecnica, descripcion:"Conocimiento para realizar la venta por teléfono de servicios y/o productos, considerando las características del cliente, las técnicas de venta adecuadas y los requerimientos de la empresa.").save(failOnError:true)
		Competencia competenciaConocimientosVentasEfectivas = new Competencia(nombre: "Conocimientos ventas efectivas", tipo: competenciaTipoTecnica, descripcion:"Conocimiento de ventas consultivas, técnicas de comunicación como herramienta base para creación de nuevas oportunidades y cierre de negocios, así como mantenimiento de cartea activa de clientes.").save(failOnError:true)
		Competencia competenciaConocimientosBackOffice = new Competencia(nombre: "Conocimientos back office", tipo: competenciaTipoTecnica, descripcion:"Conocimiento y puesta en práctica de actividades de apoyo administrativo en el ámbito de la actividad comercial.").save(failOnError:true)
		Competencia competenciaConocimientosContables = new Competencia(nombre: "Conocimientos contables", tipo: competenciaTipoTecnica, descripcion:"Conocimiento técnico y experiencia en análisis, interpretación y aplicación de información contable, aplicación de técnicas e interpretación de Estados Financieros.").save(failOnError:true)
		
		Competencia competenciaTomaDecisiones = new Competencia(nombre: "Toma de decisiones", tipo: competenciaTipoGerencial, descripcion:"Capacidad para analizar las diversas variantes u opciones, considerar las circunstancias axistentes, los recursos disponibles y su impacto en la compañía, para luego seleccionar la alternativa más adecuada, con el fin de lograr el mejor resultado en función de los objetivos organizacionales. Implica capacidad para ejecutar las acciones con calidad, oportunidad y conciencia acerca de las posibles consecuencias de la decisión tomada.").save(failOnError:true)
		Competencia competenciaDireccionEquipos = new Competencia(nombre: "Dirección de equipos", tipo: competenciaTipoGerencial, descripcion:"Capacidad para integrar, desarrollar, consolidar y conducir con éxito un equipo de trabajo y alentar a sus integrantes a actuar con responsabilidad. Implica la capacidad para coordinar, distribuir y delegar adecuadamente las tareas en el equipo, en función de las competencias y conocimientos de cada integrante, estipular plazos de cumplimiento y dirigir las acciones del grupo hacia una meta u objetivo determinado.").save(failOnError:true)
		Competencia competenciaLiderazgo = new Competencia(nombre: "Liderazgo", tipo: competenciaTipoGerencial, descripcion:"Capacidad para generar compromiso y lograr el respaldo de sus superiores con vistas a enfrentar con éxito los desafíos de la organización. Capacidad para asegurar una adecuada conducción de personas, desarrollar el talento y lograr mantener un clima organizacional armónico y desafiante.").save(failOnError:true)
		Competencia competenciaVisionEstrategica = new Competencia(nombre: "Visión Estratégica", tipo: competenciaTipoGerencial, descripcion:"Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización, con el propósito de optimizar las fortalezas, actuar sobre las debilidades y aprovechar oportunidades del contexto. Implica la capacidad para visualizar y conducir el área a cargo como un sistema integral, para lograr los objetivos y metas retadoras, asociados a la estrategia y objetivos corporativos.").save(failOnError:true)
			
		println "Creando niveles competencia."
		NivelesCompetencias nivelCompetenciaA = new NivelesCompetencias(nombre: "A", descripcion:loreIpsumCorto).save(failOnError:true)
		NivelesCompetencias nivelCompetenciaB = new NivelesCompetencias(nombre: "B", descripcion:loreIpsumCorto).save(failOnError:true)
		NivelesCompetencias nivelCompetenciaC = new NivelesCompetencias(nombre: "C", descripcion:loreIpsumCorto).save(failOnError:true)
		

		println "Creando compentencias niveles"
		CompetenciaNivel competenciaAnalisisYsolucionDeProblemasNivelA = new CompetenciaNivel(competencia:competenciaAnalisisYsolucionDeProblemas, nivel:nivelCompetenciaA, descripcion:"Identifica problemas con gran facilidad, propone y contruye soluciones a problemas en diversos ámbitos con una visión global, es capaz de formular preguntas clave en vistas de definir el problema y valorar su magnitud, posee eficacia y agilidad para dar soluciones a estos problemas, emprendiendo las acciones correctivas necesarias con sentido común e iniciativa.").save(failOnError:true)
		CompetenciaNivel competenciaAnalisisYsolucionDeProblemasNivelB = new CompetenciaNivel(competencia:competenciaAnalisisYsolucionDeProblemas, nivel:nivelCompetenciaB, descripcion:"Identifica con facilidad lo que es un problema, utiliza su experiencia y criterio para analizar las causas de un problema. Es capaz de realizar preguntas adecuadas para definir el problema, es capaz de recoger la información que necesita y analizarla correctamente, es capaz de dar solución a los problemas emprendiendo acciones correctivas que sean eficientes y eficaces.").save(failOnError:true)
		CompetenciaNivel competenciaAnalisisYsolucionDeProblemasNivelC = new CompetenciaNivel(competencia:competenciaAnalisisYsolucionDeProblemas, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para identificar lo que es y no es un problema, lo analiza y recoge información significativa con el fin de abordarlo generando alternativas de solución, no siempre sigue un método de análisis, sin embargo, generalmente es capaz de dar solución a los problemas aplicando los métodos aprendidos").save(failOnError:true)

		CompetenciaNivel competenciaAtencionDetalleNivelA = new CompetenciaNivel(competencia:competenciaAtencionDetalle, nivel:nivelCompetenciaA, descripcion:"Destina tiempo a informar sobre las consecuencias para la organización y clientes de los errores en el trabajo. Busca concientizar a los demás sobre la importancia de los procedimientos, como es la relevancia de entregar información completa, ordenada y oportuna en temas sobre nuevas y mejores prácticas en el trabajo.").save(failOnError:true)
		CompetenciaNivel competenciaAtencionDetalleNivelB = new CompetenciaNivel(competencia:competenciaAtencionDetalle, nivel:nivelCompetenciaB, descripcion:"Da especial atención a la revisión de detalles, es detallista y ordenado en su trabajo. Una vez identificado un errore se ingenia posibles maneras de preveerlo y compete a los demás a su implementación.").save(failOnError:true)
		CompetenciaNivel competenciaAtencionDetalleNivelC = new CompetenciaNivel(competencia:competenciaAtencionDetalle, nivel:nivelCompetenciaC, descripcion:"Trabaja con rapidez y minuciosidad detectando y corrigiendo errores que puedan interferir o identificar los procedimientos.").save(failOnError:true)

		CompetenciaNivel competenciaCapacidadNegociacionNivelA = new CompetenciaNivel(competencia:competenciaCapacidadNegociacion, nivel:nivelCompetenciaA, descripcion:"Posee la capacidad para persuadir a otras personas y exhibir actitudes que generen un impacto positivo en los demás a fin de producir cambios de opiniones, enfoques o posturas mediante la utilización de argumentos sólidos y honestos. Capacidad para desarrollar conceptos y explicaciones fundadas y veraces, dirigidos a respaldar posiciones y criterios. Capacidad para inclinar y acercar posiciones mediante el ejercicio del razonamiento conjunto, y contemplar los intereses de todas las partes intervinentes y los objetivos organizacionales como base para alcanzar el resultado esperado. Capacidad para desarrollar estrategias complejas que le permitan influencia a otros y construir acuerdos satisfactorios para todas las partes, mediante la aplicación del concepto ganar-ganar.").save(failOnError:true)
		CompetenciaNivel competenciaCapacidadNegociacionNivelB = new CompetenciaNivel(competencia:competenciaCapacidadNegociacion, nivel:nivelCompetenciaB, descripcion:"Tiene la capacidad para persuadir a clientes y a otras personas mediante la utilización de argumentos sólidos y honestos. Capacidad para desarrollar, ante situaciones especiales, conceptos y explicaciones fundadas y veraces, dirigidos a respaldar posiciones y criterios. Capacidad para utilizar tales argumentaciones con el fin de inclinar y acercar posiciones mediante el ejercicio del razonamiento conjunto y contemplar los intereses de todas las partes intervinientes y los objetivos de la organización como base para alcanzar el resultado esperado. Capacidad pra influenciar a otros a través de estrategias que permitan construir acuerdos satisfactorios para todos al procurar utilizar técnicas basadas en el concepto ganar-ganar.").save(failOnError:true)
		CompetenciaNivel competenciaCapacidadNegociacionNivelC = new CompetenciaNivel(competencia:competenciaCapacidadNegociacion, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para persuadir a clientes y otras personas de las que necesita colaboración, a través de acciones concretas y argumentaciones adecuadas y honestas. Capacidad para llevar a cabo negociaciones que persuadan a la contraparte y contemplar sus intereses y los de la organización.").save(failOnError:true)
	
		CompetenciaNivel competenciaComunicacionEficazNivelA = new CompetenciaNivel(competencia:competenciaComunicacionEficaz, nivel:nivelCompetenciaA, descripcion:"Tiene la capacidad para escuchar y entender al otro en forma clara y oportuna la información requerida por los demás a fin de lograr objetivos organizacionales, y para mantener siempre canales de comunicación abiertos. Posee la capacidad para adaptar su estilo comunicacional a las características particulares de la audiencia o el interlocutor. Tiene la capacidad para estructurar canales de comunicación organizacionales que permitan establecer relaciones en todos los sentidos y promover el intercambio inteligente y portuno de información necesaria para la consecución de los objetivos organizacionales.").save(failOnError:true)
		CompetenciaNivel competenciaComunicacionEficazNivelB = new CompetenciaNivel(competencia:competenciaComunicacionEficaz, nivel:nivelCompetenciaB, descripcion:"Posee la capacidad para escuchar a los demás y para seleccionar los métodos más adecuados a fin de lograr comunicaciones efectivas. Capacidad para minimizar las barreras y distorsiones que afectan la circulación de la información. Capacidad para promover dentro de su sector el intercambio permanente de información con el propósito de mantener a todas las personas adecuadamente informadas acerca de los diferentes temas. Capacidad para hacer uso efectivo de los canales de comunicación existentes, tanto formales como informales. Capacidad para transmitir de manera efectiva y clara las ideas e información").save(failOnError:true)
		CompetenciaNivel competenciaComunicacionEficazNivelC = new CompetenciaNivel(competencia:competenciaComunicacionEficaz, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para escuchar atentamente a sus interlocutores y comunicarse de manera clara y entendible. Capacidad para realizar las preguntas adecuadas a fin de obtener información que necesita y capacidad para transmitir sus ideas de manera clara y ordenada.").save(failOnError:true)
		
		CompetenciaNivel competenciaIniciativaNivelA = new CompetenciaNivel(competencia:competenciaIniciativa, nivel:nivelCompetenciaA, descripcion:"Propone permanentemente acciones e ideas, responde con rapidez a las situaciones tanto externas como internas de la organización, asegurando una efectiva respuesta, de forma clara y simple. Su iniciativa y rapidez transforman su accionar en una ventaja competitiva. Es creativo e innovador").save(failOnError:true)
		CompetenciaNivel competenciaIniciativaNivelB = new CompetenciaNivel(competencia:competenciaIniciativa, nivel:nivelCompetenciaB, descripcion:"Pone en marcha adecuadamente acciones y propone soluciones con el fin de resolver diferentes situaciones internas y externas de la organización. Tiene la capacidad de analizar situacones planteadas y elaborar planes de contingencia con el propósito de crear oportunidades y/o evitar problemas potenciales.").save(failOnError:true)
		CompetenciaNivel competenciaIniciativaNivelC = new CompetenciaNivel(competencia:competenciaIniciativa, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para actuar proactivamente y brindar soluciones a situaciones. Capacidad para responder con rapidez y eficiencia ante nuevos requerimientos. Capacidad para utilizar las aplicaciones tecnológicas, herramientas y recursos cuando sea pertinente,Generalmente pone en marcha las acciones que se le proponen, tiene tendencia a hacer aquellas actividades que considera obligatorias.").save(failOnError:true)
		
		CompetenciaNivel competenciaFlexibilidadNivelA = new CompetenciaNivel(competencia:competenciaFlexibilidad, nivel:nivelCompetenciaA, descripcion:"Capacidad para comprender y apreciar (otorgar un valor especial) perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma rápida y eficiente a diversas situaciones, contextos (interno o externo a la organización), medios y personas. Capacidad para llevar a cabo una revisión crítica de las estrategias y objetivos de su propia actividad y la de su equipo de trabajo, proponer cambios cuando resulte necesario, a fin de lograr una adecuada adaptación a las nuevas situaciones. Implica realizar un revisión crítica de las estrategias de la organización en su conjunto y proponer los cambios pertinentes. Implica poseer la disposición de apoyar al resto del equipo y departamentos cuando se considere necesario para cumplir con los objetivos organizacionales.").save(failOnError:true)
		CompetenciaNivel competenciaFlexibilidadNivelB = new CompetenciaNivel(competencia:competenciaFlexibilidad, nivel:nivelCompetenciaB, descripcion:"Capacidad para comprender perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma eficiente a diversas situaciones, contextos, medios y personas. Capacidad para llevar a cabo una revisión crítica de los objetivos bajo su responsabilidad, así como de su propia actividad y proponer cambios cuando resulte necesario, a fin de lograr una adecuada adaptación a las nuevas situaciones. Capacidad para ajustar su accionar a los objetivos de la organización y tener la disposición y disponibilidad de colaborar con diferentes tareas, situaciones y personas cuando sea requerido.").save(failOnError:true)
		CompetenciaNivel competenciaFlexibilidadNivelC = new CompetenciaNivel(competencia:competenciaFlexibilidad, nivel:nivelCompetenciaC, descripcion:"Capacidad para comprender perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma eficiente a diversas situaciones, contextos, medios y personas . Capacidad para adecuarse y realizar nuevas tareas que le sean impuestas sin previa planificación.").save(failOnError:true)
		
		CompetenciaNivel competenciaOrientacionAlClienteNivelA = new CompetenciaNivel(competencia:competenciaOrientacionAlCliente, nivel:nivelCompetenciaA, descripcion:"Detecta necesidades en el cliente y logra que este lo reconozca y aprecie su valor agregado. Se muestra proactivo para atender con rapidez al cliente y su trato es muy cortés. Muestra inquietud por conocer con exactitud el punto de vista del cliente. Es orientado a diseñar procedimientos que brinden soluciones de excelencia para todos los clientes y lograr de ese modo reconocimiento en el mercado, en el cual aprecie el valor agregado ofrecido y reforzar de ese modo el prestigio organizacional. Posee la capacidad para constituirse en un referente por ofrecer soluciones que satisfacen tanto a los clientes internos como externos.").save(failOnError:true)
		CompetenciaNivel competenciaOrientacionAlClienteNivelB = new CompetenciaNivel(competencia:competenciaOrientacionAlCliente, nivel:nivelCompetenciaB, descripcion:"Identifica las necesidades del cliente, posee la capacidad para anticiparse a los pedidos de los clientes tanto internos como externos, demuestra interés en atender a los clientes con rapidez. Diagnostica correctamente la necesidad y plantea soluciones adecuadas. Genera satisfacción en el clientes.").save(failOnError:true)
		CompetenciaNivel competenciaOrientacionAlClienteNivelC = new CompetenciaNivel(competencia:competenciaOrientacionAlCliente, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para mantenerse atento y atender las necesidades de los clientes, escuchar sus problemas y brindar una respuesta efectiva en tiempo y a la medida de sus requerimientos, generalmente actúa a partir de los pedidos de los clientes.").save(failOnError:true)
		
		CompetenciaNivel competenciaOrientacionAlLogroNivelA = new CompetenciaNivel(competencia:competenciaOrientacionAlLogro, nivel:nivelCompetenciaA, descripcion:"Cumple los objetivos superando el promedio establecido, siempre va un paso más adelante en el camino de los objetivos fijados, preocupado por los resultados globales de la empresa. Emprende acciones de mejora, centrándose en la optimización de recursos, considerando todas las variables, utilizando metodologías para la planeación, seguimiento y verificación de la información. Se marca estándares de excelencia y posee la capacidad para realizar las mediciones pertinentes que permitan evaluar el logro de metas planteadas a través de la correcta utilización de las herramientas correspondientes. Capacidad para fomentar igual actitud en otros a través del ejemplo.").save(failOnError:true)
		CompetenciaNivel competenciaOrientacionAlLogroNivelB = new CompetenciaNivel(competencia:competenciaOrientacionAlLogro, nivel:nivelCompetenciaB, descripcion:"Posee la capacidad para fijarse a si mismo objetivos y metas retadoras y pose la capacidad para mantener una actitud constante orientada al logro o superación de los resultados esperados, según los estándares establecidos. Define prioridades, y tiene la capacidad para realizar el seguimiento de las labores propias a través del uso eficiente de las herramientas disponibles en la organización para tal fin.").save(failOnError:true)
		CompetenciaNivel competenciaOrientacionAlLogroNivelC = new CompetenciaNivel(competencia:competenciaOrientacionAlLogro, nivel:nivelCompetenciaC, descripcion:"Capacidad para demostrar a través de su comportamiento, una predisposición para realizar las acciones necesarias para alcanzar los objetivos asignados y cumplir metas. Capacidad para realizar el control de su propio trabajo.").save(failOnError:true)
		
		CompetenciaNivel competenciaOrganizacionYPlanificacionNivelA = new CompetenciaNivel(competencia:competenciaOrganizacionYPlanificacion, nivel:nivelCompetenciaA, descripcion:"Capacidad para conocer y organizar las actividades a realizar para conseguir los objetivos del trabajo/proyecto; define con claridad los objetivos de un trabajo / proyecto; Define con claridad el alcance y los entregables del trabajo/proyecto; Identifica las fases (componentes) del trabajo y las justifica; Define correctamente las actividades necesarias para realizar el trabajo. Estima la duración de las actividades según parámetros objetivos; establece una secuencia de las actividades según un orden lógico; desarrolla un cronograma de las actividades realista; cumple en tiempo y forma con las tareas; programa actividades secuenciales para conseguir objetivos. Se asegura de que cuenta con los recursos necesarios para realizar las actividades y cumplir con los plazos y objetivos planificados. Desarrolla y aplica técnicas de seguimiento y control de las actividades para adelantarse a los cambios reales que puedan producirse, modificar el calendario, durante la realización del trabajo/proyecto. Aplica técnicas de evaluación continua de los resultados del proyecto, toma medidas para la mejora, identifica desviaciones de resultados y documenta lecciones de experiencia para la mejora de la competencia.").save(failOnError:true)
		CompetenciaNivel competenciaOrganizacionYPlanificacionNivelB = new CompetenciaNivel(competencia:competenciaOrganizacionYPlanificacion, nivel:nivelCompetenciaB, descripcion:"Capacidad para definir los objetivos del trabajo y las actividades para lograrlos.Ordena las actividades según un orden lógico y realiza un cronograma de actividades realista. Aplica técnicas de control para realizar los controles y cambios necesarios en el calendario. Realiza una evaluación expost del trabajo realizado.").save(failOnError:true)
		CompetenciaNivel competenciaOrganizacionYPlanificacionNivelC = new CompetenciaNivel(competencia:competenciaOrganizacionYPlanificacion, nivel:nivelCompetenciaC, descripcion:"Capacidad para conocer y organizar las actividades a realizar para conseguir los objetivos del trabajo/proyecto. Estima la duración de las actividades según un orden lógico y realista. Conoce las técnicas de seguimiento y control. Realiza una evaluación expost del trabajo realizado. Pone en marcha acciones cuando es necesario realizarlas con tal de alcanzar los objetivos.").save(failOnError:true)
		
		CompetenciaNivel competenciaTrabajoEnEquipoNivelA = new CompetenciaNivel(competencia:competenciaTrabajoEnEquipo, nivel:nivelCompetenciaA, descripcion:"Capacidad para fomentar el espíritu de colaboración en toda la organización, ayuda a orientar el trabajo de pares a la consecución de los objetivos organizacionales y departamentales. Interactúa con los demás desarrollando un ambiente de trabajo amistoso, buen clima y espíritu de cooperación. Busca y comparte información, se abre a los demás para facilitar la comunicación. Capacidad para constituirse en un ejemplo de colaboración y cooperación en toda la organización, comprender a otros y generar y mantener un buen clima de trabajo.").save(failOnError:true)
		CompetenciaNivel competenciaTrabajoEnEquipoNivelB = new CompetenciaNivel(competencia:competenciaTrabajoEnEquipo, nivel:nivelCompetenciaB, descripcion:"Fomenta la colaboración y cooperación en su área de trabajo, en ocasiones orienta el trabajo de sus pares a la consecución de objetivos fijados, es capaz de priorizar los objetivos grupales a los individuales, sabe reconocer el éxito de otros, es comunicativo y comparte información. Mantiene un buen clima de trabajo con sus compañeros.").save(failOnError:true)
		CompetenciaNivel competenciaTrabajoEnEquipoNivelC = new CompetenciaNivel(competencia:competenciaTrabajoEnEquipo, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para colaborar y cooperar con otras personas, tanto de su área como de otras áreas de la organización con el propósito de alcanzar los objetivos fijados. Generalmente prioriza los objetivos individuales a los grupales.").save(failOnError:true)
		
		CompetenciaNivel competenciaToleranciaPresionNivelA = new CompetenciaNivel(competencia:competenciaToleranciaPresion, nivel:nivelCompetenciaA, descripcion:"Capacidad para trabajar con determinación, firmeza y perseverancia a fin de alcanzar objetivos difíciles con eficacia, diseñar políticas y procedimientos que permitan lleva a cabo los planes organizacionales en contextos complejos y tomar decisiones que requieren un compromiso y esfuerzo mayores que los habituales. Implica trabajar con energía y mantener un alto nivel de desempeño aun en situaciones exigentes y cambiantes, con interlocutores diversos que se suceden en cortos espacios de tiempo, a lo largo de jornadas prolongadas. También implica ser un ejemplo para la organización al cuidar las relaciones interpersonales en momento difíciles y motivar a otros a obrar del mismo modo, para lograr un clima laboral armónico y de alta productividad.").save(failOnError:true)
		CompetenciaNivel competenciaToleranciaPresionNivelB = new CompetenciaNivel(competencia:competenciaToleranciaPresion, nivel:nivelCompetenciaB, descripcion:"Capacidad para trabajar con determinación y perseverancia a fin de alcanzar objetivos difíciles con eficacia, diseñar procedimientos de trabajo que permitan llevar a cabo los planes del área o departamento en contextos complejos y tomar decisiones que requieren un compromiso y esfuerzo mayores que los habituales. Implica trabajar con energía y mantener un buen nivel de desempeño aun en situaciones exigentes y cambiantes, con interlocutores diversos que se suceden en cortos espacios de tiempo, a lo largo de jornadas prolongadas. Cuida las relaciones interpersonales en momentos difíciles.").save(failOnError:true)
		CompetenciaNivel competenciaToleranciaPresionNivelC = new CompetenciaNivel(competencia:competenciaToleranciaPresion, nivel:nivelCompetenciaC, descripcion:"Capacidad para trabajar con perseverancia y eficiencia a fin de alcanzar objetivos que se le han fijado, aun en contextos complejos. Implica trabajar con energía y mantener el nivel de desempeño esperando incluso en circunstancias exigentes y cambiantes, a lo largo de jornadas prolongadas.").save(failOnError:true)
		
		CompetenciaNivel competenciaAdministracionProyectosNivelA = new CompetenciaNivel(competencia:competenciaAdministracionProyectos, nivel:nivelCompetenciaA, descripcion:"Tiene amplia experiencia comprobable en administración de proyectos de tecnologías de información. Capacidad de identificar proactivamente riesgos y dificultades en los proyectos, así como tomar las medidas necesarias para evitarlas. Capacidad de proponer de forma proactiva mejoras en el modelo de administración de proyectos, aportando con su experiencia nuevas ideas y procedimientos de mejora. Busca siempre agilizar cada tarea y hacer mas eficientes los proyectos.").save(failOnError:true)
		CompetenciaNivel competenciaAdministracionProyectosNivelB = new CompetenciaNivel(competencia:competenciaAdministracionProyectos, nivel:nivelCompetenciaB, descripcion:"Tiene experiencia práctica comprobable en administración de proyectos. Sabe como enfrentar las dificultades de un proyecto. Capacidad de aprovechar al máximo los skills del equipo de trabajo y combinarlos apropiadamente. Tiene la capacidad de adaptar fácilmente un modelo de administración de proyectos y nuevos conceptos de mejora. Revisa resultados por cada etapa del proyecto brindando seguimiento detallado y buscando mejoras. Capacidad de aprovechar las experiencias de cada proyecto para optimizar los tiempos de tareas, mantenimiento la calidad. Tiene gran capacidad de flexibilizar y ajustar tareas, recursos, tiempos y procedimientos buscando siempre lo mejor para el negocio.").save(failOnError:true)
		CompetenciaNivel competenciaAdministracionProyectosNivelC = new CompetenciaNivel(competencia:competenciaAdministracionProyectos, nivel:nivelCompetenciaC, descripcion:"Tiene conocimiento teórico y maneja conceptos básicos de administracion de proyectos. Capacidad para trabajar con un modelo existente de administracion de proyectos, siguiendo cada fase de forma ordenada y precisa. Conoce a los miembros del equipo y su forma de trabajar, de modo sabe como brindar un seguimiento apropiado.Puede planificar proyectos con tiempos reales certeros y excelente calidad.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosDisenoArquitecturaSolucionesNivelA = new CompetenciaNivel(competencia:competenciaConocimientosDisenoArquitecturaSoluciones, nivel:nivelCompetenciaA, descripcion:"Capacidad de analizar escenarios mas complejos buscando soluciones nuevas e innovadoras con productos del área, integraciones de productos o soluciones de otra área. Tiene la capacidad de aprender y mejorar diseños anteriores reutilizando tareas y recursos. Debe buscar siempre disminuir los tiempos del proyecto, aprovechar la máximo los recursos, buscar nuevas formas de hacer las cosas para agilizar tareas como: imagenes, scripts, automatizaciones, etc.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosDisenoArquitecturaSolucionesNivelB = new CompetenciaNivel(competencia:competenciaConocimientosDisenoArquitecturaSoluciones, nivel:nivelCompetenciaB, descripcion:"Capacidad de realizar un dimensionamiento basado en su experiencia técnica con la solución. Puede entender un escenario, analizar las alternativas de solución, delimitar las funcionalidades de la solución, asesorar al cliente en su escenario. El diseño y dimensionamiento siempre se realiza con la mejor alternativa de calidad, buscando la eficiencia en cada tarea y evitando el desperdicio de recursos. Busca disminuir los tiempos del proyecto al máximo con diseños apropiados y justos a la solución.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosDisenoArquitecturaSolucionesNivelC = new CompetenciaNivel(competencia:competenciaConocimientosDisenoArquitecturaSoluciones, nivel:nivelCompetenciaC, descripcion:"Sin definir").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosProductosCompaniaNivelA = new CompetenciaNivel(competencia:competenciaConocimientosProductosCompania, nivel:nivelCompetenciaA, descripcion:"Capacidad para conocer en profundidad cada uno de los servicios que ofrece la organización y para relacionar sus ventajas con las necesidades de los clientes. Capacidad para presentar propuestas o soluciones adecuadas a esas necesidades, y para explicar a los clientes el valor que los productos y servicios agregan a sus negocios y los beneficios que producen. Capacidad para anticiparse a las observaciones que los clientes pueden realizar a las propuestas o soluciones presentadas y responder ante ellas con argumentos sólidos, veraces y fundados. Crea la necesidad de ese producto en la organización.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosProductosCompaniaNivelB= new CompetenciaNivel(competencia:competenciaConocimientosProductosCompania, nivel:nivelCompetenciaB, descripcion:"Capacidad para conocer los productos y servicios ofrecidos por la organización, realizar propuestas de calidad de acuerdo con las características particulares de cada cliente y responder con argumentos convincentes a las objeciones que se presentan. Capacidad de ver el valor agregarlo y asociarlo a los objetivos del negocio.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosProductosCompaniaNivelC = new CompetenciaNivel(competencia:competenciaConocimientosProductosCompania, nivel:nivelCompetenciaC, descripcion:"Capacidad para conocer adecuadamente los productos y servicios de la organización, presentar los beneficios fundamentales que representan y exponer sus ventajas, a través de propuestas que expliquen como agregan valor al negocio del cliente. Capacidad para responder en forma clara y consistente a las observaciones de los clientes respecto de las propuestas y soluciones ofrecidas.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosRedesNivelA = new CompetenciaNivel(competencia:competenciaConocimientosRedes, nivel:nivelCompetenciaA, descripcion:"Entiende una infraestructura de comunicaciones y los elementos que interactuan en ella: comunicación con oficinas remotas, servicios tecnológicos como: internet, correo electronico, sitios web. Conoce sobre routing, buenas practicas de seguridad en redes, balanceo de cargas, alta disponibilidad, red virtual").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosRedesNivelB = new CompetenciaNivel(competencia:competenciaConocimientosRedes, nivel:nivelCompetenciaB, descripcion:"Tiene conocimiento intermedio-avazando sobre direccionamiento ip, máscaras, tools de resolucion de problemas, puertos, enrutamiento, comprende el funcionamiento de un firewall, captura de tráfico, capas de un modelo de redes").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosRedesNivelC = new CompetenciaNivel(competencia:competenciaConocimientosRedes, nivel:nivelCompetenciaC, descripcion:"Tiene un conocimiento basico de conceptos y principios de redes de datos: swiches, routers, redes, LAN, WAN, gateway, DMZ, VPN, velocidad de enlaces, entre otros").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosInfraestructuraNivelA = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructura, nivel:nivelCompetenciaA, descripcion:"Experto técnico en infraestructura Microsoft. Tiene conocimiento teórico y práctico a nivel avanzado en Windows Server y sus roles como DNS, DHCP, WDS, DFS, AD, DA, Hyper-V entre otros. Entiende el funcionamiento de un datacenter y una nube privada o publica. Conoce sobre tecnologias en la nube. Tiene la capacidad de diseñar un proyecto de infraestrucutra.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosInfraestructuraNivelB = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructura, nivel:nivelCompetenciaB, descripcion:"Tiene conocimiento práctico de Active Directory, máquinas virtuales, identificacion de problemas de DNS, acceso remoto a servidores, administracion de Windows Server. Identifica Microsoft Servers como: Exchange, TMG, Hyper V, Sharepoint, SQL. Entiende el funcionamiento de GPOs, buenas praticas de directivas y permisos, administracion y configuracion, comprende la interaccion de los servicios en un ambiente o escenario en particular, sabe sobre redes Microsoft y entiende conceptos mas avanzados como cluster, SAN, balanceo, punteros DNS, relay de correo, sitio alterno.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosInfraestructuraNivelC = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructura, nivel:nivelCompetenciaC, descripcion:"Conocimiento de conceptos básicos de infraestructura: que es un dominio, DNS, DHCP, grupos, directivas, virtualizacion, permisos, autenticacion Windows.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosInfraestructuraMicrosoftNivelA = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructuraMicrosoft, nivel:nivelCompetenciaA, descripcion:"Tiene dominio técnico total de al menos uno de los siguientes: Exchange Server, System Center, TMG, Lync Server. Puede realizar implementación, diseño y resolución de problemas avanzados").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosInfraestructuraMicrosoftNivelB = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructuraMicrosoft, nivel:nivelCompetenciaB, descripcion:"Tiene dominio técnico total de Windows Server Windows Server y sus roles y servicios a nivel avanzado. Tiene conocimiento teórico y práctico a nivel intermedio de al menos una de las siguientes soluciones: Exchange Server, System Center, TMG, Lync Server. Puede implementar alguna de estas tecnologías sin problema, así como resolver casos y problemas. Tiene todas las certificaciones Microsoft de al menos una de las soluciones anteriores o Windows Server vigente.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosInfraestructuraMicrosoftNivelC = new CompetenciaNivel(competencia:competenciaConocimientosInfraestructuraMicrosoft, nivel:nivelCompetenciaC, descripcion:"Tiene conocimiento teórico y práctico de Windows Server sus roles y servicios. Puede resolver casos y realizar implementaciones de estos roles sin ningún problema. Tiene al menos una certificación Microsoft de Windows Server vigente. Tiene conocimiento teórico y práctico a nivel básico de al menos uno de los siguientes: Exchange Server, System Center, TMG, Lync Server, Virtualización. Puede implementar alguna de estas tecnologías en escenarios simplificados sin problema.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosSeguridadMcAfeeNivelA = new CompetenciaNivel(competencia:competenciaConocimientosSeguridadMcAfee, nivel:nivelCompetenciaA, descripcion:"Tiene dominio total de las soluciones McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance. Puede resolver casos de soporte de nivel avanzado, realizar implementaciones complejas de las soluciones, integracion de soluciones, diseño de escenarios.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSeguridadMcAfeeNivelB = new CompetenciaNivel(competencia:competenciaConocimientosSeguridadMcAfee, nivel:nivelCompetenciaB, descripcion:"Tiene conocimiento teórico y práctico de McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance a nivel intermedio. Puede resolver casos de soporte de nivel intermedio, implementaciones puntuales de las soluciones. Puede dar presentaciones y charlas sobre las soluciones.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSeguridadMcAfeeNivelC = new CompetenciaNivel(competencia:competenciaConocimientosSeguridadMcAfee, nivel:nivelCompetenciaC, descripcion:"Tiene conocimiento teórico y práctico de McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance a nivel básico. Tiene certificaciones técnicas y MASP al día. Puede resolver casos de soporte de nivel básico, maneja procedimientos de investigacion, elavación de casos, registro, técnicas de resolución de problemas, herramientas y recursos para solucionar problemas.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosSharePointNivelA = new CompetenciaNivel(competencia:competenciaConocimientosSharePoint, nivel:nivelCompetenciaA, descripcion:"Experto técnico en Share Point. Tiene conocimiento teórico y práctico a nivel avanzado en: Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services. Además posee conocimiento avanzado en Integración con sistemas externos, herramientas de redes sociales, construcción de soluciones no-código, automatización de formularios electrónicos, Inteligencia de Negocios, Búsqueda empresarial y Administración de contenido/ Arquitectura de información.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSharePointNivelB = new CompetenciaNivel(competencia:competenciaConocimientosSharePoint, nivel:nivelCompetenciaB, descripcion:"Posee conocimiento práctico y entiende el funcionamiento de: Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services. Posee conocimiento básico de conceptos como: Integración de sistemas externos, construcción de soliciones no-código, automatización de formularios electrónicos, inteligencia de negocios, búsqueda empresarial y Administración de Contenido/ Arquitectura de Información.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSharePointNivelC = new CompetenciaNivel(competencia:competenciaConocimientosSharePoint, nivel:nivelCompetenciaC, descripcion:"Conocimiento de conceptos básicos de sharepoint: que son Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosSolucionesTecnicasEspecialidasNivelA = new CompetenciaNivel(competencia:competenciaConocimientosSolucionesTecnicasEspecialidas, nivel:nivelCompetenciaA, descripcion:"Tiene dominio técnico total de al menos uno de los siguientes: office 365. Puede realizar implementación, diseño y resolución de problemas avanzados. Tiene al menos 1 certificacion de Windows Server vigente.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSolucionesTecnicasEspecialidasNivelB = new CompetenciaNivel(competencia:competenciaConocimientosSolucionesTecnicasEspecialidas, nivel:nivelCompetenciaB, descripcion:"Tiene dominio técnico total de Windows Server Windows Server y sus roles y servicios a nivel avanzado. Tiene conocimiento teórico y práctico a nivel intermedio de al menos una de las siguientes soluciones: Office 365. Puede implementar alguna de estas tecnologías sin problema, así como resolver casos y problemas. Tiene todas las certificaciones Microsoft de al menos una de las soluciones anteriores.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosSolucionesTecnicasEspecialidasNivelC = new CompetenciaNivel(competencia:competenciaConocimientosSolucionesTecnicasEspecialidas, nivel:nivelCompetenciaC, descripcion:"Tiene conocimiento teórico y práctico de Windows Server y sus roles y servicios. Puede resolver casos y realizar implementaciones de estos roles sin ningún problema. Tiene conocimiento teórico y práctico a nivel básico de al menos uno de los siguientes: office 365. Puede implementar alguna de estas tecnologías en escenarios simplificados sin problema.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosContratacionAdministrativaNivelA = new CompetenciaNivel(competencia:competenciaConocimientosContratacionAdministrativa, nivel:nivelCompetenciaA, descripcion:"Domina procedimientos y métodos referidos a Contratación Administrativa, maneja detalladamente los alcances y límites de los instrumentos del derecho de Contratación administrativa, tiene la capacidad de brindar asesoría sobre temas relacionados con su área, tiene la capacidad de darle seguimiento a los procesos desde el inicio hasta la fnalización del procedimiento de Contratación Administrativa, realiza trámites de documentos en Instituciones Públicas, posee la capacidad de realizar análisis y resoluciones de casos concretos.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosContratacionAdministrativaNivelB = new CompetenciaNivel(competencia:competenciaConocimientosContratacionAdministrativa, nivel:nivelCompetenciaB, descripcion:"Posee conocimiento acerca de la normativa, métodos y los procedimientos de Contratación Administrativa, conoce los instrumentos de derecho Administrativo, posee la capacidad para brindar asesoría en casos puntuales, le da seguimiento a los procesos desde el inicio hasta la finalización del proceso de licitaciones.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosContratacionAdministrativaNivelC = new CompetenciaNivel(competencia:competenciaConocimientosContratacionAdministrativa, nivel:nivelCompetenciaC, descripcion:"Posee conocimiento acerca de la normativa y los procesos de Contratación Administrativa, tiene la capacidad de ejecutar las contrataciones desde las etapas de actos preparatorios hasta la etapa contractual.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosTelemarketingNivelA = new CompetenciaNivel(competencia:competenciaConocimientosTelemarketing, nivel:nivelCompetenciaA, descripcion:"Posee la capacidad para crear y generar oportunidades con clientes, domina y es muy efectivo en cierres de negocio, planifica con total efectividad el orden de las llamadas, utiliza técnicas agresivas de mercadeo telefónico.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosTelemarketingNivelB = new CompetenciaNivel(competencia:competenciaConocimientosTelemarketing, nivel:nivelCompetenciaB, descripcion:"Es muy eficiente generando nuevas oportunidades de venta y cerrando nuevos negocios por medio telefónico, posee la capacidad para clasificar el orden de las llamadas y acciones a realizar. Aplica técnicas específicas para atender los distintos tipos de clientes y según los productos o servicios. Conoce técnicas de mercadeo telefónico.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosTelemarketingNivelC = new CompetenciaNivel(competencia:competenciaConocimientosTelemarketing, nivel:nivelCompetenciaC, descripcion:"Tiene la capacidad para realizar venta telefónica de servicios y productos, capacidad para generar nuevos negocios, mantener cartera activa de clientes y en ocasiones capacidad de cierre de negocios.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosVentasEfectivasNivelA = new CompetenciaNivel(competencia:competenciaConocimientosVentasEfectivas, nivel:nivelCompetenciaA, descripcion:"Domina diferentes técnicas de ventas y las aplica según los casos con el fin de crear nuevas oportunidades, aumentar la cartera de clientes, dominio del proceso de ventas, específicamente las ventas consultivas, aplica exitosamente técnicas de cierre. Manejo exitoso de los clientes. Realización adecuada de forecasts y cumplimiento del mismo. Conocimiento y análisis de la competencia.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosVentasEfectivasNivelB = new CompetenciaNivel(competencia:competenciaConocimientosVentasEfectivas, nivel:nivelCompetenciaB, descripcion:"Posee la capacidad para aplicar técnicas de ventas con el fin de crear nuevas oportunidades, aumentar la cartera de clientes, conoce y aplica el proceso de ventas, específicamente las ventas consultivas, maneja técnicas de cierre. Tiene la capacida de realizar forecasts y normalmente cumple con el mismo. Conoce la competencia.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosVentasEfectivasNivelC = new CompetenciaNivel(competencia:competenciaConocimientosVentasEfectivas, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para crear nuevas oportunidades, aumentar la cartera de clientes y cerrar negocios. Tiene conocimiento del proceso de venta, realiza forecast y alguna veces lo cumple. Conoce la competencia.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosBackOfficeNivelA = new CompetenciaNivel(competencia:competenciaConocimientosBackOffice, nivel:nivelCompetenciaA, descripcion:"Capacidad para analizar, gestionar y tramitarr documentos internos y externos relacionados con el ámbito comercial de la compañía, domina técnicas para darle un tratamiento informático a la información. Domina la capacidad para clasificar, registrar y archivar comunicaciones y documentos según las técnicas apropiadas y los parámetros establecidos en la compañía. Desempeña con efectividad actividades de atención al cliente en el ámbito comercial asegurando los niveles de calidad y relacionados con la imagen de la empresa. Conoce las operaciones administrativas comerciales de la empresa. Posee conocimientos en contratación administrativa.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosBackOfficeNivelB = new CompetenciaNivel(competencia:competenciaConocimientosBackOffice, nivel:nivelCompetenciaB, descripcion:"Capacidad para elaborar, gestionar y tramitar documentos internos y externos en el ámbito comercial, elabora comunicaciones e informes, según necesidadad. Capacidad para clasificar, registrar y archivar comunicaciones y documentos según las técnicas apropiadas y los parámetros establecidos en la compañía. Desempeña con efectividad actividades de atención al cliente en el ámbito comercial asegurando los niveles de calidad y relacionados con la imagen de la empresa.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosBackOfficeNivelC = new CompetenciaNivel(competencia:competenciaConocimientosBackOffice, nivel:nivelCompetenciaC, descripcion:"Posee la capacidad para tramitar documentos e informes cuando se le solicita. Tiene capacidad para clasificar, registrar y archivar comunicaciones y documentos según los parámetros establecidos en la compañía. Desempeña actividades de atención al cliente en el ámbito comercial.").save(failOnError:true)
		
		CompetenciaNivel competenciaConocimientosContablesNivelA = new CompetenciaNivel(competencia:competenciaConocimientosContables, nivel:nivelCompetenciaA, descripcion:"Posee la capacidad para recabar la información del medio y analizarla para posteriormente aplicar técnicas contables, interpretar y registrar los efectos de las transacciones que realiza la empresa, determinar los distintos subtotales y totales que son útiles para la toma de decisiones y analiza e interpreta Estados Financieros.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosContablesNivelB = new CompetenciaNivel(competencia:competenciaConocimientosContables, nivel:nivelCompetenciaB, descripcion:"Capacidad para entender la información contable y aplicarla, conoce y en ocasiones utiliza técnicas contables, es capaz de determinar los subtotales y totales que son necesarios para la toma de decisiones, puede entender Estados Financieros.").save(failOnError:true)
		CompetenciaNivel competenciaConocimientosContablesNivelC = new CompetenciaNivel(competencia:competenciaConocimientosContables, nivel:nivelCompetenciaC, descripcion:"Capacidad para utilizar información contable, conoce las técnicas contables pero no las aplica.").save(failOnError:true)
		
		CompetenciaNivel competenciaDireccionEquiposNivelA = new CompetenciaNivel(competencia:competenciaDireccionEquipos, nivel:nivelCompetenciaA, descripcion:"Capacidad para diseñar e implantar métodos de trabajo que promuevan la dirección de equipos eficaces para una mejor consecución de las metas corporativas. Capacidad para seleccionar a los integrantes de los equipos de trabajo y alentar este tipo de prácticas entre los niveles directivos de la organización. Capacidad para integrar, desarrollar, consolidar y conducir uno o varios equiposde trabajo y alentar a sus integrantes a actuar con autonomía y responsabilidad. Capacidad para desarrollar el talento y potencial de su gente y brindar retroalimentación oportuna sobre el desempeño Capacidad para coordinar y distribuir las tareas y prioridades en función de las competencias y conocimientos de los integrantes del o los equipos a su cargo y de los objetivos que se desee alcanzar. Implica estipular plazos de cumplimiento y dirigir las acciones de los equipos hacia una meta u objetivo determinado.").save(failOnError:true)
		CompetenciaNivel competenciaDireccionEquiposNivelB = new CompetenciaNivel(competencia:competenciaDireccionEquipos, nivel:nivelCompetenciaB, descripcion:"Capacidad para seleccionar a los integrantes de los equipos de trabajo y fijar metas. Capacidad para integrar, desarrollar, consolidar y conducir un equipo de trabajo, y alentar a sus integrantes a actuar con autonomía y responsabilidad. Capacidad para desarrollar el talento y potencial de su gente y brindar retroalimentación oportuna sobre el desempeñoCapacidad para coordinar, distribuir y delegar las tareas y prioridades en función de las competencias y conocimientos de los colaboradores y los objetivos que se desee alcanzar. Implica estipular plazos de cumplimiento y dirigir las acciones del equipo hacia una meta u objetivo determinado.").save(failOnError:true)
		CompetenciaNivel competenciaDireccionEquiposNivelC = new CompetenciaNivel(competencia:competenciaDireccionEquipos, nivel:nivelCompetenciaC, descripcion:"Capacidad para integrar y conducir un equipo de trabajo alentando a sus integrantes a actuar con responsabilidad.Capacidad para brindar una retroalimentación a sus integrantes. Capacidad para coordinar, distribuir y delegar tareas en función de las competencias y conocimientos de los colaboradores, estipular plazos de cumplimiento y dirigir las acciones del equipo hacia una meta u objetivo determinado.").save(failOnError:true)
		
		CompetenciaNivel competenciaLiderazgoNivelA = new CompetenciaNivel(competencia:competenciaLiderazgo, nivel:nivelCompetenciaA, descripcion:"Capacidad para diseñar estrategias, procesos, cursos de acción y métodos de trabajo con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento, y al mismo tiempo, lograr el compromiso y el respaldo de las distintas áreas que componen la organización para alcanzar la estrategia. Implica lograr y mantener un clima organizacional armónico, desafiante y ser un referente por su liderazgo, capacidad para desarrollar a los otros en el marco de la organización, con una visión y proyección de largo plazo.").save(failOnError:true)
		CompetenciaNivel competenciaLiderazgoNivelB = new CompetenciaNivel(competencia:competenciaLiderazgo, nivel:nivelCompetenciaB, descripcion:"Capacidad para diseñar estrategias, procesos, cursos de acción y métodos de trabajo con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento, y al mismo tiempo, lograr el compromiso y el respaldo de sus superiores a fin de enfrentar con éxito los desafíos propuestos para su área. Implica promover y mantener un clima organizacional armónico y desafiante, ser un ejemplo dentro de la organización por su liderazgo y capacidad para desarrollar a los otros, con una visión y proyección de mediano plazo.").save(failOnError:true)
		CompetenciaNivel competenciaLiderazgoNivelC = new CompetenciaNivel(competencia:competenciaLiderazgo, nivel:nivelCompetenciaC, descripcion:"Capacidad para proponer cursos de acción y nuevas formas de hacer las cosas con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento y al mismo tiempo, lograr el compromiso y el respaldo de sus superiores a fin de enfrentar con éxito los desafíos del equipo a su cargo. Implica propiciar un clima organizacional armónico y desafiante y ser un ejemplo para su entorno próximo por su liderazgo y capacidad de desarrollar a los otros, con una visión y proyección de corto plazo.").save(failOnError:true)
		
		CompetenciaNivel competenciaTomaDecisionesNivelA = new CompetenciaNivel(competencia:competenciaTomaDecisiones, nivel:nivelCompetenciaA, descripcion:"Capacidad para encarar el proceso de toma de decisiones, mediante la elección sistemática de opciones viables y convenientes, considerar las circunstancias existentes, los recursos disponibles y su impacto en la compañía. Capacidad para convencer a sus colaboradores de la necesidad de generar opciones múltiples frente a cada situación a resolver y especialmente ante cuestiones críticas o sensibles para la organización. Capacidad para establecer mecanismos de selección opciones que contemplen el mejor resultado, desde diversos puntos de vista, en función de los objetivos organizacionales. Implica capacidad para controlar el desarrollo de las opciones elegidas para asegurarse de que respetan las pautas de calidad y oportunidad fijadas, y tomar conciencia de sus posibles consecuencias.").save(failOnError:true)
		CompetenciaNivel competenciaTomaDecisionesNivelB = new CompetenciaNivel(competencia:competenciaTomaDecisiones, nivel:nivelCompetenciaB, descripcion:"Capacidad para tomar decisiones mediante el desarrollo de opciones viables y convenientes, considerar las circunstancias existentes, los recursos disponibles y su impacto en la compañía. Capacidad para generar opciones múltiples frente a cada situación a resolver, y especialmente ante cuestiones críticas para la organización. Capacidad para aplicar el mecanismo de selección de opciones establecido, a fin de obtener el mejor resultados, desde diversos puntos de vista, en funcipón de los objetivos organizacionales. Implica capacidad para ejecutar y supervisar las opciones elegidas con calidad y oportunidad.").save(failOnError:true)
		CompetenciaNivel competenciaTomaDecisionesNivelC = new CompetenciaNivel(competencia:competenciaTomaDecisiones, nivel:nivelCompetenciaC, descripcion:"Capacidad para generar más de una opción frente a cada situación a resolver, aplicar el mecanismo de selección de opciones establecido y ejecutar las opciones elegidas según los procedimientos vigentes.").save(failOnError:true)
		
		CompetenciaNivel competenciaVisionEstrategicaNivelA = new CompetenciaNivel(competencia:competenciaVisionEstrategica, nivel:nivelCompetenciaA, descripcion:"Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización. Capacidad par diseñar procedimientos que permitan, al mismo tiempo optimizar la utilización de las fortalezas y actuar sobre las debilidades, con el propósito de aprovechar las oportunidades del contexto. Implica la capacidad para fijar la visión de la organización y conducirla como un sistema integral, para que en conjunto pueda lograr objetivos y metas retadoras, asociados a los objetivos corporativos.").save(failOnError:true)
		CompetenciaNivel competenciaVisionEstrategicaNivelB = new CompetenciaNivel(competencia:competenciaVisionEstrategica, nivel:nivelCompetenciaB, descripcion:"Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización. Habilidad para modificar procedimientos en el área a su cargo a fin de optimizar fortalezas y actuar sobre las debilidades, a partir de la consideración de las oportunidades que ofrece el contexto. Implica la capacidad para conducir el área bajo su responsabilidad y tener en cuenta que la organización es un sistema integral, donde las acciones y resultados de un sector repercuten sobre el conjunto. Capacidad para comprender que el objetivo último es alcanzar metas retadoras asociadas a la estrategia corporativa.").save(failOnError:true)
		CompetenciaNivel competenciaVisionEstrategicaNivelC = new CompetenciaNivel(competencia:competenciaVisionEstrategica, nivel:nivelCompetenciaC, descripcion:"Capacidad para comprender los cambios del entorno y establecer su impacto en la organización a corto y mediano plazo. Habilidad para proponer mejoras sobre aspectos relacionados con su ámbito de actuación, a fin de mejorar la utilización de los recursos y fortalezas, y reducir las debilidades. Capacidad para actuar y/o conducir al grupo a su cargo bajo la visualización de la empresa y su área específica como sistemas integrados.").save(failOnError:true)
		
		
		println "Creando Bandas"
		BandaProfesional banda1 = new BandaProfesional(nombre:"Banda I").save(failOnError:true)
		BandaProfesional banda2 = new BandaProfesional(nombre:"Banda II").save(failOnError:true)
		BandaProfesional banda3 = new BandaProfesional(nombre:"Banda III").save(failOnError:true)
		BandaProfesional banda4 = new BandaProfesional(nombre:"Banda IV").save(failOnError:true)
		BandaProfesional banda5 = new BandaProfesional(nombre:"Banda V").save(failOnError:true)
			
		println "Creando Niveles Profesionales"
		NivelProfesional nivelProfesional1 = new NivelProfesional(nombre:"Nivel 1").save(failOnError:true)
		NivelProfesional nivelProfesional2 = new NivelProfesional(nombre:"Nivel 2").save(failOnError:true)
		NivelProfesional nivelProfesional3 = new NivelProfesional(nombre:"Nivel 3").save(failOnError:true)
			
		println "Creando Banda Nivel Profesional Posicion"
		BandaProfesional bp = banda5
		NivelProfesional np = nivelProfesional2
		BandaNivelPosicion puestoTeleMercadeo52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTelemercadeo,departamento:deptDesarrolloNegocios,minSalario:600F, maxSalario:750F).save(failOnError:true)	
		BandaNivelPosicion puestoBackOffice52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionBackOffice, departamento:deptDesarrolloNegocios,minSalario:600F, maxSalario:750F).save(failOnError:true)
		BandaNivelPosicion puestoAnalistaGestionPotencialHumano52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaGestionPotenciaHumano, departamento: deptPotencialHumano,minSalario:600F, maxSalario:750F).save(failOnError:true)	
		BandaNivelPosicion puestoAsistenteGerencia52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteGerencia, departamento: deptGerencia,minSalario:600F, maxSalario:750F).save(failOnError:true)
		BandaNivelPosicion puestoHelpDesk52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionHelpDesk, departamento: deptConsultoria,minSalario:600F, maxSalario:750F).save(failOnError:true)
		BandaNivelPosicion puestoEspacialistatecnico52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaTecnico, departamento: deptConsultoria,minSalario:600F, maxSalario:750F).save(failOnError:true)
		BandaNivelPosicion puestoAuxiliarAdministrativo52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAuxiliarAdministrativo, departamento: deptFinanciero,minSalario:600F, maxSalario:750F).save(failOnError:true)
		BandaNivelPosicion puestoMensajero52 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionMensajero, departamento: deptFinanciero,minSalario:500F, maxSalario:650F).save(failOnError:true)
		
		np = nivelProfesional1
		BandaNivelPosicion puestoTeleMercadeo51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTelemercadeo,departamento:deptDesarrolloNegocios,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoBackOffice51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionBackOffice, departamento:deptDesarrolloNegocios,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoLicitaciones51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionLicitaciones, departamento:deptDesarrolloNegocios,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaCompetencias51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaCompetencias, departamento:deptDesarrolloNegocios,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoMercadeo51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionMercadeo, departamento:deptDesarrolloNegocios,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoAnalistaGestionPotencialHumnao51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaGestionPotenciaHumano, departamento:deptPotencialHumano,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoAsistenteGerencia51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteGerencia, departamento:deptGerencia,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoHelpDesk51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionHelpDesk, departamento:deptConsultoria,minSalario:750F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaTecnico51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaTecnico, departamento:deptConsultoria,minSalario:750F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoAuxiliarAdministrativo51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAuxiliarAdministrativo, departamento:deptFinanciero,minSalario:750F, maxSalario:850F).save(failOnError:true)
		BandaNivelPosicion puestoMensajero51 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionMensajero, departamento:deptFinanciero,minSalario:750F, maxSalario:800F).save(failOnError:true)
		
		bp = banda4
		np = nivelProfesional2
		BandaNivelPosicion puestoLicitaciones42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionLicitaciones, departamento:deptDesarrolloNegocios,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoDesarrolladorNegociosJr42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionDesarrolladorNegociosJr, departamento:deptDesarrolloNegocios,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoTelemercadeo42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTelemercadeo, departamento:deptDesarrolloNegocios,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaCompetencias42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaCompetencias, departamento:deptDesarrolloNegocios,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoMercadeo42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionMercadeo, departamento:deptDesarrolloNegocios,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoAnalistaGestionPotencialHumnano42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaGestionPotenciaHumano, departamento:deptPotencialHumano,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoAsistenteGerencia42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteGerencia, departamento:deptGerencia,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		BandaNivelPosicion puestoConsultorJr42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionConsultorJr, departamento:deptConsultoria,minSalario:1000F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoAsistenteFinanciero42 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteFinanciero, departamento:deptFinanciero,minSalario:850F, maxSalario:1000F).save(failOnError:true)
		
		np = nivelProfesional1
		BandaNivelPosicion puestoLicitaciones41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionLicitaciones, departamento:deptDesarrolloNegocios,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		BandaNivelPosicion puestoDesarrolladorNegociosJr41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionDesarrolladorNegociosJr, departamento:deptDesarrolloNegocios,minSalario:1000F, maxSalario:1200F).save(failOnError:true)		
		BandaNivelPosicion puestoEspecialistaCompetencias41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaCompetencias, departamento:deptDesarrolloNegocios,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		BandaNivelPosicion puestoMercadeo41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionMercadeo, departamento:deptDesarrolloNegocios,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		BandaNivelPosicion puestoAnalistaGestionPotencialHumano41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaGestionPotenciaHumano, departamento:deptPotencialHumano,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		BandaNivelPosicion puestoAsistenteGerencia41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteGerencia, departamento:deptGerencia,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		BandaNivelPosicion puestoConsultorJr41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionConsultorJr, departamento:deptConsultoria,minSalario:1400F, maxSalario:1800F).save(failOnError:true)
		BandaNivelPosicion puestoAsistenteFinanciero41 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAsistenteFinanciero, departamento:deptFinanciero,minSalario:1000F, maxSalario:1200F).save(failOnError:true)
		
		bp = banda3
		np = nivelProfesional2
		BandaNivelPosicion puestoDesarrolladorNegociosSr32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionDesarrolladorNegociosSr, departamento:deptDesarrolloNegocios,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoExpertoLicitaciones32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionExpertoLicitaciones, departamento:deptDesarrolloNegocios,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaCompetencias32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaCompetencias, departamento:deptDesarrolloNegocios,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaMercadeo32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaMercadeo, departamento:deptDesarrolloNegocios,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaPotencialHumano32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaGestionPotencialHumano, departamento:deptPotencialHumano,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		BandaNivelPosicion puestoConsultorSenior32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionConsultroSenior, departamento:deptConsultoria,minSalario:1800G, maxSalario:2200F).save(failOnError:true)
		BandaNivelPosicion puestoAnalistaFinanciero32 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaFinanciero, departamento:deptFinanciero,minSalario:1200F, maxSalario:1400F).save(failOnError:true)
		
		np = nivelProfesional1
		BandaNivelPosicion puestoDesarrolladorNegociosSr31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionDesarrolladorNegociosSr, departamento:deptDesarrolloNegocios,minSalario:1400F, maxSalario:1800F).save(failOnError:true)
		BandaNivelPosicion puestoEspecialistaCompetencias31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaCompetencias, departamento:deptDesarrolloNegocios,minSalario:1400F, maxSalario:1800F).save(failOnError:true)		
		BandaNivelPosicion puestoMercadeo31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaMercadeo, departamento:deptDesarrolloNegocios,minSalario:1400F, maxSalario:1800F).save(failOnError:true)		
		BandaNivelPosicion puestoEspecialistaGestionPotenciaHumano31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionEspecialistaGestionPotencialHumano, departamento:deptPotencialHumano,minSalario:1400F, maxSalario:1800F).save(failOnError:true)		
		BandaNivelPosicion puestoConsultorSr31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionConsultroSenior, departamento:deptConsultoria,minSalario:2200G, maxSalario:2400F).save(failOnError:true)
		BandaNivelPosicion puestoTeamLeader31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTeamLeader, departamento:deptConsultoria,minSalario:2400F, maxSalario:2600F).save(failOnError:true)		
		BandaNivelPosicion puestoAnalistaFinanciero31 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionAnalistaFinanciero, departamento:deptFinanciero,minSalario:1400F, maxSalario:1800F).save(failOnError:true)
		
		bp = banda2
		np = nivelProfesional2
		BandaNivelPosicion puestoKeyAccountManagerProductManager22 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionKeyAccountManagerProductManager, departamento:deptDesarrolloNegocios,minSalario:1800F, maxSalario:2400F).save(failOnError:true)
		BandaNivelPosicion puestoTeamLeader22 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTeamLeader, departamento:deptConsultoria,minSalario:2600F, maxSalario:3000F).save(failOnError:true)
		BandaNivelPosicion puestoArquitectoSoluciones22 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionArquitectoSoluciones, departamento:deptConsultoria,minSalario:2600F, maxSalario:3000F).save(failOnError:true)
		
		np = nivelProfesional1
		BandaNivelPosicion puestoKeyAccountManagerProductManager21 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionKeyAccountManagerProductManager, departamento:deptDesarrolloNegocios,minSalario:2400F, maxSalario:3000F).save(failOnError:true)
		BandaNivelPosicion puestoTeamLeader21 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionTeamLeader, departamento:deptConsultoria,minSalario:3000F, maxSalario:3400F).save(failOnError:true)
		BandaNivelPosicion puestoArquitectoSoluciones21 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionArquitectoSoluciones, departamento:deptConsultoria,minSalario:3000F, maxSalario:3400F).save(failOnError:true)
		
		bp = banda1
		np = nivelProfesional3
		BandaNivelPosicion puestoManager13 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionManager, departamento:deptGerencia,minSalario:2000F, maxSalario:2800F).save(failOnError:true)
		BandaNivelPosicion puestoCoreManager13 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionCoreManager, departamento:deptGerencia,minSalario:2400F, maxSalario:3200F).save(failOnError:true)
		
		np = nivelProfesional2
		BandaNivelPosicion puestoManager12 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionManager, departamento:deptGerencia,minSalario:2800F, maxSalario:3600F).save(failOnError:true)
		BandaNivelPosicion puestoCoreManager12 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionCoreManager, departamento:deptGerencia,minSalario:3200F, maxSalario:4000F).save(failOnError:true)
		
		np = nivelProfesional1
		BandaNivelPosicion puestoManager11 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionManager, departamento:deptGerencia,minSalario:3600F, maxSalario:4400F).save(failOnError:true)
		BandaNivelPosicion puestoCoreManager11 = new BandaNivelPosicion(banda:bp,nivel:np,posicion:posicionCoreManager, departamento:deptGerencia,minSalario:4000F, maxSalario:4800F).save(failOnError:true)
		
		
		println "Creando Bandas Nivel Posicion Competencia Nivel"
		//BandaNivelPosicionCompetenciaNivel bandaNivelPosicionCompetenciaNivel1 = new BandaNivelPosicionCompetenciaNivel(posicion: puestoTeleMercadeo52, competenciaNivel: competenciaAnalisisYsolucionDeProblemasNivelA).save(failOnError:true)
		//BandaNivelPosicionCompetenciaNivel bandaNivelPosicionCompetenciaNivel2 =  new BandaNivelPosicionCompetenciaNivel(posicion: puestoTeleMercadeo52, competenciaNivel: competenciaAtencionDetalleNivelB).save(failOnError:true)
		//BandaNivelPosicionCompetenciaNivel bandaNivelPosicionCompetenciaNivel3 =  new BandaNivelPosicionCompetenciaNivel(posicion: puestoTeleMercadeo52, competenciaNivel: competenciaAnalisisYsolucionDeProblemasNivelC).save(failOnError:true)
		//BandaNivelPosicionCompetenciaNivel bandaNivelPosicionCompetenciaNivel4 =  new BandaNivelPosicionCompetenciaNivel(posicion: bandaNivelPosicion3, competenciaNivel: competenciaNivel2D).save(failOnError:true)
		//BandaNivelPosicionCompetenciaNivel bandaNivelPosicionCompetenciaNivel5 = new BandaNivelPosicionCompetenciaNivel(posicion: puestoTeleMercadeo52, competenciaNivel: competenciaCapacidadNegociacionNivelA).save(failOnError:true)
			
		BandaNivelPosicion p = puestoDesarrolladorNegociosJr42
		CompetenciaNivel cn =  competenciaOrientacionAlClienteNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia1 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia2 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia3 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia4 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosVentasEfectivasNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia5 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia6 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoDesarrolladorNegociosJr41
		cn =  competenciaOrientacionAlClienteNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia7 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia8 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia9 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia10 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosVentasEfectivasNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia11 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia12 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoDesarrolladorNegociosSr32
		cn =  competenciaOrientacionAlClienteNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia13 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia14 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia15 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia16 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosVentasEfectivasNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia17 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia18 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoDesarrolladorNegociosSr31
		cn =  competenciaOrientacionAlClienteNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia19 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia20 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia21 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia22 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosVentasEfectivasNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia23 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia24 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoLicitaciones51
		cn =  competenciaToleranciaPresionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia25 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia26 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaTrabajoEnEquipoNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia27 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia28 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia29 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosContratacionAdministrativaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia30 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia37 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoLicitaciones42
		cn =  competenciaToleranciaPresionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia31 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia32 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaTrabajoEnEquipoNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia33 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia34 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia35 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosContratacionAdministrativaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia36 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia38 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoLicitaciones41
		cn =  competenciaToleranciaPresionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia39 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia40 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaTrabajoEnEquipoNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia41 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia42 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia43 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosContratacionAdministrativaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia44 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia45 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoExpertoLicitaciones32
		cn =  competenciaToleranciaPresionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia46 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia47 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaTrabajoEnEquipoNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia48 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia49 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia50 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosContratacionAdministrativaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia51 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia52 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaCompetencias51
		cn =  competenciaOrientacionAlClienteNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia53 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia54 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia55 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia56 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia57 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia58 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaCompetencias42
		cn =  competenciaOrientacionAlClienteNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia59 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia60 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia61 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia62 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia63 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia64 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaCompetencias41
		cn =  competenciaOrientacionAlClienteNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia65 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia66 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia67 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia68 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia69 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia70 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaCompetencias32
		cn =  competenciaOrientacionAlClienteNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia71 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia72 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia73 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia74 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia75 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia76 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaCompetencias31
		cn =  competenciaOrientacionAlClienteNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia77 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaComunicacionEficazNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia78 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaCapacidadNegociacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia79 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia80 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaOrganizacionYPlanificacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia81 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia82 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoMercadeo51
		cn =  competenciaOrientacionAlLogroNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia83 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia84 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaIniciativaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia85 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosTelemarketingNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia86 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia87 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoMercadeo42
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia88 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia89 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaIniciativaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia90 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosTelemarketingNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia91 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia92 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoMercadeo41
		cn =  competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia93 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia94 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaIniciativaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia95 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosTelemarketingNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia96 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia97 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoEspecialistaMercadeo32
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia98 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia99 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaIniciativaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia100 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosTelemarketingNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia101 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia102 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoMercadeo31
		cn =  competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia103 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaAtencionDetalleNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia104 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaIniciativaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia105 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosTelemarketingNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia106 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn =  competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia107 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		
		p = puestoManager13
		cn = competenciaTomaDecisionesNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia108 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaLiderazgoNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia109 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaDireccionEquiposNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia110 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia111 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia112 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaVisionEstrategicaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia113 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
				
		p = puestoManager12
		cn = competenciaTomaDecisionesNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia114 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaLiderazgoNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia115 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaDireccionEquiposNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia116 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia117 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia118 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaVisionEstrategicaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia119 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)		
		
		p = puestoManager11
		cn = competenciaTomaDecisionesNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia120 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaLiderazgoNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia121 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaDireccionEquiposNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia122 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia123 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaCapacidadNegociacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia124 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaVisionEstrategicaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia125 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoKeyAccountManagerProductManager22
		cn = competenciaOrientacionAlClienteNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia126 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaComunicacionEficazNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia127 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaCapacidadNegociacionNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia128 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaOrientacionAlLogroNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia129 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaTomaDecisionesNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia130 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia131 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaVisionEstrategicaNivelC
		BandaNivelPosicionCompetenciaNivel puestoCompetencia132 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		p = puestoKeyAccountManagerProductManager21
		cn = competenciaOrientacionAlClienteNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia133 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaComunicacionEficazNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia134 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaCapacidadNegociacionNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia135 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaOrientacionAlLogroNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia136 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaTomaDecisionesNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia137 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaConocimientosProductosCompaniaNivelA
		BandaNivelPosicionCompetenciaNivel puestoCompetencia138 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		cn = competenciaVisionEstrategicaNivelB
		BandaNivelPosicionCompetenciaNivel puestoCompetencia139 = new BandaNivelPosicionCompetenciaNivel(posicion: p, competenciaNivel: cn).save(failOnError:true)
		
		
		println "Creando Proveedores"
		Proveedor prov1 = new Proveedor(nombre:"Academia Computón SA").save(failOnError:true)
		Proveedor prov2 = new Proveedor(nombre:"Formación Interna").save(failOnError:true)
				
		println "Creando cursos"
		Curso curso1 = new Curso(nombre:"Iniciación a Grails", descripcion: loreIpsumCorto, proveedor: prov1, moneda: mon1, duracion: 40, costo: 100, tipo: "Online").save(failOnError:true)	
		Curso curso2 = new Curso(nombre:"Desarrollo Aplicaciones Web", descripcion: loreIpsumCorto, proveedor: prov2, moneda: mon2, duracion: 80, costo: 250, tipo: "Presencial", observacion:"observacion curso bla bla bla bla").save(failOnError:true)
		Curso curso3 = new Curso(nombre:"Liderazgo para Managers", descripcion: loreIpsumCorto, proveedor: prov2, moneda: mon2, duracion: 120, costo: 250, tipo: "Presencial", observacion:"Curso orientado a mejorar el liderazgo de los asistentes...").save(failOnError:true)
		
		
		println "Creando cursos competencias nivel"
		CursoCompetenciaNivel cursoCompetenciaNivel1 = new CursoCompetenciaNivel(curso:curso1, competenciaNivel:competenciaAnalisisYsolucionDeProblemasNivelB).save(failOnError:true)
		//CursoCompetenciaNivel cursoCompetenciaNivel2 =  new CursoCompetenciaNivel(curso:curso1, competenciaNivel:competenciaNivel2D).save(failOnError:true)
		CursoCompetenciaNivel cursoCompetenciaNivel3 =  new CursoCompetenciaNivel(curso:curso2, competenciaNivel:competenciaAnalisisYsolucionDeProblemasNivelC).save(failOnError:true)
		CursoCompetenciaNivel cursoCompetenciaNivel4 =  new CursoCompetenciaNivel(curso:curso2, competenciaNivel:competenciaAtencionDetalleNivelB).save(failOnError:true)
		CursoCompetenciaNivel cursoCompetenciaNivel5 =  new CursoCompetenciaNivel(curso:curso3, competenciaNivel:competenciaLiderazgoNivelB).save(failOnError:true)
		CursoCompetenciaNivel cursoCompetenciaNivel6 =  new CursoCompetenciaNivel(curso:curso3, competenciaNivel:competenciaComunicacionEficazNivelC).save(failOnError:true)
		
		println "Creando convocatorias cursos"
		CursoHorario cursoHorario1 = new CursoHorario(fechaInicio:new Date(), fechaFin:new Date("06/30/2013"), detalleHorario:"LMX 17-20", curso:curso1).save(failOnError:true)
		//curso1.convocatorias.add(cursoHorario1)
		//curso1.save(failOnError:true)
		
		println "Creando Colaborador curso Estado"
		ColaboradorCursoEstado colaboradorCursoEstado1 = new ColaboradorCursoEstado(nombre:"Matriculado").save(failOnError:true)
		ColaboradorCursoEstado colaboradorCursoEstado2 = new ColaboradorCursoEstado(nombre:"Aprobado").save(failOnError:true)
		ColaboradorCursoEstado colaboradorCursoEstado3 = new ColaboradorCursoEstado(nombre:"Reprobado").save(failOnError:true)
				
	 	println "Creando centros educativos"
		CentroEducativo centroUAH = new CentroEducativo(nombre:"Universidad de Alcalá de Henares", pais:"Esp").save(failOnError:true)
		CentroEducativo centroUCM = new CentroEducativo(nombre:"Universidad Complutense de Madrid", pais:"Esp").save(failOnError:true)
		CentroEducativo centro3 = new CentroEducativo(nombre:"Universidad Politécnica de Madrid", pais:"CR").save(failOnError:true)
		CentroEducativo centro4 = new CentroEducativo(nombre:"Universidad de Costa Rica", pais:"CR").save(failOnError:true)
		CentroEducativo centroUL = new CentroEducativo(nombre:"Universidad Latina", pais:"CR").save(failOnError:true)
		CentroEducativo centro6 = new CentroEducativo(nombre:"Instituto Tecnológico de Costa Rica", pais:"CR").save(failOnError:true)
		
		println "Creando perfiles"
		def adminPerfil = Perfil.findByAuthority("ROLE_ADMIN") ?: new Perfil(authority:"ROLE_ADMIN").save(failOnError:true)
		def usuarioPerfil = Perfil.findByAuthority("ROLE_USUARIO") ?: new Perfil(authority:"ROLE_USUARIO").save(failOnError:true)
		def rrhhPerfil = Perfil.findByAuthority("ROLE_CapitalHumano") ?: new Perfil(authority:"ROLE_CapitalHumano").save(failOnError:true)
		def gerenciaPerfil = Perfil.findByAuthority("ROLE_Gerencia") ?: new Perfil(authority:"ROLE_Gerencia").save(failOnError:true)
		def suplantarPerfil = Perfil.findByAuthority("ROLE_Suplantar") ?: new Perfil(authority:"ROLE_Suplantar").save(failOnError:true)
		def anuncionsRole = Perfil.findByAuthority("ROLE_Anuncios") ?: new Perfil(authority:"ROLE_Anuncios").save(failOnError:true)

		println "Creando admin"
		Usuario admin = new Usuario(username: "admin", enabled: true, password: "admin1", email: "admin@admin.com").save(failOnError:true)		
			if (!admin.authorities.contains(usuarioPerfil)) {
			UsuarioPerfil.create admin, usuarioPerfil, true
		}
		if (!admin.authorities.contains(adminPerfil)) {
			UsuarioPerfil.create admin, adminPerfil, true
		}
		
		println "Creando Colaboradores."
		Colaborador colJesus = new Colaborador(username:"jesusrodriguezm",password:"admin1", posicion:puestoManager11, primerNombre:"Jesus", segundoNombre:"", apellidos:"Rodriguez", email:"jesusrodriguezm@gmail.com", departamento:deptGerencia,telefono:"111-11-11",fechaNacimiento:new Date("03/26/1981"),comentarios:"",enabled: true, accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colJesus.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colJesus, usuarioPerfil, true}
		if (!colJesus.authorities.contains(gerenciaPerfil)) {UsuarioPerfil.create colJesus, gerenciaPerfil, true}
		
		Colaborador colMaria = new Colaborador(username:"mariap",password:"admin1", posicion:puestoEspecialistaPotencialHumano32, primerNombre:"Maria", segundoNombre:"", apellidos:"Perez", email:"maria@gmail.com", departamento:deptPotencialHumano,telefono:"222-22-22",fechaNacimiento:new Date("02/15/1985"),comentarios:"",enabled: true, accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colMaria.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colMaria, usuarioPerfil, true}
		if (!colMaria.authorities.contains(rrhhPerfil)) {UsuarioPerfil.create colMaria, rrhhPerfil, true}
		if (!colMaria.authorities.contains(anuncionsRole)) {UsuarioPerfil.create colMaria, anuncionsRole, true}
		
		Colaborador colaboradorLicitaciones51 = new Colaborador(username:"juanh",password:"admin1", posicion:puestoLicitaciones51, primerNombre:"Juan", segundoNombre:"", apellidos:"Hernandez", email:"usuario1@gmail.com", departamento:deptConsultoria,telefono:"333-33-33",fechaNacimiento:new Date("07/16/1979"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorLicitaciones51.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorLicitaciones51, usuarioPerfil, true}
		Colaborador colaboradorMercadeo31 = new Colaborador(username:"pilarc",password:"admin1", posicion:puestoMercadeo31, primerNombre:"Pilar", segundoNombre:"", apellidos:"Castillo", email:"usuario2@gmail.com", departamento:deptDesarrolloNegocios,telefono:"111-11-11",fechaNacimiento:new Date("12/11/1984"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorMercadeo31.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorMercadeo31, usuarioPerfil, true}
		Colaborador colaboradorDesNegociosSr31 = new Colaborador(username:"luish",password:"admin1", posicion:puestoDesarrolladorNegociosSr31, primerNombre:"Luis", segundoNombre:"", apellidos:"Hernan", email:"usuario3@gmail.com", departamento:deptDesarrolloNegocios,telefono:"111-11-11",fechaNacimiento:new Date("09/05/1958"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorDesNegociosSr31.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorDesNegociosSr31, usuarioPerfil, true}
		Colaborador colaboradorKeyAcount21 = new Colaborador(username:"josemanuelm",password:"admin1", posicion:puestoKeyAccountManagerProductManager21, primerNombre:"Jose", segundoNombre:"Manuel", apellidos:"Morata", email:"usuario4@gmail.com", departamento:deptFinanciero,telefono:"111-11-11",fechaNacimiento:new Date("01/25/1980"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorKeyAcount21.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorKeyAcount21, usuarioPerfil, true}
		Colaborador colaboradorManager13 = new Colaborador(username:"albertom",password:"admin1", posicion:puestoManager13, primerNombre:"Alberto", segundoNombre:"", apellidos:"Martinez", email:"usuario5@gmail.com", departamento:deptConsultoria,telefono:"111-11-11",fechaNacimiento:new Date("01/25/1980"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorKeyAcount21.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorKeyAcount21, usuarioPerfil, true}
		Colaborador colaboradorDesNegocios42 = new Colaborador(username:"franciscog",password:"admin1", posicion:puestoDesarrolladorNegociosJr42, primerNombre:"Francisco", segundoNombre:"", apellidos:"Garcia", email:"usuario6@gmail.com", departamento:deptFinanciero,telefono:"111-11-11",fechaNacimiento:new Date("01/25/1980"),comentarios:"",enabled: true, fechaIngreso:new Date(), accountExpired:false,accountLocked:false,passwordExpired:false).save(failOnError:true)
		if (!colaboradorKeyAcount21.authorities.contains(usuarioPerfil)) {UsuarioPerfil.create colaboradorKeyAcount21, usuarioPerfil, true}

		println "Creando Colaborador Competencia Nivel"
		Colaborador col = colJesus
		CompetenciaNivel cnCol = competenciaAnalisisYsolucionDeProblemasNivelA
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel1 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaOrganizacionYPlanificacionNivelB
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel5 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaCapacidadNegociacionNivelA
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel2 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaOrientacionAlLogroNivelA
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel3 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaDireccionEquiposNivelB
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel6 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaLiderazgoNivelA
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel7 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaTomaDecisionesNivelB
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel8 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaLiderazgoNivelB
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel10 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		
		col = colMaria
		cnCol = competenciaAtencionDetalleNivelC
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel4 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
		cnCol = competenciaVisionEstrategicaNivelA
		ColaboradorCompetenciaNivel colaboradorCompetenciaNivel9 = new ColaboradorCompetenciaNivel(colaborador: col, competencia: cnCol).save(failOnError:true)
			
		println "Creando colaborador curso"
		ColaboradorCurso colaboradorCurso1 = new ColaboradorCurso(colaborador: colJesus, curso: curso1, estado: colaboradorCursoEstado1).save(failOnError:true)
		ColaboradorCurso colaboradorCurso2 = new ColaboradorCurso(colaborador: colJesus, curso: curso2, estado: colaboradorCursoEstado2).save(failOnError:true)
		ColaboradorCurso colaboradorCurso3 = new ColaboradorCurso(colaborador: colMaria, curso: curso1, estado: colaboradorCursoEstado2).save(failOnError:true)
		ColaboradorCurso colaboradorCurso4 = new ColaboradorCurso(colaborador: colMaria, curso: curso2, estado: colaboradorCursoEstado3).save(failOnError:true)

		println "Creando niveles estudios"
		NivelEstudio ne1 = new NivelEstudio(nombre:"Diplomado").save(failOnError:true)
		NivelEstudio ne2 = new NivelEstudio(nombre:"Licenciatura").save(failOnError:true)
		NivelEstudio ne6 = new NivelEstudio(nombre:"Ingenieria").save(failOnError:true)
		NivelEstudio ne3 = new NivelEstudio(nombre:"Grado").save(failOnError:true)
		NivelEstudio ne4 = new NivelEstudio(nombre:"Master").save(failOnError:true)
		NivelEstudio ne5 = new NivelEstudio(nombre:"Doctorado").save(failOnError:true)
				
		println "Creando estudios"
		Estudio estudio1 = new Estudio(colaborador:colJesus, titulo:"Ing. Sistemas", nivel:ne6, fechaInicio: new Date("05/05/2003"),fechaFin: new Date("07/09/2008"),centro: centroUCM).save(failOnError:true)
		Estudio estudio2 = new Estudio(colaborador:colJesus, titulo:"Ingenieria del Software Para la Web", nivel:ne4, fechaInicio: new Date("10/10/2011"),fechaFin: new Date("09/13/2013"),centro: centroUAH).save(failOnError:true)
		Estudio estudio3 = new Estudio(colaborador:colMaria, titulo:"Psicologia", nivel:ne2, fechaInicio: new Date("05/05/2003"),fechaFin: new Date("07/09/2008"),centro: centroUL).save(failOnError:true)
		Estudio estudio4 = new Estudio(colaborador:colMaria, titulo:"Gestion RRHH y direccion empresas", nivel:ne4, fechaInicio: new Date("05/05/2008"),fechaFin: new Date("07/09/2009"),centro: centroUCM).save(failOnError:true)
		Estudio estudio5 = new Estudio(colaborador:colMaria, titulo:"Desarrollo Profesional", nivel:ne4, fechaInicio: new Date("05/05/2011"),fechaFin: new Date("07/09/2012"),centro: centroUAH).save(failOnError:true)
		
		
		println "Creando Etiquetas Tareas"
		EtiquetasTareas etiqueta1 = new EtiquetasTareas(nombre:"Departamento").save(failOnError:true)
		EtiquetasTareas etiqueta2 = new EtiquetasTareas(nombre:"General").save(failOnError:true)
		EtiquetasTareas etiqueta3 = new EtiquetasTareas(nombre:"Tecnica").save(failOnError:true)
		EtiquetasTareas etiqueta4 = new EtiquetasTareas(nombre:"Personal").save(failOnError:true)
		
		println "Creando Tareas"
		Tarea tarea1 = new Tarea(nombre:"Realizar presentacion master", descripcion:"Presentacion via Skype desarrollo aplicacion SACOPRO.", estado: "Abierta", creador: colJesus, ejecutor:colJesus, prioridad:"Accion", fechaCrecion: new Date())
		tarea1.addToEtiquetas(etiqueta1)
		tarea1.addToEtiquetas(etiqueta2)
		tarea1.save(failOnError:true)
		
		Tarea tarea2 = new Tarea(nombre:"Finalizar memoria SACOPRO", descripcion:loreIpsum3, estado: "Abierta", creador: colMaria, ejecutor:colJesus, prioridad:"Accion", fechaCrecion: new Date())
		tarea2.addToEtiquetas(etiqueta1)
		tarea2.addToEtiquetas(etiqueta2)
		tarea2.save(failOnError:true)
		
		Tarea tarea3 = new Tarea(nombre:"Tarea 3", descripcion:loreIpsum2, estado: "Abierta", creador: colMaria, ejecutor:colMaria, prioridad:"Accion", fechaCrecion: new Date())
		tarea3.addToEtiquetas(etiqueta1)
		tarea3.addToEtiquetas(etiqueta2)
		tarea3.save(failOnError:true)
		
		Tarea tarea4 = new Tarea(nombre:"Tarea 4", descripcion:loreIpsum3, estado: "Finalizada", creador: colMaria, ejecutor:colMaria, prioridad:"Proxima Accion", fechaCrecion: new Date(), fechaFinalizacion: new Date())
		tarea4.addToEtiquetas(etiqueta1)
		tarea4.addToEtiquetas(etiqueta2)
		tarea4.save(failOnError:true)
		
		println "Creando Tecnologias"
		Tecnologia tec1 = new Tecnologia(nombre:"Grails").save(failOnError:true)
		Tecnologia tec2 = new Tecnologia(nombre:"Java").save(failOnError:true)
		Tecnologia tec3 = new Tecnologia(nombre:".Net").save(failOnError:true)
		Tecnologia tec4 = new Tecnologia(nombre:"HTML").save(failOnError:true)
		Tecnologia tec5 = new Tecnologia(nombre:"CSS").save(failOnError:true)
		Tecnologia tec6 = new Tecnologia(nombre:"MySQL").save(failOnError:true)
		Tecnologia tec7 = new Tecnologia(nombre:"SQL Server").save(failOnError:true)
		Tecnologia tec8 = new Tecnologia(nombre:"Ruby on Rails").save(failOnError:true)
		Tecnologia tec9 = new Tecnologia(nombre:"Javascript").save(failOnError:true)
		Tecnologia tec10 = new Tecnologia(nombre:"AJAX").save(failOnError:true)
		
		println "Creando Funciones"
		Funcion funcionEncargado = new Funcion(nombre:"Encargado").save(failOnError:true)
		Funcion funcionColaborador = new Funcion(nombre:"Colaborador").save(failOnError:true)
		Funcion funcionRevisor = new Funcion(nombre:"Revisor").save(failOnError:true)
		
		println "Creando clientes"
		Cliente cliente1 = new Cliente(nombre:"Cliente 1").save(failOnError:true)
		Cliente cliente2= new Cliente(nombre:"Cliente Interno").save(failOnError:true)
		
		
		println "Creando Proyectos"
		Proyecto proyecto1 = new Proyecto(nombre:"SACOPRO", descripcion:loreIpsum3,fechaInicio: new Date("06/01/2013"), fechaFin: new Date("09/01/2013"))
		proyecto1.cliente = cliente2
		proyecto1.addToTecnologias(tec1)
		proyecto1.addToTecnologias(tec2)
		proyecto1.save(failOnError:true)
		
		Proyecto proyecto2 = new Proyecto(nombre:"Web Corporativa", descripcion:loreIpsum1,fechaInicio: new Date("07/01/2013"), fechaFin: new Date("08/01/2013"))
		proyecto2.cliente = cliente2
		proyecto2.addToTecnologias(tec4)
		proyecto2.addToTecnologias(tec5)
		proyecto2.save(failOnError:true)
		
				
		println "Creando Proyecto Colaborador"
		ProyectoColaborador pc = new ProyectoColaborador(proyecto:proyecto1, colaborador: colJesus, funcion: funcionEncargado, fechaInicio: new Date()).save(failOnError:true)	
		ProyectoColaborador pc2 = new ProyectoColaborador(proyecto:proyecto2, colaborador: colMaria, funcion: funcionEncargado, fechaInicio: new Date()).save(failOnError:true)
		ProyectoColaborador pc3 = new ProyectoColaborador(proyecto:proyecto2, colaborador: colJesus, funcion: funcionColaborador, fechaInicio: new Date()).save(failOnError:true)
		
		println "Craendo Categorias Anuncio"
		Categoria cat1 = new Categoria(nombre:"Contrataciones").save(failOnError:true)
		Categoria cat2 = new Categoria(nombre:"Anuncios").save(failOnError:true)
		
		println "Creando Etiquetas Anuncio"
		Etiqueta etiAnu1 = new Etiqueta(nombre:"Varios").save(failOnError:true)
		Etiqueta etiAnu2 = new Etiqueta(nombre:"Avisos").save(failOnError:true)
		
		println "Creando Anuncio"
		Anuncio anuncio1 = new Anuncio(titulo:"Primer anuncio", mensaje:loreIpsum1, fechaPublicacion: new Date(), fechaExpiracion: new Date() + 5 )
		anuncio1.categoria = cat1
		anuncio1.addToEtiquetas(etiAnu1)
		anuncio1.save(failOnError:true)
					
		Anuncio anuncio2 = new Anuncio(titulo:"Incorporacion de fulanito", mensaje:loreIpsum1, fechaPublicacion: new Date(), fechaExpiracion: new Date()+1 )
		anuncio2.categoria = cat1
		anuncio2.addToEtiquetas(etiAnu2)
		anuncio2.save(failOnError:true)
		
		Anuncio anuncio3 = new Anuncio(titulo:"Anuncio Vencido", mensaje:loreIpsum3, fechaPublicacion: new Date()-10, fechaExpiracion: new Date()-1 )
		anuncio3.categoria = cat1
		anuncio3.addToEtiquetas(etiAnu2)
		anuncio3.save(failOnError:true)
		
		println "Creando Comentarios Anuncios"
		AnuncioComentario ac = new AnuncioComentario(anuncio:anuncio1, colaborador:colJesus, comentario:loreIpsumCorto).save(failOnError:true)
		AnuncioComentario ac1 = new AnuncioComentario(anuncio:anuncio1, colaborador:colMaria, comentario:"Prueba comentario").save(failOnError:true)
		AnuncioComentario ac2 = new AnuncioComentario(anuncio:anuncio2, colaborador:colMaria, comentario:"Prueba comentario").save(failOnError:true)
		AnuncioComentario ac3 = new AnuncioComentario(anuncio:anuncio3, colaborador:colaboradorLicitaciones51, comentario:"Prueba comentario").save(failOnError:true)
	}
}

