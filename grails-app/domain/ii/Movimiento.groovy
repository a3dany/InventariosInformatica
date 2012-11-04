package ii

import org.joda.time.LocalDateTime

class Movimiento {

    Activo item
    Ambiente origen
    Ambiente destino
    String descripcion
    Usuario responsable
    LocalDateTime fechaHora

    static constraints = {
        item()
        origen()
        destino()
        descripcion(maxSize: 999999)
        responsable()
        fechaHora()
    }
}
