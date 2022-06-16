package com.proyectospots

class Usuario {
    String nombre
    String apellido
    String password
    String email
    String usuario
    Boolean admin
    // Spot spotLocal
    // spotsCreados
    // foto
    // sugerir cambios al admin

    static hasMany = [spotsFavoritos : Spot]

    String toString(){
        usuario
    }

    static constraints = {
        usuario()
        nombre()
        apellido()
        email()
        password()
        admin()
    }
}
