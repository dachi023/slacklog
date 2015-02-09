gulp = require 'gulp'
plumber = require 'gulp-plumber'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
coffee = require 'gulp-coffee'
annotate = require 'gulp-ng-annotate'
inject = require 'gulp-inject'
connect = require 'gulp-connect'
watch = require 'gulp-watch'
open = require 'gulp-open'

gulp.task 'coffee', ->
  gulp.src 'app/**/*.coffee'
    .pipe plumber()
    .pipe coffee()
    .pipe annotate()
    .pipe concat 'app.js'
    .pipe uglify()
    .pipe gulp.dest 'build/'

gulp.task 'connect', ->
  connect.server
    root: ['app']
    port: 8001
    livereload: true

gulp.task 'open', ['connect'], ->
  gulp.src 'app/index.html'
    .pipe open '',
      url: 'http://localhost:8001'
      app: 'chrome'

#todo watch細かく
gulp.task 'watch', ->
  gulp.watch 'app/**/*', ['reload']

#todo reload細かく
gulp.task 'reload', ->
  gulp.src 'app/**/*'
    .pipe connect.reload()

gulp.task 'default', [
  'open'
  'watch'
]

gulp.task 'build', [
]