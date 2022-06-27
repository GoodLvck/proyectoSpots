import com.proyectospots.*

class SecurityFilters {
    def filters = {
        doLogin(controller:'*', action:'*'){
            before = {
                if(!controllerName)
                    return true
                
                def accionesAnonimo = ['modulo':['show', 'index'], 'spot':['show','index'], 'usuario':['signup','save','login','validate'], 'valoracion':['index','show']]
                def accionesDefault = ['modulo':['show', 'index', 'create', 'save'], 'spot':['show','index','create','save','edit','delete', 'update'], 'usuario':['edit', 'logout', 'show', 'update', 'validate'], 'valoracion':['create', 'index', 'show','save']]

                if(!session.user && !accionesAnonimo[controllerName].contains(actionName)){
                    redirect(controller:'usuario', action:'login', params:['cName':controllerName, 'aName':actionName])
                    return false
                } else if (session.user && !session.user.admin && !accionesDefault[controllerName].contains(actionName)){
                    redirect(uri:'/')
                    return false
                } else if (session.user && !session.user.admin && controllerName == 'usuario' && actionName == 'edit' && params.id != String.valueOf(session.user.id)){
                    redirect(controller:'usuario', action:'show', id:params.id)
                    return false
                } else if(session.user && !session.user.admin && controllerName == 'spot' && (actionName == 'edit' || actionName == 'delete')){
                    Spot spotInstance = Spot.findById(params.id)

                    if(spotInstance.publicador.id != session.user.id){
                        redirect(controller:'spot', action:'show', id:params.id)
                        return false
                    }
                } else if(session.user && !session.user.admin && controllerName == 'modulo' && (actionName == 'edit' || actionName == 'delete')){
                    Modulo moduloInstance = Modulo.findById(params.id)

                    if(moduloInstance.publicador.id != session.user.id){
                        redirect(controller:'usuario', action:actionName, id:session.user.id)
                        return false
                    }
                }else if (session.user && session.user.admin && controllerName == 'signup' && actionName == 'create'){
                    redirect(uri:'/')
                    return false
                }
            }
        }
    }
}