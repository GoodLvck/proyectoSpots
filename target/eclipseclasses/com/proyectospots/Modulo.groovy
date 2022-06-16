package com.proyectospots

class Modulo {
    String tipo
    String inclinacion
    String descripcion
    // imagen (guía de módulos)

    String toString(){
        "$inclinacion : $tipo"
    }

    static constraints = {
        tipo()
        inclinacion() //rampa recta, rampa curva, plano
        descripcion maxSize:2000
    }
}
