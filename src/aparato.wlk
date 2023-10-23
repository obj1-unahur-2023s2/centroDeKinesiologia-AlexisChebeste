import pacientes.*
import rutina.*

class Aparato {
	const property color = "Blanco"	
	
  method puedeSerUsadoPor(paciente) {
    return true // Método abstracto, debe ser implementado en las subclases
  }

  method usar(paciente)
  method necesitaMantenimiento() = false
  method realizarMantenimiento()
}

class Magneto inherits Aparato {
		
	var puntosImantacion = 800
	
	override method necesitaMantenimiento()= puntosImantacion < 100
	
  override method puedeSerUsadoPor(paciente) {
    return true // El Magneto puede ser usado por cualquier paciente
  }
  
  override method usar(paciente) {
  	const dolor = paciente.nivelDolor()
    paciente.disminuirNivelDolor(dolor / 10)
    puntosImantacion = puntosImantacion - 1
  }
  
  override method realizarMantenimiento() {
  	if(self.necesitaMantenimiento()){
  		puntosImantacion += 500
  	}
  }
}

class Bicicleta inherits Aparato {
	var desajusteTornillos = 0
	var perdidasAceite = 0
	
  override method puedeSerUsadoPor(paciente) = paciente.edad() > 8
  
  override method usar(paciente) {
    if (self.puedeSerUsadoPor(paciente)) {
      paciente.disminuirNivelDolor(4)
      paciente.aumentarFortalezaMuscular(3)
	    if (paciente.nivelDolor() > 30){
	    	desajusteTornillos ++
	    }
	    if (paciente.edad().between(30,50)){
	    	perdidasAceite ++
	    }
    
    }
  }
  override method necesitaMantenimiento()= desajusteTornillos >= 10 or perdidasAceite >= 5
	override method realizarMantenimiento() {
  	if(self.necesitaMantenimiento()){
  		desajusteTornillos = 0
  		perdidasAceite = 0
  	}
  	}
}

class Minitramp inherits Aparato {
	
  override method puedeSerUsadoPor(paciente) = paciente.nivelDolor() < 20
  
  
  override method usar(paciente) {
    if (self.puedeSerUsadoPor(paciente)) {
      paciente.aumentarFortalezaMuscular(paciente.edad() * 0.1)
    } 
  }
  override method realizarMantenimiento() {}
}
