'use strict'

angular.module('ichingApp')
  .controller 'ConsultCtrl', ($scope, $q, $location, BookOfChanges, ConsultationMethods) ->
    search = $location.search()
    if typeof search.roll is 'string'
      $scope.result = formulas = ConsultationMethods.rollToFormulas(search.roll)
      BookOfChanges.fromFormulas(formulas.formulas).then (result) ->
        $scope.result = angular.extend(result, $scope.result)
    $scope.setMode = (mode) ->
      $scope.mode = mode
    $scope.roll = ->
      $location.search 'roll', ConsultationMethods.roll()









