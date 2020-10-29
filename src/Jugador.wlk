import escobas.*

class Jugador {
	var skills
	var peso
	var escoba
	var equipoActual
	
	//PUNTO 1.A
	method nivelManejoEscoba(){
		return skills / peso
	}
	
	//PUNTO 1.B
	method velocidadMaxima(){
		return escoba.velocidad() * self.nivelManejoEscoba()
	}
	
	//PUNTO 2.A
	method lePasaElTrapoA(otroJugador){
		return (self.habilidad()) * 2 > otroJugador.habilidad()
	}
	
	method habilidad(){
		return 1
	}
	
	//PUNTO 2.B
	method esGroso(){
		return self.habilidad() > equipoActual.habilidadPromedio() && 
		self.velocidadMaxima() > mercadoDeEscobas.valorArbitrario()
	}
	
	method lesPasaElTrapoATodosDe(otroEquipo){
		return otroEquipo.sonTodosTrapeadosPor(self)
	}
	
	method sumarSkills(numero){
		skills += numero
	}
	
	method restarSkills(numero){
		self.sumarSkills(-numero)
	}
}

class Cazador inherits Jugador {
	var punteria
	var fuerza
	var tieneQuaffle
	const property esCazador = true
	const esGuardian = false
	const esGolpeador = false
	const esBuscador = false
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + (punteria * fuerza)
	}
	
	method jugarTurno(otroEquipo){
		tieneQuaffle = true
		if(self.evitoTodosLosBloqueosDe(otroEquipo))
		{
			equipoActual.sumarPuntos(10)
			self.sumarSkills(5)
		}
		else
		{
			const jugadorQueBloqueo = otroEquipo.losQuePuedenBloquearA(self).head()
			jugadorQueBloqueo.sumarSkills(10)
			self.restarSkills(2)
		}
		tieneQuaffle = false
		const cazadorMasVeloz = otroEquipo.cazadorMasVeloz()
		cazadorMasVeloz.tieneLaQuaffle()
	}
	
	method evitoTodosLosBloqueosDe(otroEquipo){
		return otroEquipo.noPudoBloquearA(self)
	}
	
	method puedeBloquearTiroDe(unJugador){
		return self.lePasaElTrapoA(unJugador)
	}
	
	method tieneLaQuaffle(){
		tieneQuaffle = true
	}
}

class Guardian inherits Jugador {
	var nivelReflejos
	var fuerza
	const esCazador = false
	const esGuardian = true
	const esGolpeador = false
	const esBuscador = false
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + nivelReflejos + fuerza 
	}
	
	method puedeBloquearTiroDe(unJugador){
		const lista = [1,2,3]
		const numeroElegido = lista.anyOne()
		return numeroElegido == 3
	}
}

class Golpeador inherits Jugador {
	var punteria
	var fuerza
	const esCazador = false
	const esGuardian = false
	const esGolpeador = true
	const esBuscador = false
	
	method habilidad(){
		return self.velocidadMaxima() + skills + punteria + fuerza
	}
	
	method puedeBloquearTiroDe(unJugador){
		return self.esGroso()
	}
}

class Buscador inherits Jugador {
	var nivelReflejos
	var nivelVision
	const esCazador = false
	const esGuardian = false
	const esGolpeador = false
	const esBuscador = true
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + (nivelReflejos * nivelVision)
	}
}
