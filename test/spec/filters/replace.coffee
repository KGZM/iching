'use strict'

describe 'Filter: replace', () ->

  # load the filter's module
  beforeEach module 'ichingApp'

  # initialize a new instance of the filter before each test
  replace = {}
  beforeEach inject ($filter) ->
    replace = $filter 'replace'

  it 'should return the input prefixed with "replace filter:"', () ->
    text = 'angularjs'
    expect(replace text).toBe ('replace filter: ' + text)
