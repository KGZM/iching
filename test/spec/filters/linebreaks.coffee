'use strict'

describe 'Filter: linebreaks', () ->

  # load the filter's module
  beforeEach module 'ichingApp'

  # initialize a new instance of the filter before each test
  linebreaks = {}
  beforeEach inject ($filter) ->
    linebreaks = $filter 'linebreaks'

  it 'should return the input with linebreaks replaced with <br>s:"', () ->
    text = 'angularjs\nangularjs\nangularjs'
    expect(linebreaks(text).match(/<br\/>/g).length).toBe(2)
