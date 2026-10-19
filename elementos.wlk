import plagas.*

class Hogar {
    
    var property nivelMugre
    var property confort

    method esBueno(){
        return nivelMugre <= confort.div(2)
    }

    method sufrirAtaque(plaga){
        nivelMugre += plaga.nivelDaño()
    }
}

class Huerta {
    

    var property capacidadProduccion

    method esBueno(){
        return capacidadProduccion > 100
    }

    method sufrirAtaque(plaga){
        capacidadProduccion -= plaga.nivelDaño() * 0.1 - self.dañoPorEnfermedad(plaga) 
    }

    method dañoPorEnfermedad(plaga){
        return if(plaga.transmiteEnfermedad()){10}else{0}
    }
}

class Mascota {

    var property nivelSalud

    method esBueno(){
        return nivelSalud > 250
    }

    method sufrirAtauqe(plaga){
        nivelSalud -= self.dañoPorEnfermedad(plaga)
    }

    method dañoPorEnfermedad(plaga){
        return if(plaga.transmiteEnfermedad()){plaga.nivelDaño()}else{0}
    }
}

class Barrio {

    var property elementosBarrio
    
    method elementosBuenos(){
        return elementosBarrio.filter({elemento => elemento.esBueno()})
    }

    method esCopado(){
        self.elementosBuenos().size() > elementosBarrio.size().div(2)
    }
}