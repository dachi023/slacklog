angular.module 'slacklog'
.directive 'slSidebar', ->
  restrict: 'A'
  templateUrl: 'views/sidebar.html'
  replace: true
  scope: true
  controller: ($scope, $location, api) ->
    $scope.$on '$routeChangeSuccess', ->
      return if $scope.channels and 0 < $scope.channels.length
      api.channels().get {}, (response) ->
        unless response.ok
          alert 'Failed to get channels'
          return
        $scope.channels = response.channels
        return
      return
    return