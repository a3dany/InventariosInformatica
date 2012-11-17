package ii

class Nivel {


    String nombre
    String descripcion

    static constraints = {
        nombre(blank: false, unique: true)
        descripcion(maxSize: 999999)
    }

    String toString() {
        nombre
    }

    int compareTo(Nivel nivel) {
        nivel.nombre.compareTo(this.nombre)
    }
}
