'use strict'

angular.module('ichingApp')
  .controller 'ConsultCtrl', ($scope, $q, $location, BookOfChanges) ->
    search = $location.search()
    if typeof search.roll is 'string'
      BookOfChanges.fromRoll(search.roll).then (result) ->
        $scope.result = result
    $scope.setMode = (mode) ->
      $scope.mode = mode
    $scope.roll = ->
      $location.search 'roll', diceMethod()


    rollDice = -> Math.floor(Math.random() * 6) + 1 for _ in [1..2]

    diceMethod = ->
      formula = ""
      isEven = (n) -> n % 2 == 0
      for line in [1..6]
        leadDice = if rollDice().every(isEven) then 2 else 3
        secondaryDice = rollDice()
          .map (n) -> 
            if isEven n then 2 else 3
          .reduce (a,b) -> a + b
        result = leadDice + secondaryDice
        formula += result
      return formula









