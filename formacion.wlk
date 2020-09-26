class Formacion {

	var vagonesQueConformanLaFormacion = []
	var locomotorasQueConformanLaFormacion = []

	method vagonesQueConformanLaFormacion() {
		return vagonesQueConformanLaFormacion
	}

	method locomotorasQueConformanLaFormacion() {
		return locomotorasQueConformanLaFormacion
	}

	method agregarVagon(vagon) {
		vagonesQueConformanLaFormacion.add(vagon)
	}

	method sacarVagon(vagon) {
		vagonesQueConformanLaFormacion.remove(vagon)
	}

	method pasajerosQuePuedeLlevar() {
		return vagonesQueConformanLaFormacion.sum({ c => c.cantidadDePasajeros() })
	}

	method cantidadDeVagonesPopulares() {
		return vagonesQueConformanLaFormacion.count({ c => c.cantidadDePasajeros() > 50 })
	}

	method esFormacionCarguera() {
		return vagonesQueConformanLaFormacion.all({ c => c.cargaQuePuedeLlevar() > 1000 })
	}

	method dispercionDePeso() {
		return vagonesQueConformanLaFormacion.max({ c => c.pesoMaximo() }) - vagonesQueConformanLaFormacion.min({ c => c.pesoMaximo() })
	}

	method baniosDeFormacion() {
		return vagonesQueConformanLaFormacion.count({ c => c.tieneBanio() })
	}

	method equilibradaEnPasajeros() {
		return (vagonesQueConformanLaFormacion.max({ c => c.cantidadDePasajeros() }) - vagonesQueConformanLaFormacion.min({ c => c.cantidadDePasajeros() })) <= 20
	}

	method hacerMantenimiento() {
		vagonesQueConformanLaFormacion.forEach({ c => c.mantenimiento()})
	}

	method estaOrganizado() {
		return self.adelanteEstanLosVagonesConPasajeros() or self.todosLosVagonesLlevanPasajeros() or self.ningunVagonLlevaPasajeros()
	}

	method adelanteEstanLosVagonesConPasajeros() {
		return vagonesQueConformanLaFormacion.sortedBy({ a , c => a.identificacion() < c.identificacion() })
	}

	method todosLosVagonesLlevanPasajeros() {
		return vagonesQueConformanLaFormacion.all({ c => c.cantidadDePasajeros() > 0 })
	}

	method ningunVagonLlevaPasajeros() {
		return vagonesQueConformanLaFormacion.all({ c => c.cantidadDePasajeros() == 0 })
	}

	method velocidadMaxima() {
		return locomotorasQueConformanLaFormacion.min({ c => c.velocidadMaxima() })
	}

	method esEficiente() {
		return locomotorasQueConformanLaFormacion.all({ c => c.esEficiente() })
	}

	method puedeMoverse() {
		return self.sumaDeArrastre() >= self.pesoMaximoDeLaFormacion()
	
	}

	method cuantosKilosLeFaltanDeEmpuje(){
		if(self.puedeMoverse()){
			return 0
		}else{
			return self.pesoMaximoDeLaFormacion() - self.sumaDeArrastre()
		}
	}
	
	
	method sumaDeArrastre() {
		return locomotorasQueConformanLaFormacion.sum({ c => c.pesoQuePuedeArrastrar() })
	}

	method pesoMaximoDeLaFormacion() {
		return locomotorasQueConformanLaFormacion.sum({ c => c.peso() }) + vagonesQueConformanLaFormacion.sum({ c => c.peso() })
	}

	method vagonMasPesado(){
		return vagonesQueConformanLaFormacion.max({c => c.pesoMaximo()})
	}

	method largoTotalDeLaFormacion(){
		return vagonesQueConformanLaFormacion.size() + locomotorasQueConformanLaFormacion.size()
	}

	method esCompleja(){
		return self.largoTotalDeLaFormacion() > 8 or self.pesoMaximoDeLaFormacion() > 8000
	}

}

