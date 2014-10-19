package com.jrm.sacopro.tareas



import org.junit.*
import grails.test.mixin.*

@TestFor(TareaController)
@Mock(Tarea)
class TareaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tarea/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tareaInstanceList.size() == 0
        assert model.tareaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tareaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tareaInstance != null
        assert view == '/tarea/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tarea/show/1'
        assert controller.flash.message != null
        assert Tarea.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tarea/list'

        populateValidParams(params)
        def tarea = new Tarea(params)

        assert tarea.save() != null

        params.id = tarea.id

        def model = controller.show()

        assert model.tareaInstance == tarea
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tarea/list'

        populateValidParams(params)
        def tarea = new Tarea(params)

        assert tarea.save() != null

        params.id = tarea.id

        def model = controller.edit()

        assert model.tareaInstance == tarea
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tarea/list'

        response.reset()

        populateValidParams(params)
        def tarea = new Tarea(params)

        assert tarea.save() != null

        // test invalid parameters in update
        params.id = tarea.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tarea/edit"
        assert model.tareaInstance != null

        tarea.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tarea/show/$tarea.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tarea.clearErrors()

        populateValidParams(params)
        params.id = tarea.id
        params.version = -1
        controller.update()

        assert view == "/tarea/edit"
        assert model.tareaInstance != null
        assert model.tareaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tarea/list'

        response.reset()

        populateValidParams(params)
        def tarea = new Tarea(params)

        assert tarea.save() != null
        assert Tarea.count() == 1

        params.id = tarea.id

        controller.delete()

        assert Tarea.count() == 0
        assert Tarea.get(tarea.id) == null
        assert response.redirectedUrl == '/tarea/list'
    }
}
