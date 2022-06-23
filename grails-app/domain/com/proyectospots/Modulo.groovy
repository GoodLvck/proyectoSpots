package com.proyectospots

class Modulo {
    String tipo
    String inclinacion
    String descripcion
    Usuario publicador
    // imagen (guía de módulos)

    String toString(){
        "$inclinacion : $tipo"
    }

    static belongsTo = Spot

    static constraints = {
        tipo()
        inclinacion() //rampa recta, rampa curva, plano
        descripcion maxSize:2000
        publicador()
    }
}
