'use strict';

angular.module('ichingApp')
  .service 'BookOfChanges', ($http, $q) ->
    deferred = $q.defer()
    promise = deferred.promise
    $http.get('/data/iching-pretty.json').success (response) =>
      deferred.resolve response
    @hexagrams = {
      byID: (id) ->
        promise.then (data) ->
          for hexagram in data.hexagrams
            if hexagram.id is id
              return hexagram
          return null
      all: ->
        promise.then (data) -> data.hexagrams
      byTrigrams: (trigrams) ->
        promise.then (data) ->
          for hexagram in data.hexagrams
            if hexagram.trigrams[0] is trigrams[0] and
            hexagram.trigrams[0] is trigrams[0]
              return hexagram
          return null
    }
    @trigrams = {
      byID: (id) ->
        promise.then (data) ->
          for trigram in data.trigrams
            if trigram.id is id
              return trigram
          return null
      all: ->
        promise.then (data) -> data.trigrams
      byBinary: (binary) ->
        promise.then (data) ->
          for trigram in data.trigrams
            if trigram.binary is binary
              return trigram
          return null
    }
    return this
