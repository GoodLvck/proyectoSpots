package com.proyectospots



import static org.springframework.http.HttpStatus.*
    import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model: [usuarioInstanceCount: Usuario.count()]
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    def signup() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            
            if(session.user.admin){
                respond usuarioInstance.errors, view: 'create'
            } else {
                respond usuarioInstance.errors, view: 'signup'
            }

            return
        }

        usuarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label',
                    default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' {
                respond usuarioInstance, [status: CREATED]
            }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view: 'edit'
            return
        }

        usuarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label',
                    default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' {
                respond usuarioInstance, [status: OK]
            }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label',
                    default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' {
                render status: NO_CONTENT
            }
        }
    }

    def login() {
        if (params.cName)
            return [cName:params.cName, aName:params.aName]
    }

    def logout() { 
        session.user = null 
        redirect(uri:'/')
    }

    def validate() {
        def user = Usuario.findByUsuario(params.usuario) 
        
        if (user && user.password == params.password) {
            session.user = user

            if(params.cName)
                redirect controller:params.cName, action:params.aName
            else
                redirect(uri:'/')
            
        } else {
            flash.message = "Invalid username and password."
            render view: 'login'
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label',
                    default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' {
                render status: NOT_FOUND
            }
        }
    }
}