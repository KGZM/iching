'use strict'

angular.module('ichingApp')
  .controller 'ConsultCtrl', ($scope, $q, BookOfChanges) ->
    $scope.hexagram = null
    $scope.trigrams = [null, null]
    $scope.setMode = (mode) ->
      $scope.mode = mode
    $scope.roll = ->
      trigrams = ["",""]
      result = diceMethod()
      trigrams = [result.formula[0..2], result.formula[3..6]]
      promises = for formula, index in trigrams
        BookOfChanges.trigrams.byBinary formula
      $q.all(promises).then (trigrams) ->
        $scope.trigrams = trigrams
        ids = (parseInt(t.id, 10) for t in trigrams)
        BookOfChanges.hexagrams.byTrigrams(ids)
      .then (hexagram) ->
        $scope.hexagram = hexagram

    rollDice = -> Math.floor(Math.random() * 6) + 1 for _ in [1..2]

    diceMethod = ->
      formula = ""
      oldlines = []
      isEven = (n) -> n % 2 == 0

      for line in [1..6]
        leadDice = if rollDice().every(isEven) then 2 else 3
        secondaryDice = rollDice()
          .map (n) -> 
            if isEven n then 2 else 3
          .reduce (a,b) -> a + b

        result = leadDice + secondaryDice
        formula += if result <= 7 then 0 else 1

        if result in [6,9]
          oldlines.push {line: line, type: result}

      return {formula, oldlines}









