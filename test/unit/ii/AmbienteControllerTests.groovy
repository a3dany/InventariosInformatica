package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(AmbienteController)
@Mock(Ambiente)
class AmbienteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ambiente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ambienteInstanceList.size() == 0
        assert model.ambienteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ambienteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ambienteInstance != null
        assert view == '/ambiente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ambiente/show/1'
        assert controller.flash.message != null
        assert Ambiente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ambiente/list'

        populateValidParams(params)
        def ambiente = new Ambiente(params)

        assert ambiente.save() != null

        params.id = ambiente.id

        def model = controller.show()

        assert model.ambienteInstance == ambiente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ambiente/list'

        populateValidParams(params)
        def ambiente = new Ambiente(params)

        assert ambiente.save() != null

        params.id = ambiente.id

        def model = controller.edit()

        assert model.ambienteInstance == ambiente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ambiente/list'

        response.reset()

        populateValidParams(params)
        def ambiente = new Ambiente(params)

        assert ambiente.save() != null

        // test invalid parameters in update
        params.id = ambiente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ambiente/edit"
        assert model.ambienteInstance != null

        ambiente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ambiente/show/$ambiente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ambiente.clearErrors()

        populateValidParams(params)
        params.id = ambiente.id
        params.version = -1
        controller.update()

        assert view == "/ambiente/edit"
        assert model.ambienteInstance != null
        assert model.ambienteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ambiente/list'

        response.reset()

        populateValidParams(params)
        def ambiente = new Ambiente(params)

        assert ambiente.save() != null
        assert Ambiente.count() == 1

        params.id = ambiente.id

        controller.delete()

        assert Ambiente.count() == 0
        assert Ambiente.get(ambiente.id) == null
        assert response.redirectedUrl == '/ambiente/list'
    }
}
