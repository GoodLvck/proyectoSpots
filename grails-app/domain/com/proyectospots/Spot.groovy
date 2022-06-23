package com.proyectospots

class Spot {
    String nombre
    String provincia
    String direccion
    String descripcion
    String tipo 
    String web
    Date fechaPublicacion
    Usuario publicador

    String toString(){
        "$nombre, $provincia"
    }

    static hasMany = [modulos : Modulo,
                    valoraciones : Valoracion]

    static constraints = {
        nombre()
        tipo()
        descripcion maxSize:5000, nullable:true
        modulos nullable:true
        web blank:true, url:true, nullable:true
        provincia()
        direccion()
        fechaPublicacion()
        publicador()
        valoraciones nullable:true
    }
}
