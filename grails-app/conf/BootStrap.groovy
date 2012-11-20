import org.joda.time.LocalDateTime
import ii.*

class BootStrap {

    def init = { servletContext ->

        def portero = new Role(authority: 'PORTERO').save(flush: true)
        def administrador = new Role(authority: 'ADMINISTRADOR').save(flush: true)
        def tecnico = new Role(authority: 'TECNICO').save(flush: true)
        def autoridad = new Role(authority: 'AUTORIDAD').save(flush: true)
        def usuarioGeneral = new Role(authority: 'USUARIO GENERAL').save(flush: true)

        Usuario u1 = new Usuario(username: "admin", password: "admin", enabled: true, nombres: "Administrador", apellidos: "General", cargo: "Administrativo", ci: "7777777 LP").save(flush: true)
        Usuario u2 = new Usuario(username: "oguzman", password: "oguzman", nombres: "Oscar", apellidos: "Guzman", enabled: true, cargo: "Técnico", ci: "6120087 LP").save(flush: true)
        Usuario u3 = new Usuario(username: "mmorales", password: "mmorales", enabled: true, nombres: "Menfy", apellidos: "Morales Rios", cargo: "Docente", ci: "8755978 LP").save(flush: true)
        Usuario u4 = new Usuario(username: "jperez", password: "jperez", enabled: true, nombres: "Juan", apellidos: "Perez", cargo: "Portero", ci: "8755998 LP").save(flush: true)
        Usuario u5 = new Usuario(username: "bcarvajal", password: "bcarvajal", enabled: true, nombres: "Brigida", apellidos: "Carvajal Blanco", cargo: "Docente", ci: "8758978 LP").save(flush: true)


        UserRole.create(u1, administrador, true)
        UserRole.create(u2, tecnico, true)
        UserRole.create(u3, autoridad, true)
        UserRole.create(u4, portero, true)
        UserRole.create(u5, usuarioGeneral, true)


        Nivel n1 = new Nivel(nombre: "Sotano", descripcion: "Aulas.").save(flush: true)
        Nivel n2 = new Nivel(nombre: "Planta Baja", descripcion: "Aulas y biblioteca.").save(flush: true)
        Nivel n3 = new Nivel(nombre: "Piso 1", descripcion: "Aulas.").save(flush: true)
        Nivel n4 = new Nivel(nombre: "Piso 2", descripcion: "Oficinas Administrativas.").save(flush: true)
        Nivel n5 = new Nivel(nombre: "Piso 3", descripcion: "Piso para laboratorios y dirección de carrera.").save(flush: true)



        TipoAmbiente aula = new TipoAmbiente(nombre: "Aula", descripcion: "Ambiente donde docentes de la carrera dan clases a estudiantes.").save(flush: true)
        TipoAmbiente oficina = new TipoAmbiente(nombre: "Oficina", descripcion: "Oficina de administrativos de la carrera de Informática.").save(flush: true)
        TipoAmbiente laboratorio = new TipoAmbiente(nombre: "Laboratorio", descripcion: "Lugar donde se tienen varios equipos de computación.").save(flush: true)
        TipoAmbiente mantenimiento = new TipoAmbiente(nombre: "Mantenimiento", descripcion: "Ambiente para el mantenimiento de equipos.").save(flush: true)
        TipoAmbiente publico = new TipoAmbiente(nombre: "Público", descripcion: "Lugar público para todas las personas.").save(flush: true)

        new Ambiente(nombre: "Laboratorio Basicas", tipo: laboratorio, capacidad: 30, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Laboratorio Telemática", tipo: laboratorio, capacidad: 100, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Labotarorio Base de datos", tipo: laboratorio, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Laboratorio Ingles", tipo: laboratorio, capacidad: 40, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala Internet", tipo: publico, capacidad: 40, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Dirección de Carrera", tipo: oficina, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)

        new Ambiente(nombre: "Kardex", tipo: oficina, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala Audiovisual", tipo: publico, capacidad: 50, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala de Docentes", tipo: publico, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)

        new Ambiente(nombre: "Aula G", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula H", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula I", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)

        new Ambiente(nombre: "Aula E", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula F", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Biblioteca", tipo: publico, capacidad: 100, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)

        new Ambiente(nombre: "Aula A", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula B", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula C", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Aula D", tipo: aula, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)

        // ********************************************
        TipoActivo tac1 = new TipoActivo(nombre: "Monitor", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "CPU", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Teclado", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Mouse", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Impresora", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Cámara", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Proyector", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Teléfono", categoria: "Electrónico", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Mueble de escritorio", categoria: "Mueble", descripcion: "").save(flush: true)
        new TipoActivo(nombre: "Mueble de computadora", categoria: "Mueble", descripcion: "").save(flush: true)

        new EstadoActivo(nombre: "Estado 1 (Nuevo)", descripcion: "Activo nuevo, recien registrado.").save(flush: true)
        new EstadoActivo(nombre: "Estado 2 (40% vida)", descripcion: "Cumplio 40% de su vida util").save(flush: true)
        new EstadoActivo(nombre: "Estado 3 (60% vida)", descripcion: "Cumplio 60% de su vida util").save(flush: true)
        new EstadoActivo(nombre: "Estado 4 (Defectuoso)", descripcion: "El activo tiene algún defecto.").save(flush: true)
        new EstadoActivo(nombre: "Estado 5 (Baja)", descripcion: "El activo es inutilizable.").save(flush: true)

        //***********************************************************
        new Marca(nombre: "Samsung", descripcion: "").save(flush: true)
        new Marca(nombre: "Sony", descripcion: "").save(flush: true)
        new Marca(nombre: "Panasonic", descripcion: "").save(flush: true)
        new Marca(nombre: "EPSON", descripcion: "").save(flush: true)
        new Marca(nombre: "LG", descripcion: "").save(flush: true)
        new Marca(nombre: "Acer", descripcion: "").save(flush: true)
        new Marca(nombre: "HP", descripcion: "").save(flush: true)
        new Marca(nombre: "HTC", descripcion: "").save(flush: true)
        new Marca(nombre: "Maxtor", descripcion: "").save(flush: true)
        new Marca(nombre: "Sony Ericsson", descripcion: "").save(flush: true)
        new Marca(nombre: "Hitachi", descripcion: "").save(flush: true)
        new Marca(nombre: "Otro", descripcion: "").save(flush: true)


    }
    def destroy = {
    }
}
