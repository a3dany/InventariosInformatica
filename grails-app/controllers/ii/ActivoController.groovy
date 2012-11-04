package ii

import org.springframework.dao.DataIntegrityViolationException

class ActivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activoInstanceList: Activo.list(params), activoInstanceTotal: Activo.count()]
    }

    def create() {
        [activoInstance: new Activo(params)]
    }

    def save() {
        def activoInstance = new Activo(params)
        if (!activoInstance.save(flush: true)) {
            render(view: "create", model: [activoInstance: activoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activo.label', default: 'Activo'), activoInstance.id])
        redirect(action: "show", id: activoInstance.id)
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

    def edit(Long id) {
        def activoInstance = Activo.get(id)
        if (!activoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activo.label', default: 'Activo'), id])
            redirect(action: "list")
            return
        }

        [activoInstance: activoInstance]
    }

    def update(Long id, Long version) {
        def activoInstance = Activo.get(id)
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
}
