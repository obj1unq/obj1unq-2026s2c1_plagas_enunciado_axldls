import elementos.*

class Plagas {

    var property poblacion
    
    method nivelDaño()

    method transmiteEnfermedad(){
        return poblacion > 10
    }

    method atacar(elemento, this){

        elemento.sufrirAtaque(this)
        poblacion += 0.1 * poblacion
    }
}  



class Cucarachas inherits Plagas {

    var property pesoPromedio

    override method nivelDaño(){
        return poblacion.div(2)
    }

    override method transmiteEnfermedad(){
        return pesoPromedio >= 10 && super()
    }
    override method atacar(elemento, this){
        
        super(elemento, this)
        pesoPromedio += 2
    }
}

class Pulgas inherits Plagas {

    override method nivelDaño(){
        return poblacion * 2
    }
}

class Garrapatas inherits Pulgas {

    override method atacar(elemento, this){
        poblacion += 0.2 * poblacion
        elemento.sufrirAtaque(this)
    }
}

class Mosquitos inherits Plagas {

    override method nivelDaño(){
        return poblacion
    }

    override method transmiteEnfermedad(){
        return poblacion % 3 == 0 && super()
    }
}