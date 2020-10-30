class Nimbus {
	var porcentajeSalud
	var fechaCreacion
	
	method velocidad(){
		const hoy = new Date()
		const porcentaje = porcentajeSalud / 100
		const cantidadDeAnios = hoy.year() - fechaCreacion.year()
		return (80-cantidadDeAnios)*porcentaje
	}
	
	method recibirGolpe(){
		porcentajeSalud -= 10
	}
	
}

object saetaDeFuego {
	const property velocidad = 100
	
	method recibirGolpe(){
		
	}
}

//--------------------------------------
object mercadoDeEscobas{
	var property valorArbitrario
}
