package com.proyectospots

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Spot)
class SpotSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "Un spot tiene un nombre y una ciudad"
            def spot = new Spot(nombre:'Skatepark pardinyes',
                                provincia: 'Lleida')

        then: "El método toString las combinará."
            spot.toString() == 'Skatepark pardinyes, Lleida'

    }
}
