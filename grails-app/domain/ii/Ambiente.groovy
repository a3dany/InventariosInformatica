package ii

class Ambiente {


    String nombre
    TipoAmbiente tipo
    int capacidad
    String descripcion
    String edificio
    Nivel nivel
    Usuario responsable

    static constraints = {
        nombre(blank: false, unique: true)
        tipo(nullable: false)
        capacidad(inList: 0..100)
        descripcion(maxSize: 999999, blank: true)
        edificio(blank: false, inList: ["Carrera de Informática", "Otro"])
        nivel(nullable: false)
        responsable(nullable: true)
    }

    String toString() {
        nombre
    }
}
