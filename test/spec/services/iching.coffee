'use strict'

describe 'Service: bookofchanges', () ->

  # load the service's module
  beforeEach module 'ichingApp'

  # instantiate service
  BookOfChanges = undefined
  $rootScope = undefined
  $httpBackend = undefined
  beforeEach inject (_$httpBackend_, _BookOfChanges_) ->
    #$rootScope = $injector.get('$rootScope')
    # $httpBackend = $injector.get('$httpBackend')
    # $httpBackend.when().respond ->
    #   console.log "YOYOYO"
    #   "YOYO"
    # BookOfChanges = $injector.get('BookOfChanges')
    # $rootScope = $rootScope
    # $rootScope.$digest()
    $httpBackend = _$httpBackend_
    BookOfChanges = _BookOfChanges_

  it 'should do something', () ->
    expect(!!BookOfChanges).toBe true
    #expect(BookOfChanges.data).not.toBe undefined

  it 'should dredge up hexagrams by formula', () ->
    # This keeps fighting me. I'm loading my application data
    # asynchronously but it's nothing like a backend.
    # I just want a real request.
    # console.log $httpBackend
    # #handlar = $httpBackend.whenGET(/.*/)
    # hexagrams = undefined
    # fetched = false
    # getHexes = ->
    #   console.log "Looking for hexagrams!?"
    #   BookOfChanges.fromFormulas(['000000']).then (hs) ->
    #     console.log "Got your hexagrams."
    #     hexagrams = hs
    #     fetched = true
    # checkFetched = -> fetched
    # runs(getHexes)
    # waitsFor(checkFetched, "The data should be fetched", 1000)
    # runs ->
    #   expect(hexagrams.length).toBe 1

