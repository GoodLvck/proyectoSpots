import com.proyectospots.*

class BootStrap {

    def init = { servletContext ->

        if(!Spot.get(1)){
            new Modulo(tipo: 'Cajón (hubba ledge)',
                    inclinacion: 'plano',
                    descripcion:'Cajón con esquina de 90º paralelo al suelo.').save()

        new Modulo(tipo: 'Eurogap',
                    inclinacion: 'inclinado',
                    descripcion:'Salto de una rampa a otra con un espacio/agujero enmedio.').save()


        new Usuario(usuario: 'GoodLvck',
                    nombre: 'Alba',
                    apellido: 'Serrano',
                    email: 'xlbaserrano17@gmail.com',
                    password: '12345',
                    admin: true
                    ).save()

        new Usuario(usuario: 'ProSkater',
                    nombre: 'Rayssa',
                    apellido: 'Leal',
                    email: 'rayssaleal@gmail.com',
                    password: '12345',
                    admin: false
                    ).save()
        

        def spot1 = new Spot(nombre: 'Circuito pumptrack',
                            tipo: 'Pumptrack',
                            descripcion: 'Circuito de iniciación para patines, bicis, skateboards, etc.',
                            web: 'https://www.youtube.com/watch?v=TehH0kE-UdQ',
                            provincia: 'Lleida',
                            direccion: 'Alpicat',
                            fechaPublicacion: new Date(),
                            publicador: Usuario.findByUsuario('GoodLvck'))
        
        if(!spot1.save()){
            spot1.errors.allErrors.each{error ->
                println "An error occured with event1: ${error}" 
            }
        }


        def spot2 = new Spot(nombre: 'Skatepark Almacelles',
                            tipo: 'Skatepark',
                            descripcion: '''Pista de patinaje con miniramp. Pista de patinaje con 
                                             miniramp. Pista de patinaje con miniramp. Pista de 
                                             patinaje con miniramp. Pista de patinaje con miniramp. 
                                             Pista de patinaje con miniramp. Pista de patinaje con 
                                             miniramp. Pista de patinaje con miniramp. Pista de patinaje 
                                             con miniramp. Pista de patinaje con miniramp. Pista de 
                                             patinaje con miniramp.''',
                            web: 'https://www.facebook.com/skatepark.almacelles',
                            provincia: 'Lleida',
                            direccion: 'Calle de almacelles',
                            fechaPublicacion: new Date(),
                            publicador: Usuario.findByUsuario('ProSkater'))
        
        if(!spot2.save()){
            spot2.errors.allErrors.each{error ->
                println "An error occured with event1: ${error}" 
            }
        }

        def u1 = Usuario.findByUsuario('ProSkater')
        u1.addToSpotsFavoritos(Spot.findByNombre('Skatepark Almacelles'))
        u1.addToSpotsFavoritos(Spot.findByNombre('Circuito pumptrack'))
        u1.save()

        def s1 = Spot.findByNombre('Skatepark Almacelles')
        s1.addToModulos(Modulo.findByTipo('Cajón (hubba ledge)'))
        s1.addToModulos(Modulo.findByTipo('Eurogap'))
        s1.save()
        }

    }

    def destroy = {
    }
}
