class Equipo {
	var property jugadores
	
	//PUNTO 2.C
	method tieneUnJugadorEstrellaContra(otroEquipo){
		return jugadores.any( {jugador => jugador.lesPasaElTrapoATodosDe(otroEquipo)} )
	}
	
	method sonTodosTrapeadosPor(unJugador){
		return jugadores.all( {jugadorLocal => unJugador.lePasaElTrapoA(jugadorLocal)} )
	}
	
}
