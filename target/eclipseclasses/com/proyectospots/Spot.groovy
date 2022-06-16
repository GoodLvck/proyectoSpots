package com.proyectospots

class Spot {
    String nombre
    String provincia
    String direccion
    String descripcion
    String tipo 
    Date fechaPublicacion
    Usuario creador

    // Empresa contructora / relación 'construccion'
    // HasMany mensajes

    String toString(){
        "$nombre, $provincia"
    }

    static hasMany = [modulos : Modulo]

    static constraints = {
        nombre()
        tipo()
        descripcion maxSize:5000
        provincia()
        direccion()
        fechaPublicacion()
        creador()
    }
}
