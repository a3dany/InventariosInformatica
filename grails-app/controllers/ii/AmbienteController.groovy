package ii

import grails.converters.JSON
import grails.converters.XML
import org.springframework.dao.DataIntegrityViolationException

class AmbienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def rest = {
        switch (request.method) {
            case 'GET':
                hacerGet(params)
                break;
            case 'POST':
                hacerPost(params)
                break;
            case 'PUT':
                hacerPut(params)
                break;
            case 'DELETE':
                hacerDelete(params)
                break;
        }
    }

    void hacerGet(params) {
        if (params.id == null) {
            render Ambiente.list() as XML;
        } else {
            def ambiente = Ambiente.get(params.id)
            render ambiente as XML;
        }
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ambienteInstanceList: Ambiente.list(params), ambienteInstanceTotal: Ambiente.count()]
    }

    def listMobile() {
        render Ambiente.list() as JSON
    }

    def create() {
        [ambienteInstance: new Ambiente(params)]
    }

    def save() {
        def ambienteInstance = new Ambiente(params)
        if (!ambienteInstance.save(flush: true)) {
            render(view: "create", model: [ambienteInstance: ambienteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), ambienteInstance.id])
        redirect(action: "show", id: ambienteInstance.id)
    }

    def show(Long id) {
        def ambienteInstance = Ambiente.get(id)
        if (!ambienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "list")
            return
        }

        [ambienteInstance: ambienteInstance, activoInstanceList: Activo.findAllByEsActivoAndAmbienteActual(true, ambienteInstance), activoInstanceTotal: Activo.countByEsActivoAndAmbienteActual(true, ambienteInstance)]
    }

    def showMobile(Long id) {
        render Ambiente.get(id) as JSON
    }

    def edit(Long id) {
        def ambienteInstance = Ambiente.get(id)
        if (!ambienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "list")
            return
        }

        [ambienteInstance: ambienteInstance]
    }

    def update(Long id, Long version) {
        def ambienteInstance = Ambiente.get(id)
        if (!ambienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ambienteInstance.version > version) {
                ambienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ambiente.label', default: 'Ambiente')] as Object[],
                        "Another user has updated this Ambiente while you were editing")
                render(view: "edit", model: [ambienteInstance: ambienteInstance])
                return
            }
        }

        ambienteInstance.properties = params

        if (!ambienteInstance.save(flush: true)) {
            render(view: "edit", model: [ambienteInstance: ambienteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), ambienteInstance.id])
        redirect(action: "show", id: ambienteInstance.id)
    }

    def delete(Long id) {
        def ambienteInstance = Ambiente.get(id)
        if (!ambienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "list")
            return
        }

        try {
            ambienteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ambiente.label', default: 'Ambiente'), id])
            redirect(action: "show", id: id)
        }
    }
}
