package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(EstadoActivoController)
@Mock(EstadoActivo)
class EstadoActivoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estadoActivo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estadoActivoInstanceList.size() == 0
        assert model.estadoActivoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.estadoActivoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estadoActivoInstance != null
        assert view == '/estadoActivo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estadoActivo/show/1'
        assert controller.flash.message != null
        assert EstadoActivo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoActivo/list'

        populateValidParams(params)
        def estadoActivo = new EstadoActivo(params)

        assert estadoActivo.save() != null

        params.id = estadoActivo.id

        def model = controller.show()

        assert model.estadoActivoInstance == estadoActivo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoActivo/list'

        populateValidParams(params)
        def estadoActivo = new EstadoActivo(params)

        assert estadoActivo.save() != null

        params.id = estadoActivo.id

        def model = controller.edit()

        assert model.estadoActivoInstance == estadoActivo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoActivo/list'

        response.reset()

        populateValidParams(params)
        def estadoActivo = new EstadoActivo(params)

        assert estadoActivo.save() != null

        // test invalid parameters in update
        params.id = estadoActivo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estadoActivo/edit"
        assert model.estadoActivoInstance != null

        estadoActivo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estadoActivo/show/$estadoActivo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estadoActivo.clearErrors()

        populateValidParams(params)
        params.id = estadoActivo.id
        params.version = -1
        controller.update()

        assert view == "/estadoActivo/edit"
        assert model.estadoActivoInstance != null
        assert model.estadoActivoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estadoActivo/list'

        response.reset()

        populateValidParams(params)
        def estadoActivo = new EstadoActivo(params)

        assert estadoActivo.save() != null
        assert EstadoActivo.count() == 1

        params.id = estadoActivo.id

        controller.delete()

        assert EstadoActivo.count() == 0
        assert EstadoActivo.get(estadoActivo.id) == null
        assert response.redirectedUrl == '/estadoActivo/list'
    }
}
