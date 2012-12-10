package ii

import org.joda.time.LocalDateTime

class CambioEstado {

    Activo item
    EstadoActivo anterior
    EstadoActivo actual
    String descripcion
    Usuario responsable
    LocalDateTime fechaRegistro

    static constraints = {
        item()
        anterior()
        actual()
        descripcion(maxSize: 999999)
        responsable(nullable: true)
        fechaRegistro(nullable: true)
    }
}
