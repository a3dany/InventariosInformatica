package ii



import org.junit.*
import grails.test.mixin.*

@TestFor(NivelController)
@Mock(Nivel)
class NivelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nivel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nivelInstanceList.size() == 0
        assert model.nivelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nivelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nivelInstance != null
        assert view == '/nivel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nivel/show/1'
        assert controller.flash.message != null
        assert Nivel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nivel/list'

        populateValidParams(params)
        def nivel = new Nivel(params)

        assert nivel.save() != null

        params.id = nivel.id

        def model = controller.show()

        assert model.nivelInstance == nivel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nivel/list'

        populateValidParams(params)
        def nivel = new Nivel(params)

        assert nivel.save() != null

        params.id = nivel.id

        def model = controller.edit()

        assert model.nivelInstance == nivel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nivel/list'

        response.reset()

        populateValidParams(params)
        def nivel = new Nivel(params)

        assert nivel.save() != null

        // test invalid parameters in update
        params.id = nivel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nivel/edit"
        assert model.nivelInstance != null

        nivel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nivel/show/$nivel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nivel.clearErrors()

        populateValidParams(params)
        params.id = nivel.id
        params.version = -1
        controller.update()

        assert view == "/nivel/edit"
        assert model.nivelInstance != null
        assert model.nivelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nivel/list'

        response.reset()

        populateValidParams(params)
        def nivel = new Nivel(params)

        assert nivel.save() != null
        assert Nivel.count() == 1

        params.id = nivel.id

        controller.delete()

        assert Nivel.count() == 0
        assert Nivel.get(nivel.id) == null
        assert response.redirectedUrl == '/nivel/list'
    }
}
