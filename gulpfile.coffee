gulp = require 'gulp'
plumber = require 'gulp-plumber'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
coffee = require 'gulp-coffee'
annotate = require 'gulp-ng-annotate'
stylus = require 'gulp-stylus'
inject = require 'gulp-inject'
connect = require 'gulp-connect'
watch = require 'gulp-watch'
open = require 'gulp-open'
bowerFiles = require 'main-bower-files'

gulp.task 'coffee', ->
  gulp.src 'app/**/*.coffee'
    .pipe plumber()
    .pipe coffee()
    .pipe annotate()
    .pipe concat 'app.js'
    .pipe uglify()
    .pipe gulp.dest 'app/build/'

gulp.task 'stylus', ->
  gulp.src 'app/**/*.styl'
    .pipe plumber()
    .pipe stylus()
    .pipe gulp.dest 'app/build'

gulp.task 'inject', ['coffee', 'stylus'], ->
  gulp.src 'app/index.html'
    .pipe inject(
      gulp.src bowerFiles(),
        read: false
      relative: true
      name: 'bower')
    .pipe inject(
      gulp.src 'app/build/**/*',
        read: false
      relative: true)
    .pipe gulp.dest 'app'

gulp.task 'connect', ->
  connect.server
    root: ['app']
    port: 8001
    livereload: true

gulp.task 'open', ['connect'], ->
  gulp.src 'app/index.html'
    .pipe open '',
      url: 'http://localhost:8001'
      app: 'google chrome'

gulp.task 'watch', ->
  gulp.watch 'app/**/*', ['inject', 'reload']

gulp.task 'reload', ->
  gulp.src 'app/**/*'
    .pipe connect.reload()

gulp.task 'default', [
  'inject'
  'open'
  'watch'
]

gulp.task 'build', [
  'inject'
]