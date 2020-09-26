class Locomotora {
	
	var property peso
	var property pesoQuePuedeArrastrar
	var property velocidadMaxima

	method esEficiente(){
		return self.pesoQuePuedeArrastrar() > self.peso() * 5 
	}
}
