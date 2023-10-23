import rutina.*
import aparato.*

class Paciente {
  const property edad 
  var nivelDolor
  var fortalezaMuscular
  const rutina = []
  
  method nivelDolor() = nivelDolor
  method fortalezaMuscular() = fortalezaMuscular
  
  method disminuirNivelDolor(valor) {
    nivelDolor = 0.max(nivelDolor - valor)
  }
  
  method aumentarFortalezaMuscular(valor) {
    fortalezaMuscular = fortalezaMuscular + valor
  }
  
  method puedeUsarAparato(aparato){
  	return aparato.puedeSerUsadoPor(self)
  }
  
  method usarAparato(aparato) {
    if (!self.puedeUsarAparato(aparato)) {
      self.error("El paciente no puede usar el aparato") 
    }
    aparato.usar(self)
  }
  
  method asignarRutina(listaDeAparatos){
  	rutina.addAll(listaDeAparatos)
  }
  
  method puedeRealizarRutina(){
  	return rutina.all({aparato => aparato.puedeSerUsadoPor(self)})
  }
  
  method realizarRutina(){
  	if (!self.puedeRealizarRutina()){
  		self.error("El paciente no puede hacer la rutina")
  	}
  	rutina.forEach({aparato => self.usarAparato(aparato)})
  }
  
}

class Resistente inherits Paciente{
	 override method realizarRutina(){
	 	super()
  		fortalezaMuscular += rutina.size()
	 }
} 

class Caprichoso inherits Paciente{
	
	method hayAparatoRojo(){
		return rutina.any({aparato => aparato.color() == "Rojo"})
	}
	override method puedeRealizarRutina(){
  		return super() and self.hayAparatoRojo()
  	}	
	
	override method realizarRutina(){
		super()
		super()
	}
} 

class RapidaRecuperacion inherits Paciente{

	override method realizarRutina(){
		super()
		self.disminuirNivelDolor(coeficienteRecuperacion.valor())
	}
} 

object coeficienteRecuperacion{
	var property valor = 3
}