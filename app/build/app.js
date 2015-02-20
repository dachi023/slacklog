(function(){angular.module("slacklog",["ngRoute","ngResource","ngTouch","ngAnimate","ngSanitize"]).config(["$routeProvider",function(e){e.when("home",{templateUrl:"views/home.html",controller:"homeCtrl"}).when("channel/:name/:id",{templateUrl:"views/channel.html",controller:"channelCtrl"}).otherwise({redirectTo:"home"})}])}).call(this),function(){angular.module("slacklog").value("config",{api:{url:"http://172.21.0.40:3002",func:{channels:"/channel_list",channelLog:"/channel",groupLog:"/group"}}})}.call(this),function(){angular.module("slacklog").controller("channelCtrl",["$scope","$routeParams","api","slackFilter",function(e,n,l,a){e.name=n.name,e.$on("$routeChangeSuccess",function(){l.cahannelLog().get({id:n.id},function(n){return n.ok?void(e.messages=a.replace(n.messages)):void alert("Failed to get history")})}),e.getType=function(e,n){return n?n:e},e.getText=function(){}}])}.call(this),function(){angular.module("slacklog").controller("homeCtrl",["$scope","slack",function(){}])}.call(this),function(){angular.module("slacklog").directive("slResize",["$window",function(){return function(e,n){e.$watch(function(){return angular.element(".ui.left.sidebar").first().width()},function(e){return n.css({"margin-left":e})})}}])}.call(this),function(){angular.module("slacklog").directive("slSidebar",function(){return{restrict:"A",templateUrl:"views/sidebar.html",replace:!0,scope:!0,controller:["$scope","$location","api",function(e,n,l){e.$on("$routeChangeSuccess",function(){e.channels&&0<e.channels.length||l.channels().get({},function(n){return n.ok?void(e.channels=n.channels):void alert("Failed to get channels")})})}]}})}.call(this),function(){angular.module("slacklog").factory("api",["$resource","config",function(e,n){return{channels:function(){return e(n.api.url+"/"+n.api.func.channels,{get:{method:"GET",responseType:"json"}})},channelLog:function(){return e(n.api.url+"/"+n.api.func.channelLog+"/:name",{name:null,get:{method:"GET",responseType:"json"}})},groupLog:function(){return e(n.api.url+"/"+n.api.func.groupLog+"/:name",{name:null,get:{method:"GET",responseType:"json"}})}}}])}.call(this),function(){angular.module("slacklog").factory("slackFilter",["slack",function(){var e;return e=[{search:/<!group>/gm,replace:"@group"},{search:/<@U(([A-Z0-9]){8})\|(([a-zA-Z0-9\-_])+)>/gm,replace:"$3"},{search:/<(@U([A-Z0-9]){8})>/gm,replace:"$1"},{search:/</gm,replace:"&lt;"},{search:/>/gm,replace:"&gt;"},{search:/\n/gm,replace:"<br>"}],{replace:function(n){var l;return l=[],angular.forEach(n,function(n){var a;a=n.text,angular.forEach(e,function(e){a=a.replace(e.search,e.replace)}),n.text=a,l.push(n)}),l}}}])}.call(this);