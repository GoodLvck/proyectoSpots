package com.proyectospots

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Usuario)
class UsuarioSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "Un usuario tiene un nombre de usuario"
            def usuario = new Usuario(nombre:'Usuario',
                                apellido:'de Prueba',
                                usuario: 'prueba123')

        then: "El método toString lo mostrará."
            usuario.toString() == 'prueba123'
    }
}
