package com.proyectospots



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ValoracionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Valoracion.list(params), model:[valoracionInstanceCount: Valoracion.count()]
    }

    def show(Valoracion valoracionInstance) {
        respond valoracionInstance
    }

    def create() {
        respond new Valoracion(params)
    }

    @Transactional
    def save(Valoracion valoracionInstance) {
        if (valoracionInstance == null) {
            notFound()
            return
        }

        if (valoracionInstance.hasErrors()) {
            respond valoracionInstance.errors, view:'create'
            return
        }

        valoracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect valoracionInstance
            }
            '*' { respond valoracionInstance, [status: CREATED] }
        }
    }

    def edit(Valoracion valoracionInstance) {
        respond valoracionInstance
    }

    @Transactional
    def update(Valoracion valoracionInstance) {
        if (valoracionInstance == null) {
            notFound()
            return
        }

        if (valoracionInstance.hasErrors()) {
            respond valoracionInstance.errors, view:'edit'
            return
        }

        valoracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect valoracionInstance
            }
            '*'{ respond valoracionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Valoracion valoracionInstance) {

        if (valoracionInstance == null) {
            notFound()
            return
        }

        valoracionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'valoracion.label', default: 'Valoracion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
