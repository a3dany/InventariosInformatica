package ii

import org.joda.time.LocalDateTime
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.converters.XML

class CambioEstadoController {

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
        def cambioEstado = new CambioEstado()
        def x = request.XML
        String itemXML = x.item
        cambioEstado.item = Activo.findBySerie(itemXML)
        cambioEstado.anterior = cambioEstado.item.getEstadoActual()
        String estadoActualXML = x.actual
        cambioEstado.actual = EstadoActivo.findByNombre(estadoActualXML)
        cambioEstado.descripcion = x.descripcion

        cambioEstado.setResponsable(Usuario.findByUsername(sec.username()))
        cambioEstado.setFechaRegistro(LocalDateTime.now())


        if (cambioEstado.save()) {
            render cambioEstado as XML
        } else {
            response.status = 500
            render cambioEstado.errors as XML
        }
    }

    void hacerGet(params) {
        if (params.id == null) {
            render CambioEstado.list() as XML;
        } else {
            def cambioEstado = CambioEstado.get(params.id)
            render cambioEstado as XML;
        }
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cambioEstadoInstanceList: CambioEstado.list(params), cambioEstadoInstanceTotal: CambioEstado.count()]
    }

    def listPdf() {
        renderPdf(template: "/listPdf", model:[titulo: "Cambio de estado", cambioEstadoInstanceList: CambioEstado.list(), cambioEstadoInstanceTotal: CambioEstado.count()] )
    }

    def create() {
        [cambioEstadoInstance: new CambioEstado(params)]
    }

    def createWith() {
        render(view: 'createWith', model: [activoInstance: Activo.findById(params.id)])
    }

    def save() {
        def cambioEstadoInstance = new CambioEstado(params)

        cambioEstadoInstance.setResponsable(Usuario.findByUsername(sec.username()))
        cambioEstadoInstance.setFechaRegistro(LocalDateTime.now())

        if (!cambioEstadoInstance.save(flush: true)) {
            render(view: "create", model: [cambioEstadoInstance: cambioEstadoInstance])
            return
        }

        def activo = Activo.findById(cambioEstadoInstance.item.id)
        activo.setEstadoActual(cambioEstadoInstance.actual)

        flash.message = message(code: 'default.created.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), cambioEstadoInstance.id])
        redirect(action: "show", id: cambioEstadoInstance.id)
    }

    def saveWith() {
        def cambioEstadoInstance = new CambioEstado(params)

        cambioEstadoInstance.setResponsable(Usuario.findByUsername(sec.username()))
        cambioEstadoInstance.setFechaRegistro(LocalDateTime.now())

        if (!cambioEstadoInstance.save(flush: true)) {
            render(view: "createWith", model: [cambioEstadoInstance: cambioEstadoInstance])
            return
        }

        def activo = Activo.findById(cambioEstadoInstance.item.id)
        activo.setEstadoActual(cambioEstadoInstance.actual)

        flash.message = message(code: 'default.created.message', args: [message(code: 'cambioEstado.label', default: 'CambioEstado'), cambioEstadoInstance.id])
        redirect(action: "show", id: cambioEstadoInstance.id)
    }

    def saveMobile() {
        def cambioEstadoInstance = new CambioEstado(params)
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
