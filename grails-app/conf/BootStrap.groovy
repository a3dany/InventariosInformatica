import org.joda.time.LocalDateTime
import ii.*

class BootStrap {

    def init = { servletContext ->

        def usuarioRole = new Role(authority: 'ROLE_USUARIO').save(flush: true)
        def administradorRole = new Role(authority: 'ROLE_ADMINISTRADOR').save(flush: true)
        def tecnicoRole = new Role(authority: 'ROLE_TECNICO').save(flush: true)

        Usuario u1 = new Usuario(username: "dalvarez", password: "dalvarez", enabled: true, nombre: "Daniel Alvarez", cargo: "Administrativo").save(flush: true)
        Usuario u2 = new Usuario(username: "kvasquez", password: "kvasquez", nombre: "Katherine Vasquez", enabled: true, cargo: "Docente").save(flush: true)
        Usuario u3 = new Usuario(username: "jperez", password: "jperez", enabled: true, nombre: "Juan Perez", cargo: "Docente").save(flush: true)

        UserRole.create(u1, administradorRole, true)
        UserRole.create(u2, tecnicoRole, true)
        UserRole.create(u3, usuarioRole, true)


        Nivel n1 = new Nivel(nombre: "Sotano", descripcion: "Aulas.").save(flush: true)
        Nivel n2 = new Nivel(nombre: "Planta Baja", descripcion: "Aulas y biblioteca.").save(flush: true)
        Nivel n3 = new Nivel(nombre: "Piso 1", descripcion: "Aulas.").save(flush: true)
        Nivel n4 = new Nivel(nombre: "Piso 2", descripcion: "Oficinas Administrativas.").save(flush: true)
        Nivel n5 = new Nivel(nombre: "Piso 3", descripcion: "Piso para laboratorios.").save(flush: true)



        TipoAmbiente ta1 = new TipoAmbiente(nombre: "Aula", descripcion: "Ambiente donde docentes de la carrera dan clases a estudiantes.").save(flush: true)
        TipoAmbiente ta2 = new TipoAmbiente(nombre: "Oficina", descripcion: "Oficina de administrativos de la carrera de Informática.").save(flush: true)
        TipoAmbiente ta3 = new TipoAmbiente(nombre: "Laboratorio", descripcion: "Ambiente se tienen varios equipos de computación.").save(flush: true)
        TipoAmbiente ta4 = new TipoAmbiente(nombre: "Mantenimiento", descripcion: "Ambiente para el mantenimiento de equipos.").save(flush: true)
        TipoAmbiente ta5 = new TipoAmbiente(nombre: "Publico", descripcion: "Ambiente publico para todos.").save(flush: true)

        new Ambiente(nombre: "P3-L1", tipo: ta3, capacidad: 30, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "P3-L2", tipo: ta3, capacidad: 100, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "P3-L3", tipo: ta3, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        Ambiente a1 = new Ambiente(nombre: "P3-L4", tipo: ta3, capacidad: 40, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala Internet", tipo: ta5, capacidad: 40, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Dirección de Carrera", tipo: ta2, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n5, responsable: u1).save(flush: true)

        new Ambiente(nombre: "Kardex", tipo: ta2, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala Audiovisual", tipo: ta5, capacidad: 50, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Sala de Docentes", tipo: ta2, capacidad: 0, descripcion: "", edificio: "Carrera de Informática", nivel: n4, responsable: u1).save(flush: true)

        new Ambiente(nombre: "P3-A1", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)
        new Ambiente(nombre: "P3-A2", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)
        new Ambiente(nombre: "P3-A3", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n3, responsable: u1).save(flush: true)

        new Ambiente(nombre: "P2-A1", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)
        new Ambiente(nombre: "P2-A2", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)
        new Ambiente(nombre: "Biblioteca", tipo: ta5, capacidad: 100, descripcion: "", edificio: "Carrera de Informática", nivel: n2, responsable: u1).save(flush: true)

        new Ambiente(nombre: "ST-A1", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "ST-A2", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "ST-A3", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)
        new Ambiente(nombre: "ST-A4", tipo: ta1, capacidad: 35, descripcion: "", edificio: "Carrera de Informática", nivel: n1, responsable: u1).save(flush: true)

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

        EstadoActivo ea1 = new EstadoActivo(nombre: "Estado 1 (Nuevo)", descripcion: "Activo nuevo, recien registrado.").save(flush: true)
        new EstadoActivo(nombre: "Estado 2 (40% vida)", descripcion: "Cumplio 40% de su vida util").save(flush: true)
        new EstadoActivo(nombre: "Estado 3 (60% vida)", descripcion: "Cumplio 60% de su vida util").save(flush: true)
        new EstadoActivo(nombre: "Estado 4 (Defectuoso)", descripcion: "El activo tiene algún defecto.").save(flush: true)
        new EstadoActivo(nombre: "Estado 5 (Baja)", descripcion: "El activo es inutilizable.").save(flush: true)

        //***********************************************************

        new Activo(serie: "123456", nombre: "HandyCam", descripcion: "Sony, modelo X123", tipo: tac1, estadoActual: ea1, ambienteActual: a1, fechaAlta: new LocalDateTime(), responsable: u1).save(flush: true)
    }
    def destroy = {
    }
}
