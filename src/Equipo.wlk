import partido.*

class Equipo {
	var property jugadores
	
	//PUNTO 2.C
	method tieneUnJugadorEstrellaContra(otroEquipo){
		return jugadores.any( {jugador => jugador.lesPasaElTrapoATodosDe(otroEquipo)} )
	}
	
	method sonTodosTrapeadosPor(unJugador){
		return jugadores.all( {jugadorLocal => unJugador.lePasaElTrapoA(jugadorLocal)} )
	}
	
	//PUNTO 3
	method jugarPicadoContra(otroEquipo){
		const partido = new Partido(equipo1 = self, equipo2 = otroEquipo, puntosEquipo1 = 0, puntosEquipo2 = 0)
		partido.jugar()
	}
	
	method jugarTurno(otroEquipo){
		jugadores.forEach( {jugador => jugador.jugarTurno(otroEquipo)} )
	}
	
	method noPudoBloquearA(unJugador){
		return jugadores.count( {jugador => jugador.puedeBloquearTiroDe(unJugador)} ) == 0
	}
	
	method losQuePuedenBloquearA(unJugador){
		return jugadores.filter( {jugador => jugador.puedeBloquearTiroDe(unJugador)} )
	}
	
	method cazadorMasVeloz(){
		return self.losCazadores().max( {jugador => jugador.velocidadMaxima()} )
	}
	
	method losCazadores(){
		return jugadores.filter( {jugador => jugador.esCazador()} )
	}
}
