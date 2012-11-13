package ii

import org.joda.time.*

class Prestamo {

    Activo item
    String detalleItem
    Usuario solicitante
    String motivo
    Ambiente ambienteDondeEstara
    LocalDateTime fechaInicio
    LocalDateTime fechaFin
    LocalDateTime fechaEntrega
    LocalDateTime fechaDevolucion
    String observacionDevolucion

    // Login
    Usuario responsable
    LocalDateTime fechaRegistro

    static constraints = {
        item(nullable: false)
        detalleItem(blank: true, maxSize: 999999)
        solicitante()
        motivo(blank: true, maxSize: 999999)
        ambienteDondeEstara(nullable: true)

        fechaInicio(nullable: true)
        fechaFin(nullable: true)
        fechaEntrega(nullable: true)
        fechaDevolucion(nullable: true)
        observacionDevolucion(blank: true, maxSize: 999999)

        responsable(nullable: true)
        fechaRegistro(nullable: true)
    }

}
