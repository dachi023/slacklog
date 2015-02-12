angular.module 'slacklog', [
  'ngRoute'
  'ngResource'
  'ngTouch'
  'ngAnimate'
  'ngSanitize'
]
.config ($routeProvider) ->
  $routeProvider
  .when '/home',
    templateUrl: 'views/home.html'
    controller: 'homeCtrl'
  .otherwise
    redirectTo: '/home'
  return
