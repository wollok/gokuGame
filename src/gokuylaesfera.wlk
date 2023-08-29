import wollok.game.*

object pantalla{
		
	method iniciar(){
		game.height(10)
		game.width(10)
		game.title("Goku")
		game.addVisual(goku)
		game.addVisual(titulo)
		game.addVisual(esfera)
		game.start()
		
	}
	
}


object goku {
    var ki_base = 200
    var estado = estadoBase
	var position = game.center()

	method ki(){
		game.say(goku,"Tengo un ki de " + goku.kiTotal())
	}
    method transformar(transformacion) {
        estado = transformacion
    }

    method destransformar(){
        estado = estadoBase
    }

    method kiTotal(){
        return estado.calcularKi(ki_base)
    }

    method cambiarFase(){
        estado.subirFase()
    }
    method position() {
    	return position
    }
    
    method derecha(){
    	position = position.right(1)
    }
    method izquierda(){
    	position = position.left(1)
    }
    method image() = "goku_" + estado.descripcion() + ".png"
    //method text() = "hola, soy Goku" 
}

object estadoBase {
    method calcularKi(kiBase){
        return kiBase
    }

    method subirFase() {}
    
    method descripcion() = "normal"
}

object superSayayin {
    var fase = 1
    method calcularKi(kiBase){
        return kiBase*(fase+1)
    }

    method subirFase(){
        fase = fase + 1
    }
    method descripcion() = "super"
}

object esfera{
	
	var estrellas = 1
	
	method image() = "moneda" + estrellas + ".png"
	
	method evoluciona(cant){
		estrellas = estrellas + cant
	}
	
	method position() = goku.position().up(1)	
}

object titulo {
	method position() = game.at(game.width()/2,game.height()-1)
	method text() = "Goku y la esfera "
}
