angular.module 'slacklog'
.value 'config',
  api:
    url: 'http://172.21.0.40:3002'
    func:
      channels:   '/channel_list'
      channelLog: '/channel'
      groupLog:   '/group'
