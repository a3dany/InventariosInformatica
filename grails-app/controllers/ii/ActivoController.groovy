package ii

import org.joda.time.LocalDateTime
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ActivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activoInstanceList: Activo.findAllByEsActivo(true), activoInstanceTotal: Activo.countByEsActivo(true)]
    }


    def listMobile() {
        render Activo.findAllByEsActivo(true) as JSON
    }

    def listPedidos(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: 'listPedidos', model: [activoInstanceList: Activo.findAllByEsPedido(true), activoInstanceTotal: Activo.countByEsPedido(true)])

    }

    def create() {
        [activoInstance: new Activo(params)]
    }

    def createPedido() {
        render(view: 'createPedido', model: [activoInstance: new Activo(params)])
    }

    def save() {
        def activoInstance = new Activo(params)

        // Add by login
        activoInstance.setUsuarioAltaSistema(Usuario.findByUsername(sec.username()))
        activoInstance.setFechaAltaSistema(LocalDateTime.now())

        // Activo
        activoInstance.setEsActivo(true)


        if (!activoInstance.save(flush: true)) {
            render(view: "create", model: [activoInstance: activoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activo.label', default: 'Activo'), activoInstance.id])
        redirect(action: "show", id: activoInstance.id)
    }

    def savePedido() {
        def activoInstance = new Activo(params)

        // Add by login
        activoInstance.setUsuarioAltaSistema(Usuario.findByUsername(sec.username()))
        activoInstance.setFechaAltaSistema(LocalDateTime.now())

        // Activo
        activoInstance.setEstadoActual(EstadoActivo.findByNombre("Estado 1 (Nuevo)"))
        activoInstance.setEsPedido(true)
        activoInstance.setEsActivo(false)
        activoInstance.setEsComprado(false)
        activoInstance.setFactura("")


        if (!activoInstance.save(flush: true)) {
            render(view: "createPedido", model: [activoInstance: activoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activo.label', default: 'Activo'), activoInstance.id])
        redirect(action: "showPedido", id: activoInstance.id)
    }

    def show(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
            return
        }

        [activoInstance: activoInstance]
    }

    def showPedido(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "listPedidos")
            return
        }

        render(view: 'showPedido', model: [activoInstance: activoInstance])
    }

    def edit(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
            return
        }

        [activoInstance: activoInstance]
    }

    def editPedido(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "listPedidos")
            return
        }
        render(view: 'editPedido', model: [activoInstance: activoInstance])
    }



    def update(Long id, Long version) {
        def activoInstance = Activo.get(id)


        activoInstance.setEsActivo(true)
        activoInstance.setEsPedido(false)


        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activoInstance.version > version) {
                activoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'activo.label', default: 'Activo')] as Object[],
                        "Another user has updated this Activo while you were editing")
                render(view: "edit", model: [activoInstance: activoInstance])
                return
            }
        }

        activoInstance.properties = params

        if (!activoInstance.save(flush: true)) {
            render(view: "edit", model: [activoInstance: activoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activo.label', default: 'Activo'), activoInstance.id])
        redirect(action: "show", id: activoInstance.id)
    }

    def updatePedido(Long id, Long version) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "listPedidos")
            return
        }

        if (version != null) {
            if (activoInstance.version > version) {
                activoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'activo.pedido')] as Object[],
                        "Another user has updated this Activo while you were editing")
                render(view: "editPedido", model: [activoInstance: activoInstance])
                return
            }
        }

        activoInstance.properties = params

        if (!activoInstance.save(flush: true)) {
            render(view: "editPedido", model: [activoInstance: activoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activo.pedido'), activoInstance.id])
        redirect(action: "showPedido", id: activoInstance.id)
    }

    def delete(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
            return
        }

        try {
            activoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "show", id: id)
        }
    }


    def deletePedido(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "listPedidos")
            return
        }

        try {
            activoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "listPedidos")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activo.pedido'), id])
            redirect(action: "showPedido", id: id)
        }
    }
}
