package com.proyectospots



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SpotController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Spot.list(params), model:[spotInstanceCount: Spot.count()]
    }

    def show(Spot spotInstance) {
        respond spotInstance
    }

    def create() {
        respond new Spot(params)
    }

    @Transactional
    def save(Spot spotInstance) {
        if (spotInstance == null) {
            notFound()
            return
        }

        if (spotInstance.hasErrors()) {
            respond spotInstance.errors, view:'create'
            return
        }

        spotInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'spot.label', default: 'Spot'), spotInstance.id])
                redirect spotInstance
            }
            '*' { respond spotInstance, [status: CREATED] }
        }
    }

    def edit(Spot spotInstance) {
        respond spotInstance
    }

    @Transactional
    def update(Spot spotInstance) {
        if (spotInstance == null) {
            notFound()
            return
        }

        if (spotInstance.hasErrors()) {
            respond spotInstance.errors, view:'edit'
            return
        }

        spotInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Spot.label', default: 'Spot'), spotInstance.id])
                redirect spotInstance
            }
            '*'{ respond spotInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Spot spotInstance) {

        if (spotInstance == null) {
            notFound()
            return
        }

        spotInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Spot.label', default: 'Spot'), spotInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'spot.label', default: 'Spot'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
