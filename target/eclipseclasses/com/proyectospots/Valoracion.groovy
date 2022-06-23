package com.proyectospots

class Valoracion {
    String titulo
    String detalles
    String puntuacion
    Spot spot
    Usuario autor

    static belongsTo = Spot

    static constraints = {
        titulo blank:false
        detalles blank:false, maxSize: 2000 
        puntuacion blank:false
        autor nullable:false
    }
}
