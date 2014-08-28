'use strict';

angular.module('ichingApp')
  .filter 'linebreaks', () ->
    (input) ->
      if input
        input.replace /\n/g, '<br/>'

