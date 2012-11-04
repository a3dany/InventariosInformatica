package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivoController)
@Mock(Activo)
class ActivoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activoInstanceList.size() == 0
        assert model.activoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activoInstance != null
        assert view == '/activo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activo/show/1'
        assert controller.flash.message != null
        assert Activo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activo/list'

        populateValidParams(params)
        def activo = new Activo(params)

        assert activo.save() != null

        params.id = activo.id

        def model = controller.show()

        assert model.activoInstance == activo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activo/list'

        populateValidParams(params)
        def activo = new Activo(params)

        assert activo.save() != null

        params.id = activo.id

        def model = controller.edit()

        assert model.activoInstance == activo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activo/list'

        response.reset()

        populateValidParams(params)
        def activo = new Activo(params)

        assert activo.save() != null

        // test invalid parameters in update
        params.id = activo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activo/edit"
        assert model.activoInstance != null

        activo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activo/show/$activo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activo.clearErrors()

        populateValidParams(params)
        params.id = activo.id
        params.version = -1
        controller.update()

        assert view == "/activo/edit"
        assert model.activoInstance != null
        assert model.activoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activo/list'

        response.reset()

        populateValidParams(params)
        def activo = new Activo(params)

        assert activo.save() != null
        assert Activo.count() == 1

        params.id = activo.id

        controller.delete()

        assert Activo.count() == 0
        assert Activo.get(activo.id) == null
        assert response.redirectedUrl == '/activo/list'
    }
}
