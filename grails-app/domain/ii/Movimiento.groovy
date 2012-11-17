package ii

import org.joda.time.LocalDateTime

class Movimiento {


    Activo item
    Ambiente origen
    Ambiente destino
    String descripcion
    Usuario responsable
    LocalDateTime fechaRegistro

    static constraints = {
        item()
        origen()
        destino()
        descripcion(maxSize: 999999)
        responsable(nullable: true)
        fechaRegistro(nullable: true)
    }
}
