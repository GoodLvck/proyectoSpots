package com.proyectospots



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ModuloController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Modulo.list(params), model:[moduloInstanceCount: Modulo.count()]
    }

    def show(Modulo moduloInstance) {
        respond moduloInstance
    }

    def create() {
        respond new Modulo(params)
    }

    @Transactional
    def save(Modulo moduloInstance) {
        if (moduloInstance == null) {
            notFound()
            return
        }

        if (moduloInstance.hasErrors()) {
            respond moduloInstance.errors, view:'create'
            return
        }

        moduloInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'modulo.label', default: 'Modulo'), moduloInstance.id])
                redirect moduloInstance
            }
            '*' { respond moduloInstance, [status: CREATED] }
        }
    }

    def edit(Modulo moduloInstance) {
        respond moduloInstance
    }

    @Transactional
    def update(Modulo moduloInstance) {
        if (moduloInstance == null) {
            notFound()
            return
        }

        if (moduloInstance.hasErrors()) {
            respond moduloInstance.errors, view:'edit'
            return
        }

        moduloInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Modulo.label', default: 'Modulo'), moduloInstance.id])
                redirect moduloInstance
            }
            '*'{ respond moduloInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Modulo moduloInstance) {

        if (moduloInstance == null) {
            notFound()
            return
        }

        moduloInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Modulo.label', default: 'Modulo'), moduloInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
