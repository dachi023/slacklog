angular.module 'slacklog'
.directive 'slHeader', ->
  restrict: 'A'
  templateUrl: 'views/header.html'
  replace: true
  controller: ($scope, slack) ->
    return