package ii

class Usuario extends User {

    String nombre
    String cargo

    static constraints = {
        nombre(blank: false, minSize: 3)
        cargo(inList: ["Administrativo", "Portero", "Docente", "Estudiante"])
    }

    String toString() {
        "$nombre ($cargo)"
    }
}
