object partido {
	var equipo1
	var equipo2
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
}
