'use strict'

describe 'Directive: hexagramSvg', () ->

  # load the directive's module
  beforeEach module 'ichingApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<hexagram-svg></hexagram-svg>'
    element = $compile(element) scope
    expect(element.find('svg').length).toBe 1
