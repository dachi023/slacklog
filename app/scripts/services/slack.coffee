angular.module 'slacklog'
.factory 'slack', ($resource, config) ->
  channels: ->
    $resource "#{config.slackApiUrl}/channels.list?token=:token&pretty=:pretty",
      token: config.token
      pretty: 1
      , get:
          method: 'GET'
          responseType: 'json'
