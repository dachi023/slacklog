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
  .when '/channel/:name/:id',
    templateUrl: 'views/channel.html'
    controller: 'channelCtrl'
  .otherwise
    redirectTo: '/home'
  return
