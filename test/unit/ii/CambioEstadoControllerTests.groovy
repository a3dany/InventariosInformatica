package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(CambioEstadoController)
@Mock(CambioEstado)
class CambioEstadoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cambioEstado/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cambioEstadoInstanceList.size() == 0
        assert model.cambioEstadoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cambioEstadoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cambioEstadoInstance != null
        assert view == '/cambioEstado/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cambioEstado/show/1'
        assert controller.flash.message != null
        assert CambioEstado.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cambioEstado/list'

        populateValidParams(params)
        def cambioEstado = new CambioEstado(params)

        assert cambioEstado.save() != null

        params.id = cambioEstado.id

        def model = controller.show()

        assert model.cambioEstadoInstance == cambioEstado
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cambioEstado/list'

        populateValidParams(params)
        def cambioEstado = new CambioEstado(params)

        assert cambioEstado.save() != null

        params.id = cambioEstado.id

        def model = controller.edit()

        assert model.cambioEstadoInstance == cambioEstado
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cambioEstado/list'

        response.reset()

        populateValidParams(params)
        def cambioEstado = new CambioEstado(params)

        assert cambioEstado.save() != null

        // test invalid parameters in update
        params.id = cambioEstado.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cambioEstado/edit"
        assert model.cambioEstadoInstance != null

        cambioEstado.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cambioEstado/show/$cambioEstado.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cambioEstado.clearErrors()

        populateValidParams(params)
        params.id = cambioEstado.id
        params.version = -1
        controller.update()

        assert view == "/cambioEstado/edit"
        assert model.cambioEstadoInstance != null
        assert model.cambioEstadoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cambioEstado/list'

        response.reset()

        populateValidParams(params)
        def cambioEstado = new CambioEstado(params)

        assert cambioEstado.save() != null
        assert CambioEstado.count() == 1

        params.id = cambioEstado.id

        controller.delete()

        assert CambioEstado.count() == 0
        assert CambioEstado.get(cambioEstado.id) == null
        assert response.redirectedUrl == '/cambioEstado/list'
    }
}
