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
    @fromRoll = (roll) =>
      hexagramFormulas = [""] 
      changingLine = null
      changing = false
      for position, index in roll
        if position in [6,9] and not changing
          changing = true
          changingLine = index
          hexagramFormulas.push hexagramFormulas[0]
          hexagramFormulas[1] += if roll <= 7 then 1 else 0
        else if changing
          hexagramFormulas[1] += if roll <= 7 then 0 else 1
        hexagramFormulas[0] += if roll <= 7 then 0 else 1
      $q.all(for formula in hexagramFormulas
        trigrams = [formula[0..2], formula[3..6]]
        $q.all(@trigrams.byBinary(t) for t in trigrams)
        .then (trigrams) -> trigrams
      )
      .then (trigramPairs) =>
        console.log "pairs", trigramPairs
        $q.all(for pair in trigramPairs
          ids = (parseInt(t.id, 10) for t in pair)
          @hexagrams.byTrigrams(ids)
          .then (hexagram) => {hexagram, trigrams: pair}
        )
      .then (result) -> {roll, changing, changingLine, result}








    return this
