package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(MovimientoController)
@Mock(Movimiento)
class MovimientoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/movimiento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.movimientoInstanceList.size() == 0
        assert model.movimientoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.movimientoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.movimientoInstance != null
        assert view == '/movimiento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/movimiento/show/1'
        assert controller.flash.message != null
        assert Movimiento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/movimiento/list'

        populateValidParams(params)
        def movimiento = new Movimiento(params)

        assert movimiento.save() != null

        params.id = movimiento.id

        def model = controller.show()

        assert model.movimientoInstance == movimiento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/movimiento/list'

        populateValidParams(params)
        def movimiento = new Movimiento(params)

        assert movimiento.save() != null

        params.id = movimiento.id

        def model = controller.edit()

        assert model.movimientoInstance == movimiento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/movimiento/list'

        response.reset()

        populateValidParams(params)
        def movimiento = new Movimiento(params)

        assert movimiento.save() != null

        // test invalid parameters in update
        params.id = movimiento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/movimiento/edit"
        assert model.movimientoInstance != null

        movimiento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/movimiento/show/$movimiento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        movimiento.clearErrors()

        populateValidParams(params)
        params.id = movimiento.id
        params.version = -1
        controller.update()

        assert view == "/movimiento/edit"
        assert model.movimientoInstance != null
        assert model.movimientoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/movimiento/list'

        response.reset()

        populateValidParams(params)
        def movimiento = new Movimiento(params)

        assert movimiento.save() != null
        assert Movimiento.count() == 1

        params.id = movimiento.id

        controller.delete()

        assert Movimiento.count() == 0
        assert Movimiento.get(movimiento.id) == null
        assert response.redirectedUrl == '/movimiento/list'
    }
}
