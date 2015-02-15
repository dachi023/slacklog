angular.module 'slacklog'
.factory 'slackFilter', (slack) ->
  regexes = [
      search: /<!group>/gm
      replace: '@group'
    ,
      search: /<@U(([A-Z0-9]){8})\|(([a-zA-Z0-9\-_])+)>/gm
      replace: '$3'
    ,
      search: /<(@U([A-Z0-9]){8})>/gm
      replace: '$1'
    ,
      search: /</gm
      replace: '&lt;'
    ,
      search: />/gm
      replace: '&gt;'
    ,
      search: /\n/gm
      replace: '<br>'
  ]
  replace: (messages) ->
    result = []
    angular.forEach messages, (val, key) ->
      text = val.text
      angular.forEach regexes, (val) ->
        text = text.replace val.search, val.replace
        return
      val.text = text
      result.push val
      return
    result