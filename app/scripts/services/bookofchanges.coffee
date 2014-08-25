'use strict';

angular.module('ichingApp')
  .service 'BookOfChanges', ($http, $q) ->
    @data = data = {}
    deferred = $q.defer()
    promise = deferred.promise
    $http.get('/data/iching-pretty.json').success (response) =>
      deferred.resolve response
    @hexagrams = {
      byID: (id, next) ->
        promise.then (data) ->
          for hexagram in data.hexagrams
            if hexagram.id is id
              return next(hexagram)
          return next(null)
      all: (next) ->
        promise.then (data) -> next(data.hexagrams)
      byTrigrams: (trigrams, next) ->
        promise.then (data) ->
          for hexagram in data.hexagrams
            if hexagram.trigrams[0] is trigrams[0] and
            hexagram.trigrams[0] is trigrams[0]
              return next(hexagram)
          return next(null)
    }
    @trigrams = {
      byID: (id, next) ->
        promise.then (data) ->
          for trigram in data.trigrams
            if trigram.id is id
              return next(trigram)
          return next(null)
      all: (next) ->
        promise.then (data) -> next(data.trigrams)
      byBinary: (binary, next) ->
        promise.then (data) ->
          for trigram in data.trigrams
            if trigram.binary is binary
              return next(trigram)
          return next(null)
    }
    return this
