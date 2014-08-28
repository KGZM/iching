'use strict'

angular.module('ichingApp', ['ngRoute', 'ngSanitize'])
  .config ($routeProvider, $locationProvider) ->
    #$locationProvider.html5Mode(true)
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/chumbroskis',
        templateUrl: 'views/main.html'
        controller: 'ChumbroskiCtrl'
      .when '/browse/:hexagram?',
        templateUrl: 'views/browse.html',
        controller: 'BrowseCtrl'
      .when '/consult',
        templateUrl: 'views/consult.html',
        controller: 'ConsultCtrl'
      .otherwise
        redirectTo: '/'
