package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoAmbienteController)
@Mock(TipoAmbiente)
class TipoAmbienteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoAmbiente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoAmbienteInstanceList.size() == 0
        assert model.tipoAmbienteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoAmbienteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoAmbienteInstance != null
        assert view == '/tipoAmbiente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoAmbiente/show/1'
        assert controller.flash.message != null
        assert TipoAmbiente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAmbiente/list'

        populateValidParams(params)
        def tipoAmbiente = new TipoAmbiente(params)

        assert tipoAmbiente.save() != null

        params.id = tipoAmbiente.id

        def model = controller.show()

        assert model.tipoAmbienteInstance == tipoAmbiente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAmbiente/list'

        populateValidParams(params)
        def tipoAmbiente = new TipoAmbiente(params)

        assert tipoAmbiente.save() != null

        params.id = tipoAmbiente.id

        def model = controller.edit()

        assert model.tipoAmbienteInstance == tipoAmbiente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAmbiente/list'

        response.reset()

        populateValidParams(params)
        def tipoAmbiente = new TipoAmbiente(params)

        assert tipoAmbiente.save() != null

        // test invalid parameters in update
        params.id = tipoAmbiente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoAmbiente/edit"
        assert model.tipoAmbienteInstance != null

        tipoAmbiente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoAmbiente/show/$tipoAmbiente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoAmbiente.clearErrors()

        populateValidParams(params)
        params.id = tipoAmbiente.id
        params.version = -1
        controller.update()

        assert view == "/tipoAmbiente/edit"
        assert model.tipoAmbienteInstance != null
        assert model.tipoAmbienteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoAmbiente/list'

        response.reset()

        populateValidParams(params)
        def tipoAmbiente = new TipoAmbiente(params)

        assert tipoAmbiente.save() != null
        assert TipoAmbiente.count() == 1

        params.id = tipoAmbiente.id

        controller.delete()

        assert TipoAmbiente.count() == 0
        assert TipoAmbiente.get(tipoAmbiente.id) == null
        assert response.redirectedUrl == '/tipoAmbiente/list'
    }
}
