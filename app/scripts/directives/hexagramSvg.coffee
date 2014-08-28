'use strict';

angular.module('ichingApp')
  .directive('hexagramSvg', () ->
    template: """
      <svg class="svg" xmlns="http://www.w3.org/2000/svg" width="116px" height="145px" screwviewBox='0 0 100 100'>
        <g ng-repeat="line in lines">
          <path ng-show="line.type == 'yin'" ng-attr-stroke-width="{{linestrokewidth}}" stroke="#000" stroke-dasharray="40,20,40" ng-attr-d="M0,{{height - $index * spacing}} l100,0"/>
          <circle ng-show="line.type == 'yang' && line.old" cx="50" ng-attr-cy="{{height - $index * spacing}}" r="10" stroke="#000" stroke-width="2" fill="transparent"></circle>
          <path ng-show="line.type == 'yang'" ng-attr-stroke-width="{{linestrokewidth}}" stroke="#000" stroke-dasharray="" ng-attr-d="M0,{{height - $index * spacing}} l100,0"/>
          <path ng-show="line.type == 'yin' && line.old" stroke-width="2" stroke="#000" stroke-dasharray="" ng-attr-d="M40,{{height - $index * spacing - 10}} l20,20 m0,-20 l-20,20"/>
        </g>
      </svg>
    """
    scope:
      roll: '=hexagramRoll'
    restrict: 'E'
    controller: ($scope) ->
      $scope.$watch 'roll', (value) ->
        $scope.lines = value.split('').map (s) ->
          type: if s in '68' then 'yin' else 'yang'
          old: s in '69'
      $scope.spacing = 20
      $scope.height = 130
      $scope.linestrokewidth = 10

    link: (scope, element, attrs) ->
      # element.text 'this is the hexagramSvg directive'
  )
  # .directive('ngD', () ->
  #   (scope, element, attrs) ->
  #     scope.$watch(attrs.ngD, (value) ->
  #           element.attr('d', value);
  #     )
  # )
