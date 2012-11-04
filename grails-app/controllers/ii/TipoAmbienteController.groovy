package ii

import org.springframework.dao.DataIntegrityViolationException

class TipoAmbienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoAmbienteInstanceList: TipoAmbiente.list(params), tipoAmbienteInstanceTotal: TipoAmbiente.count()]
    }

    def create() {
        [tipoAmbienteInstance: new TipoAmbiente(params)]
    }

    def save() {
        def tipoAmbienteInstance = new TipoAmbiente(params)
        if (!tipoAmbienteInstance.save(flush: true)) {
            render(view: "create", model: [tipoAmbienteInstance: tipoAmbienteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), tipoAmbienteInstance.id])
        redirect(action: "show", id: tipoAmbienteInstance.id)
    }

    def show(Long id) {
        def tipoAmbienteInstance = TipoAmbiente.get(id)
        if (!tipoAmbienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "list")
            return
        }

        [tipoAmbienteInstance: tipoAmbienteInstance]
    }

    def edit(Long id) {
        def tipoAmbienteInstance = TipoAmbiente.get(id)
        if (!tipoAmbienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "list")
            return
        }

        [tipoAmbienteInstance: tipoAmbienteInstance]
    }

    def update(Long id, Long version) {
        def tipoAmbienteInstance = TipoAmbiente.get(id)
        if (!tipoAmbienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoAmbienteInstance.version > version) {
                tipoAmbienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente')] as Object[],
                          "Another user has updated this TipoAmbiente while you were editing")
                render(view: "edit", model: [tipoAmbienteInstance: tipoAmbienteInstance])
                return
            }
        }

        tipoAmbienteInstance.properties = params

        if (!tipoAmbienteInstance.save(flush: true)) {
            render(view: "edit", model: [tipoAmbienteInstance: tipoAmbienteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), tipoAmbienteInstance.id])
        redirect(action: "show", id: tipoAmbienteInstance.id)
    }

    def delete(Long id) {
        def tipoAmbienteInstance = TipoAmbiente.get(id)
        if (!tipoAmbienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoAmbienteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoAmbiente.label', default: 'TipoAmbiente'), id])
            redirect(action: "show", id: id)
        }
    }
}
