'use strict'

describe 'Controller: BrowseCtrl', () ->

  # load the controller's module
  beforeEach module 'ichingApp'

  BrowseCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BrowseCtrl = $controller 'BrowseCtrl', {
      $scope: scope
    }

  # it 'should attach a list of awesomeThings to the scope', () ->
  #   expect(scope.awesomeThings.length).toBe 3
