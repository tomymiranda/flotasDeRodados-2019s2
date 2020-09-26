class VagonPasajeros {

	var ancho
	var largo
	var tieneBanio = true
	var estaOrdenado = true

	method ancho() {
		return ancho
	}

	method largo() {
		return largo
	}

	method nuevoAncho(nuevoAncho) {
		ancho = nuevoAncho
	}

	method nuevoLargo(nuevoLargo) {
		largo = nuevoLargo
	}

	method tieneBanio() {
		return tieneBanio
	}

	method cambiarBanio() {
		tieneBanio = not tieneBanio
	}

	method estaOrdenado() {
		return estaOrdenado
	}

	method cambiarOrdenado() {
		estaOrdenado = not estaOrdenado
	}

	method cantidadDePasajeros() {
		if (self.estaOrdenado()) {
			return self.calculoDePasajeroPorVagon()
		} else {
			return (self.calculoDePasajeroPorVagon()) - 15
		}
	}

	method calculoDePasajeroPorVagon() {
		if (self.ancho() <= 3) {
			return self.largo() * 8
		} else {
			return self.largo() * 10
		}
	}

	method cargaQuePuedeLlevar() {
		if (self.tieneBanio()) {
			return 300
		} else {
			return 800
		}
	}

	method pesoMaximo() {
		return 2000 + self.cargaQuePuedeLlevar() + self.cantidadDePasajeros() * 80
	}

	method mantenimiento(){
		if(not self.estaOrdenado()){
			self.cambiarOrdenado()
		}
	}

	method identificacion(){
		return 1
	}
}

class VagonCarga {

	var cargaIdeal
	var maderasSueltas

	method cargaIdeal() {
		return cargaIdeal
	}

	method nuevaCargaIdeal(nuevaCarga) {
		cargaIdeal = nuevaCarga
	}

	method maderasSueltas() {
		return maderasSueltas
	}

	method cargaQuePuedeLlevar() {
		return self.cargaIdeal() - self.maderasSueltas() * 400
	}

	method pesoMaximo() {
		return 1500 + self.cargaIdeal()
	}
	
	method cantidadDePasajeros(){
		return 0
	}
	
	method tieneBanio(){
		return false
	}

	method mantenimiento(){
		maderasSueltas = 0.max(self.maderasSueltas()-2)
	}

	method identificacion(){
		return 2
	}
}

class VagonDormitorio{
	
	var compartimientos
	var camasQueFormanElCompartimiento
	
	method compartimientos(){
		return compartimientos
	}
	
	method nuevaCantidadCompartimiento(cantidad){
		compartimientos = cantidad
	}

	method camasQueFormanElCompartimiento(){
		return camasQueFormanElCompartimiento
	}

	method nuevasCamas(cantidad){
		camasQueFormanElCompartimiento = cantidad
	}
	
	method cantidadDePasajeros(){
		return self.compartimientos() * self.camasQueFormanElCompartimiento()
	}
	method tieneBanio(){
		return true
	}
	
	method cargaQuePuedeLlevar(){
		return 1200
	}
	
	method pesoMaximo(){
		return 4000 + self.cantidadDePasajeros() * 80 + self.cargaQuePuedeLlevar()
	}
	
	method mantenimiento(){}

	method identificacion(){
		return 1
	}
}


