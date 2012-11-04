package ii

import org.springframework.dao.DataIntegrityViolationException

class TipoActivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoActivoInstanceList: TipoActivo.list(params), tipoActivoInstanceTotal: TipoActivo.count()]
    }

    def create() {
        [tipoActivoInstance: new TipoActivo(params)]
    }

    def save() {
        def tipoActivoInstance = new TipoActivo(params)
        if (!tipoActivoInstance.save(flush: true)) {
            render(view: "create", model: [tipoActivoInstance: tipoActivoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), tipoActivoInstance.id])
        redirect(action: "show", id: tipoActivoInstance.id)
    }

    def show(Long id) {
        def tipoActivoInstance = TipoActivo.get(id)
        if (!tipoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "list")
            return
        }

        [tipoActivoInstance: tipoActivoInstance]
    }

    def edit(Long id) {
        def tipoActivoInstance = TipoActivo.get(id)
        if (!tipoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "list")
            return
        }

        [tipoActivoInstance: tipoActivoInstance]
    }

    def update(Long id, Long version) {
        def tipoActivoInstance = TipoActivo.get(id)
        if (!tipoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoActivoInstance.version > version) {
                tipoActivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoActivo.label', default: 'TipoActivo')] as Object[],
                          "Another user has updated this TipoActivo while you were editing")
                render(view: "edit", model: [tipoActivoInstance: tipoActivoInstance])
                return
            }
        }

        tipoActivoInstance.properties = params

        if (!tipoActivoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoActivoInstance: tipoActivoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), tipoActivoInstance.id])
        redirect(action: "show", id: tipoActivoInstance.id)
    }

    def delete(Long id) {
        def tipoActivoInstance = TipoActivo.get(id)
        if (!tipoActivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoActivoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoActivo.label', default: 'TipoActivo'), id])
            redirect(action: "show", id: id)
        }
    }
}
