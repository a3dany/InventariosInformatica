package ii

import org.joda.time.LocalDateTime

class Activo {


    String serie
    TipoActivo tipo
    String nombre
    String descripcion
    Marca marca
    String modelo
    EstadoActivo estadoActual
    Usuario responsable

    // Activo
    boolean perteneceActivo = false
    Activo activoAlQuePertenece

    // Ambiente
    boolean esAsignadoAmbiente = false
    Ambiente ambienteActual

    // Compra
    int costo
    int diasGarantia
    String factura
    String proveedor
    boolean esPedido = false
    boolean esComprado = false
    boolean esActivo = false
    LocalDateTime fechaPedido // cuando se hace el pedido
    LocalDateTime fechaCompra // cuando se compra y esta en almacenes de la umsa
    LocalDateTime fechaActivo // fecha cuando llega a la carrera

    // Usuario login
    Usuario usuarioAltaSistema
    LocalDateTime fechaAltaSistema

    static constraints = {
        serie(blank: false, unique: true)
        tipo(nullable: false)
        nombre(blank: true, maxSize: 100)
        descripcion(maxSize: 999999)
        marca(nullable: true)
        modelo(maxSize: 50)
        estadoActual(nullable: false)
        responsable(nullable: true)

        perteneceActivo()
        activoAlQuePertenece(nullable: true)

        esAsignadoAmbiente()
        ambienteActual(nullable: true)

        costo()
        diasGarantia()
        factura(blank: true, maxSize: 50)
        proveedor(maxSize: 50)
        esPedido()
        esComprado()
        esActivo()
        fechaPedido(nullable: true)
        fechaCompra(nullable: true)
        fechaActivo(nullable: true)

        usuarioAltaSistema(nullable: true)
        fechaAltaSistema(nullable: true)
    }

    String toString() {
        "$nombre ($serie)"
    }
}
