package ii

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import org.joda.time.LocalDateTime

class CambioEstadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cambioEstadoInstanceList: CambioEstado.list(params), cambioEstadoInstanceTotal: CambioEstado.count()]
    }

    def listMobile() {
        render CambioEstado.list() as JSON
    }

    def create() {
        [cambioEstadoInstance: new CambioEstado(params)]
    }

    def save() {
        def cambioEstadoInstance = new CambioEstado(params)
        if (!cambioEstadoInstance.save(flush: true)) {
            render(view: "create", model: [cambioEstadoInstance: cambioEstadoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), cambioEstadoInstance.id])
        redirect(action: "show", id: cambioEstadoInstance.id)
    }

    def saveMobile() {
        def cambioEstadoInstance = new CambioEstado(params)
        render("hoalsdjaksjdakl")

        if (!cambioEstadoInstance.save(flush: true)) {
            return true
        }
        return false
    }


    def show(Long id) {
        def cambioEstadoInstance = CambioEstado.get(id)
        if (!cambioEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "list")
            return
        }

        [cambioEstadoInstance: cambioEstadoInstance]
    }

    def edit(Long id) {
        def cambioEstadoInstance = CambioEstado.get(id)
        if (!cambioEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "list")
            return
        }

        [cambioEstadoInstance: cambioEstadoInstance]
    }

    def update(Long id, Long version) {
        def cambioEstadoInstance = CambioEstado.get(id)
        if (!cambioEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cambioEstadoInstance.version > version) {
                cambioEstadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cambioEstado.label', default: 'CambioEstado')] as Object[],
                          "Another user has updated this CambioEstado while you were editing")
                render(view: "edit", model: [cambioEstadoInstance: cambioEstadoInstance])
                return
            }
        }

        cambioEstadoInstance.properties = params

        if (!cambioEstadoInstance.save(flush: true)) {
            render(view: "edit", model: [cambioEstadoInstance: cambioEstadoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), cambioEstadoInstance.id])
        redirect(action: "show", id: cambioEstadoInstance.id)
    }

    def delete(Long id) {
        def cambioEstadoInstance = CambioEstado.get(id)
        if (!cambioEstadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "list")
            return
        }

        try {
            cambioEstadoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), id])
            redirect(action: "show", id: id)
        }
    }
}
