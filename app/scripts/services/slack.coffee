angular.module 'slacklog'
.factory 'slack', ($resource, config) ->
  channels: ->
    $resource "#{config.slackApiUrl}/channels.list?token=:token&pretty=:pretty",
      token: config.token
      pretty: 1
      , get:
        method: 'GET'
        responseType: 'json'
  history: ->
    $resource "#{config.slackApiUrl}/channels.history?token=:token&channel=:id",
      token: config.token
      id: null
      , get:
        method: 'GET'
        responseType: 'json'