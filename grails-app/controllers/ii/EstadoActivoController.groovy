package ii

import org.springframework.dao.DataIntegrityViolationException

class EstadoActivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [estadoActivoInstanceList: EstadoActivo.list(params), estadoActivoInstanceTotal: EstadoActivo.count()]
    }

    def create() {
        [estadoActivoInstance: new EstadoActivo(params)]
    }

    def save() {
        def estadoActivoInstance = new EstadoActivo(params)
        if (!estadoActivoInstance.save(flush: true)) {
            render(view: "create", model: [estadoActivoInstance: estadoActivoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), estadoActivoInstance.id])
        redirect(action: "show", id: estadoActivoInstance.id)
    }

    def show(Long id) {
        def estadoActivoInstance = EstadoActivo.get(id)
        if (!estadoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "list")
            return
        }

        [estadoActivoInstance: estadoActivoInstance]
    }

    def edit(Long id) {
        def estadoActivoInstance = EstadoActivo.get(id)
        if (!estadoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "list")
            return
        }

        [estadoActivoInstance: estadoActivoInstance]
    }

    def update(Long id, Long version) {
        def estadoActivoInstance = EstadoActivo.get(id)
        if (!estadoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estadoActivoInstance.version > version) {
                estadoActivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estadoActivo.label', default: 'EstadoActivo')] as Object[],
                          "Another user has updated this EstadoActivo while you were editing")
                render(view: "edit", model: [estadoActivoInstance: estadoActivoInstance])
                return
            }
        }

        estadoActivoInstance.properties = params

        if (!estadoActivoInstance.save(flush: true)) {
            render(view: "edit", model: [estadoActivoInstance: estadoActivoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), estadoActivoInstance.id])
        redirect(action: "show", id: estadoActivoInstance.id)
    }

    def delete(Long id) {
        def estadoActivoInstance = EstadoActivo.get(id)
        if (!estadoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "list")
            return
        }

        try {
            estadoActivoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadoActivo.label', default: 'EstadoActivo'), id])
            redirect(action: "show", id: id)
        }
    }
}
