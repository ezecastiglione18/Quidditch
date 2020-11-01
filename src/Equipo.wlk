import partido.*

class Equipo {
	var property jugadores
	
	method habilidadPromedio(){
		return self.listaDeHabilidades() / jugadores.size()
	}
	
	method listaDeHabilidades(){
		return jugadores.map( {jugador => jugador.habilidad()} )
	}
	
	//PUNTO 2.C
	method tieneUnJugadorEstrellaContra(otroEquipo){
		return jugadores.any( {jugador => jugador.lesPasaElTrapoATodosDe(otroEquipo)} )
	}
	
	method sonTodosTrapeadosPor(unJugador){
		return jugadores.all( {jugadorLocal => unJugador.lePasaElTrapoA(jugadorLocal)} )
	}
	
	//PUNTO 3
	method jugarPicadoContra(otroEquipo){
		partido.setearEquipo1(self)
		partido.setearEquipo2(otroEquipo)
		partido.jugar()
	}
	
	method sumarPuntosGraciasA(unosPuntos, unJugador){
		partido.sumarlePuntosAlEquipoDe(unJugador, unosPuntos)
	}
	
	method jugarTurno(otroEquipo){
		jugadores.forEach( {jugador => jugador.jugarTurno(otroEquipo)} )
	}
	
	method noPudoBloquearA(unJugador){
		return self.losQuePuedenBloquearA(unJugador).size() == 0
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
	
	method noTieneLaQuaffle(){
		return self.losCazadores().all( {jugador => jugador.tieneQuaffle().negate()} )
	}
	
	method blancosUtiles(){
		return jugadores.filter( {jugador => jugador.esBlancoUtil()} )
	}
}
