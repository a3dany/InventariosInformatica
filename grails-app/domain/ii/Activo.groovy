package ii

import org.joda.time.LocalDateTime

class Activo {

    String serie
    String nombre
    String descripcion
    TipoActivo tipo
    String modelo
    String marca
    EstadoActivo estadoActual
    boolean asignado = false
    Ambiente ambienteActual
    LocalDateTime fechaAlta
    Usuario responsable

    static constraints = {
        serie(blank: false, unique: true)
        nombre(blank: false)
        descripcion(maxSize: 999999)
        tipo()
        modelo()
        marca(inList: ['Samsung', "Hitachi", "Sony", "HTC", "EPSON"])
        estadoActual()
        asignado()
        ambienteActual()
        fechaAlta()
        responsable()
    }

    String toString() {
        "$nombre ($serie)"
    }
}
