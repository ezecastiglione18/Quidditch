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
}

class Cazador inherits Jugador {
	var punteria
	var fuerza
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + (punteria * fuerza)
	}
}

class Guardian inherits Jugador {
	var nivelReflejos
	var fuerza
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + nivelReflejos + fuerza 
	}
}

class Golpeador inherits Cazador {
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + punteria + fuerza
	}
}

class Buscador inherits Jugador {
	var nivelReflejos
	var nivelVision
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + (nivelReflejos * nivelVision)
	}
}
