class Nimbus {
	var porcentajeSalud
	var fechaCreacion
	
	method velocidad(){
		const hoy = new Date()
		const porcentaje = porcentajeSalud / 100
		const cantidadDeAnios = hoy.year() - fechaCreacion.year()
		return (80-cantidadDeAnios)*porcentaje
	}
	
}

object saetaDeFuego {
	const property velocidad = 100
}

//--------------------------------------
object mercadoDeEscobas{
	var escobasDisponibles
	var property valorArbitrario
}
