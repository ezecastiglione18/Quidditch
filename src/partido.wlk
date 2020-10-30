object partido {
	var property equipo1
	var property equipo2
	var puntosEquipo1
	var puntosEquipo2
	
	method setearEquipo1(unEquipo){
		equipo1 = unEquipo
	}
	
	method setearEquipo2(unEquipo){
		equipo2 = unEquipo
	}
	
	method jugar(){
		equipo1.jugarTurno(equipo2)
	}
	
	method sumarlePuntosAlEquipoDe(unJugador, unosPuntos){
		if(unJugador.juegaPara(equipo1)){
			self.subirPuntosEquipo1(unosPuntos)
		}
		else
		{
			self.subirPuntosEquipo2(unosPuntos)
		}
		
		equipo2.jugarTurno(equipo1)
	}
	
	method subirPuntosEquipo1(unosPuntos){
		puntosEquipo1 += unosPuntos
	}
	
	method subirPuntosEquipo2(unosPuntos){
		puntosEquipo2 += unosPuntos
	}
}
