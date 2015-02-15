angular.module 'slacklog'
.factory 'slackLog', ($resource, config) ->
  history: ->
    $resource "#{config.slackLogUrl}/:name",
      name: null
      , get:
        method: 'GET'
        responseType: 'json'