angular.module 'slacklog'
.directive 'slSidebar', ->
  restrict: 'A'
  templateUrl: 'views/sidebar.html'
  replace: true
  controller: ($scope, slack) ->
    $scope.$on '$routeChangeSuccess', ->
      return if $scope.channels and 0 < $scope.channels.length
      slack.channels().get {}, (response) ->
        unless response.ok
          alert 'チャンネルの取得に失敗しました'
          return
        $scope.channels = response.channels
        return
      return
    return