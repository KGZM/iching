'use strict'

angular.module('ichingApp')
  .controller 'ConsultCtrl', ($scope, BookOfChanges) ->
    $scope.hexagram = null
    $scope.trigrams = [null, null]
    $scope.setMode = (mode) ->
      $scope.mode = mode
    $scope.roll = ->
      trigrams = ["",""]
      for i in [0..1]
        for j in [1..3]
          trigrams[i] += Math.floor(Math.random() * 2)
      for formula, index in trigrams
        do (formula,index) ->
          BookOfChanges.trigrams.byBinary formula, (trigram) ->
            $scope.trigrams[index] = trigram
      BookOfChanges.hexagrams.byTrigrams (t.id for t in $scope.trigrams),
        (hexagram) -> $scope.hexagram = hexagram


