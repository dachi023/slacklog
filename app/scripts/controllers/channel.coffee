angular.module 'slacklog'
.controller 'channelCtrl', ($scope, $routeParams, slack, slackLog, slackFilter) ->
  $scope.name = $routeParams.name
  $scope.$on '$routeChangeSuccess', ->
    slack.history().get
      id: $routeParams.id
    , (response) ->
      unless response.ok
        alert 'Failed to get history'
        return
      $scope.messages = slackFilter.replace response.messages
      return
    return
  $scope.getType = (type, subtype) ->
    return if subtype then subtype else type
  $scope.getText = (text) ->
    return
  return