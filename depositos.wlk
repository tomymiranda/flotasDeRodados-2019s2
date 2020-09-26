class Deposito {
	
	var formaciones = []
	var locomotoras = []

	method conjuntoDeFormaciones(){
		return formaciones.filter({c=> c.vagonMasPesado()}).asSet()
	}

	method necesitaConductorExperimentado(){
		return formaciones.any({c => c.esCompleja()})
	}

	method agregarUnaLocomotoraAlaFormacion(formacion){
		
	}

}
