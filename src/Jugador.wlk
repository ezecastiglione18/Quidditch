import escobas.*
import partido.*

class Jugador {
	var skills
	var peso
	var escoba
	var equipoActual
	var property nivelReflejos
	
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
		self.sumarSkills(0-numero)
	}
	
	method lePegoUnaBlundger(){
		self.restarSkills(2)
		escoba.recibirGolpe()	
	}
	
	method juegaPara(unEquipo){
		return equipoActual == unEquipo
	}
}

class Cazador inherits Jugador {
	var punteria
	var fuerza
	var tieneQuaffle
	const property esCazador = true
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + (punteria * fuerza)
	}
	
	method jugarTurno(otroEquipo){
		tieneQuaffle = true
		if(self.evitoTodosLosBloqueosDe(otroEquipo))
		{
			equipoActual.sumarPuntosGraciasA(10, self)
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
	
	method esBlancoUtil(){
		return tieneQuaffle
	}
	
	override method lePegoUnaBlundger(){
		super()
		tieneQuaffle = false
	}
}

class Guardian inherits Jugador {
	var fuerza
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + nivelReflejos + fuerza 
	}
	
	method puedeBloquearTiroDe(unJugador){
		const lista = [1,2,3]
		const numeroElegido = lista.anyOne()
		return numeroElegido == 3
	}
	
	method jugarTurno(otroEquipo){
		
	}
	
	method esBlancoUtil(){
		return equipoActual.noTieneQuaffle()
	}
}

class Golpeador inherits Jugador {
	var punteria
	var fuerza
	
	override method habilidad(){
		return self.velocidadMaxima() + skills + punteria + fuerza
	}
	
	method puedeBloquearTiroDe(unJugador){
		return self.esGroso()
	}
	
	method jugarTurno(otroEquipo){
		const jugadorAGolpear = otroEquipo.blancosFaciles().anyOne()
		if(self.puedeGolpearA(jugadorAGolpear)){
			jugadorAGolpear.lePegoUnaBlundger()
			skills += 1
		}
	}
	
	method puedeGolpearA(unJugador){
		return punteria > unJugador.nivelReflejos()
	}
	
	method esBlancoUtil(){
		return false
	}
}

class Buscador inherits Jugador {
	var nivelVision
	var distanciaASnitch = 5000
	var buscandoLaSnitch = true
	var cantidadTurnos = 0
		
	override method habilidad(){
		return self.velocidadMaxima() + skills + (nivelReflejos * nivelVision)
	}
	
	method puedeBloquearTiroDe(unJugador){
		
	}
	
	method jugarTurno(otroEquipo){
		if(buscandoLaSnitch){
			const numeroRandom = [1..1000].anyOne()
			self.verificarSiEncontroSnitch(numeroRandom)
		}
		distanciaASnitch = 5000
		buscandoLaSnitch = true
	}
	
	method verificarSiEncontroSnitch(unNumero){
		if(unNumero < self.habilidad() + cantidadTurnos){
			self.persiguiendoLaSnitch()
			buscandoLaSnitch = false
		}
	}
	
	method persiguiendoLaSnitch(){
		const kmRecorridos = distanciaASnitch - self.velocidadMaxima() / 1.6
		distanciaASnitch -= kmRecorridos
		
		if(distanciaASnitch == 0){
			self.atrapoLaSnitch()
		}
		
		cantidadTurnos++
	}
	
	method atrapoLaSnitch(){
		equipoActual.sumarPuntosGraciasA(150, self)
		skills += 10
	}
	
	method esBlancoUtil(){
		return buscandoLaSnitch || distanciaASnitch < 1000
	}
	
	override method lePegoUnaBlundger(){
		super() 
		self.resetearBusquedaSnitch()
	}
	
	method resetearBusquedaSnitch(){
		buscandoLaSnitch = true
		distanciaASnitch = 5000
	}
}
