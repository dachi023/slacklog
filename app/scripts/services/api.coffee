angular.module 'slacklog'
.factory 'api', ($resource, config) ->
  channels: ->
    $resource "#{config.api.url}/#{config.api.func.channels}",
      get:
        method: 'GET'
        responseType: 'json'
  channelLog: ->
    $resource "#{config.api.url}/#{config.api.func.channelLog}/:name",
      name: null
      , get:
        method: 'GET'
        responseType: 'json'
  groupLog: ->
    $resource "#{config.api.url}/#{config.api.func.groupLog}/:name",
      name: null
      , get:
        method: 'GET'
        responseType: 'json'