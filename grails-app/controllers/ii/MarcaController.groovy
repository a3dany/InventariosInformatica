package ii

import grails.converters.XML
import org.springframework.dao.DataIntegrityViolationException

class MarcaController {

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

    void hacerPost(params) {
        def marca = new Marca()
        def x = request.XML
        marca.nombre = x.nombre
        marca.descripcion = x.descripcion

        if (marca.save()) {
            render marca as XML
        } else {
            response.status = 500
            render marca.errors as XML
        }
    }

    void hacerGet(params) {
        def marca = Marca.get(params.id)
        render marca as XML;
    }




    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [marcaInstanceList: Marca.list(params), marcaInstanceTotal: Marca.count()]
    }

    def create() {
        [marcaInstance: new Marca(params)]
    }

    def save() {
        def marcaInstance = new Marca(params)
        if (!marcaInstance.save(flush: true)) {
            render(view: "create", model: [marcaInstance: marcaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'marca.label', default: 'Marca'), marcaInstance.id])
        redirect(action: "show", id: marcaInstance.id)
    }

    def show(Long id) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        [marcaInstance: marcaInstance]
    }

    def edit(Long id) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        [marcaInstance: marcaInstance]
    }

    def update(Long id, Long version) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (marcaInstance.version > version) {
                marcaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'marca.label', default: 'Marca')] as Object[],
                        "Another user has updated this Marca while you were editing")
                render(view: "edit", model: [marcaInstance: marcaInstance])
                return
            }
        }

        marcaInstance.properties = params

        if (!marcaInstance.save(flush: true)) {
            render(view: "edit", model: [marcaInstance: marcaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'marca.label', default: 'Marca'), marcaInstance.id])
        redirect(action: "show", id: marcaInstance.id)
    }

    def delete(Long id) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        try {
            marcaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "show", id: id)
        }
    }
}
