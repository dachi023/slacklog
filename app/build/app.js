(function(){angular.module("slacklog",["ngRoute","ngResource","ngTouch","ngAnimate","ngSanitize"]).config(["$routeProvider",function(e){e.when("/home",{templateUrl:"views/home.html",controller:"homeCtrl"}).when("/channel/:name/:id",{templateUrl:"views/channel.html",controller:"channelCtrl"}).otherwise({redirectTo:"/home"})}])}).call(this),function(){angular.module("slacklog").value("config",{token:"xoxp-2718885166-2908608019-3660092866-e55217",slackApiUrl:"https://slack.com/api",slackLogUrl:"http://172.21.0.40:8383/slacklog"})}.call(this),function(){angular.module("slacklog").controller("channelCtrl",["$scope","$routeParams","slack","slackLog","slackFilter",function(e,n,t,l,o){e.name=n.name,e.$on("$routeChangeSuccess",function(){t.history().get({id:n.id},function(n){return n.ok?void(e.messages=o.replace(n.messages)):void alert("Failed to get history")})}),e.getType=function(e,n){return n?n:e},e.getText=function(){}}])}.call(this),function(){angular.module("slacklog").controller("homeCtrl",["$scope","slack",function(){}])}.call(this),function(){angular.module("slacklog").directive("slResize",["$window",function(){return function(e,n){e.$watch(function(){return angular.element(".ui.left.sidebar").first().width()},function(e){return n.css({"margin-left":e})})}}])}.call(this),function(){angular.module("slacklog").directive("slSidebar",function(){return{restrict:"A",templateUrl:"views/sidebar.html",replace:!0,scope:!0,controller:["$scope","$location","slack",function(e,n,t){e.$on("$routeChangeSuccess",function(){e.channels&&0<e.channels.length||t.channels().get({},function(n){return n.ok?void(e.channels=n.channels):void alert("Failed to get channels")})})}]}})}.call(this),function(){angular.module("slacklog").factory("slackFilter",["slack",function(){var e;return e=[{search:/<!group>/gm,replace:"@group"},{search:/<@U(([A-Z0-9]){8})\|(([a-zA-Z0-9\-_])+)>/gm,replace:"$3"},{search:/<(@U([A-Z0-9]){8})>/gm,replace:"$1"},{search:/</gm,replace:"&lt;"},{search:/>/gm,replace:"&gt;"},{search:/\n/gm,replace:"<br>"}],{replace:function(n){var t;return t=[],angular.forEach(n,function(n){var l;l=n.text,angular.forEach(e,function(e){l=l.replace(e.search,e.replace)}),n.text=l,t.push(n)}),t}}}])}.call(this),function(){angular.module("slacklog").factory("slackLog",["$resource","config",function(e,n){return{history:function(){return e(n.slackLogUrl+"/:name",{name:null,get:{method:"GET",responseType:"json"}})}}}])}.call(this),function(){angular.module("slacklog").factory("slack",["$resource","config",function(e,n){return{channels:function(){return e(n.slackApiUrl+"/channels.list?token=:token&pretty=:pretty",{token:n.token,pretty:1,get:{method:"GET",responseType:"json"}})},history:function(){return e(n.slackApiUrl+"/channels.history?token=:token&channel=:id",{token:n.token,id:null,get:{method:"GET",responseType:"json"}})}}}])}.call(this);