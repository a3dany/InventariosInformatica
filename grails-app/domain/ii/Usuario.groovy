package ii

class Usuario extends User {


    String nombres
    String apellidos
    String cargo
    String ci

    static constraints = {
        nombres(blank: false, minSize: 2)
        apellidos(blank: false, minSize: 2)
        cargo(inList: ["Administrativo", "Portero", "Docente", "Estudiante"])
        ci(unique: true)
    }

    String toString() {
        "$nombres $apellidos ($cargo)"
    }
}
