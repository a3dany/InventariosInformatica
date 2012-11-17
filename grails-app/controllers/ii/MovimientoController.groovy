package ii

import org.springframework.dao.DataIntegrityViolationException
import org.joda.time.LocalDateTime

class MovimientoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [movimientoInstanceList: Movimiento.list(params), movimientoInstanceTotal: Movimiento.count()]
    }

    def create() {
        [movimientoInstance: new Movimiento(params)]
    }

    def save() {
        def movimientoInstance = new Movimiento(params)

        movimientoInstance.setResponsable(Usuario.findByUsername(sec.username()))
        movimientoInstance.setFechaRegistro(LocalDateTime.now())

        if (!movimientoInstance.save(flush: true)) {
            render(view: "create", model: [movimientoInstance: movimientoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), movimientoInstance.id])
        redirect(action: "show", id: movimientoInstance.id)
    }

    def show(Long id) {
        def movimientoInstance = Movimiento.get(id)
        if (!movimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "list")
            return
        }

        [movimientoInstance: movimientoInstance]
    }

    def edit(Long id) {
        def movimientoInstance = Movimiento.get(id)
        if (!movimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "list")
            return
        }

        [movimientoInstance: movimientoInstance]
    }

    def update(Long id, Long version) {
        def movimientoInstance = Movimiento.get(id)
        if (!movimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (movimientoInstance.version > version) {
                movimientoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'movimiento.label', default: 'Movimiento')] as Object[],
                          "Another user has updated this Movimiento while you were editing")
                render(view: "edit", model: [movimientoInstance: movimientoInstance])
                return
            }
        }

        movimientoInstance.properties = params

        if (!movimientoInstance.save(flush: true)) {
            render(view: "edit", model: [movimientoInstance: movimientoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), movimientoInstance.id])
        redirect(action: "show", id: movimientoInstance.id)
    }

    def delete(Long id) {
        def movimientoInstance = Movimiento.get(id)
        if (!movimientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "list")
            return
        }

        try {
            movimientoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), id])
            redirect(action: "show", id: id)
        }
    }
}
