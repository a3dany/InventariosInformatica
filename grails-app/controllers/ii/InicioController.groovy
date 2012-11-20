package ii

class InicioController {

    def springSecurityService

    def index() {

        if (springSecurityService.isLoggedIn()) {
            render(view: "../index")
        } else {
            redirect(controller: "login", action: "index")
        }

    }
}
