package ii

class Marca {

    String nombre;
    String descripcion;

    static constraints = {
        nombre(blank: false, unique: true)
        descripcion(maxSize: 999999)
    }

    String toString() {
        nombre
    }
}
