angular.module 'slacklog'
.directive 'slResize', ($window) ->
  (scope, element, attr) ->
    scope.$watch ->
      angular
        .element '.ui.left.sidebar'
        .first()
        .width()
    , (newVal) ->
      console.log newVal
      element.css
        'margin-left': newVal
    return
