package ii

class TipoAmbiente {


    String nombre
    String descripcion

    static constraints = {
        nombre(blank: false)
        descripcion(blank: false)
    }

    String toString() {
        nombre
    }
}
