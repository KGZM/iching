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
            hexagram.trigrams[1] is trigrams[1]
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
    @fromRoll = (roll) =>
      hexagramFormulas = [""]
      changingLine = null
      changing = false
      for position, index in roll
        if position in "69" and not changing
          changing = true
          changingLine = index + 1
          hexagramFormulas.push hexagramFormulas[0]
          hexagramFormulas[1] += if position in "79" then 0 else 1
        else if changing
          hexagramFormulas[1] += if position in "79" then 1 else 0
        hexagramFormulas[0] += if position in "79" then 1 else 0
      $q.all(hexagramFormulas.map (formula) =>
        trigrams = [formula[0..2], formula[3..6]]
        $q.all trigrams.map (t) => @trigrams.byBinary(t)
        .then (trigrams) ->  trigrams
      )
      .then (trigramPairs) =>
        $q.all trigramPairs.map (pair) =>
          ids = (pair.map (t) -> parseInt(t.id, 10))
          @hexagrams.byTrigrams(ids)
          .then (hexagram) -> {hexagram, trigrams: pair}
      .then (result) -> {roll, changing, changingLine, result}








    return this
