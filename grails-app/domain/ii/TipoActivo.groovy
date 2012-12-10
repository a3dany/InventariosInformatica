package ii

class TipoActivo {


    String nombre
    String categoria
    String descripcion

    static constraints = {
        nombre(blank: false, unique: true)
        categoria(blank: false)
        descripcion()
    }

    String toString() {
        "$nombre"
    }
}

