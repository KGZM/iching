'use strict';

angular.module('ichingApp')
  .filter 'replace', () ->
    (input, target, replacement) ->
      input.replace RegExp(target, 'g'), replacement
