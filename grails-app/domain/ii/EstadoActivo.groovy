package ii

class EstadoActivo {


    String nombre
    String descripcion

    static constraints = {
        nombre(blank: false, unique: true)
        descripcion(blank: false)
    }

    String toString() {
        nombre
    }
}
