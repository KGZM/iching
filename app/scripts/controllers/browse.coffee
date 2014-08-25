'use strict'

angular.module('ichingApp')
  .controller 'BrowseCtrl', ($scope, BookOfChanges, $routeParams) ->
    BookOfChanges.hexagrams.all (hexagrams) ->
      $scope.hexagrams = hexagrams
    $scope.setHexagram = (id) ->
      BookOfChanges.hexagrams.byID id, (hexagram) ->
        $scope.hexagram = hexagram
        $routeParams.hexagram = hexagram.id
    if $routeParams.hexagram
      $scope.setHexagram($routeParams.hexagram)

