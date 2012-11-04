package ii

import org.joda.time.*

class Prestamo {

    Activo item
    String solicitante
    String ciSolicitante
    String razon
    LocalDateTime inicioPrestamo
    LocalDateTime finPrestamo
    Ambiente ambienteDondeEstara
    Usuario responsable
    LocalDateTime fecha

    static constraints = {
        item()
        solicitante(blank: false)
        ciSolicitante(blank: false)
        razon(blank: true)
        inicioPrestamo()
        finPrestamo()
        ambienteDondeEstara(nullable: true)
        responsable()
        fecha()
    }
}
