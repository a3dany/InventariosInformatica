package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoActivoController)
@Mock(TipoActivo)
class TipoActivoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoActivo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoActivoInstanceList.size() == 0
        assert model.tipoActivoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoActivoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoActivoInstance != null
        assert view == '/tipoActivo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoActivo/show/1'
        assert controller.flash.message != null
        assert TipoActivo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoActivo/list'

        populateValidParams(params)
        def tipoActivo = new TipoActivo(params)

        assert tipoActivo.save() != null

        params.id = tipoActivo.id

        def model = controller.show()

        assert model.tipoActivoInstance == tipoActivo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoActivo/list'

        populateValidParams(params)
        def tipoActivo = new TipoActivo(params)

        assert tipoActivo.save() != null

        params.id = tipoActivo.id

        def model = controller.edit()

        assert model.tipoActivoInstance == tipoActivo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoActivo/list'

        response.reset()

        populateValidParams(params)
        def tipoActivo = new TipoActivo(params)

        assert tipoActivo.save() != null

        // test invalid parameters in update
        params.id = tipoActivo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoActivo/edit"
        assert model.tipoActivoInstance != null

        tipoActivo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoActivo/show/$tipoActivo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoActivo.clearErrors()

        populateValidParams(params)
        params.id = tipoActivo.id
        params.version = -1
        controller.update()

        assert view == "/tipoActivo/edit"
        assert model.tipoActivoInstance != null
        assert model.tipoActivoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoActivo/list'

        response.reset()

        populateValidParams(params)
        def tipoActivo = new TipoActivo(params)

        assert tipoActivo.save() != null
        assert TipoActivo.count() == 1

        params.id = tipoActivo.id

        controller.delete()

        assert TipoActivo.count() == 0
        assert TipoActivo.get(tipoActivo.id) == null
        assert response.redirectedUrl == '/tipoActivo/list'
    }
}
