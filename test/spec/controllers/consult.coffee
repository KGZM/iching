'use strict'

describe 'Controller: ConsultCtrl', () ->

  # load the controller's module
  beforeEach module 'ichingApp'

  ConsultCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ConsultCtrl = $controller 'ConsultCtrl', {
      $scope: scope
    }

  it 'setMode and roll should register on scope', () ->
    expect(scope.setMode).toNotBe undefined
    expect(scope.roll).toNotBe undefined
