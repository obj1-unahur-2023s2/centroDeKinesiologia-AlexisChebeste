import aparato.*
import pacientes.*

object centro {
	const pacientes = []
	const aparatos = []
	
	method AgregarPaciente(paciente) = pacientes.add(paciente)
	method AgregarAparato(aparato) = aparatos.add(aparato)
	
	method coloresDeAparatos() = aparatos.map({a => a.color()}).asSet()
	
	method pacientesMenoresDe8Anios(){
		return pacientes.filter({paciente => paciente.edad() < 8})
	}
	
	method pacientesQueNoPuedenHacerRutina(){
		return pacientes.count({paciente => !paciente.puedeRealizarRutina()})
	}
	
	method estaOptimo()= aparatos.all({aparato=> !aparato.necesitaMantenimiento()})
	
	method estaComplicado() = self.aparatosParaMantenimiento().size() >= aparatos.size() / 2
	method  aparatosParaMantenimiento()= aparatos.filter({aparato => aparato.necesitaMantenimiento()})
	method visitaTecnico(){
		self.aparatosParaMantenimiento().forEach({a=>a.realizarMantenimiento()})
	}
	
}
