package com.proyectospots

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Modulo)
class ModuloSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "Un modulo tiene una inclinación y un tipo"
            def modulo = new Modulo(tipo:'rail',
                                    inclinacion: 'flat')

        then: "El método toString los combinará."
            modulo.toString() == 'flat : rail'
    }
}
