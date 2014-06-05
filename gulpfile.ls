gulp    = require "gulp" 
livescript = require "gulp-livescript"
uglify  = require "gulp-uglify"
argv    = require "yargs" .argv
spawn   = require 'child_process' .spawn

@p = undefined

paths =
  scripts: "src/**/*.ls"
  gulp: "gulpfile.ls"

gulp.task "scripts", ->
  gulp.src paths.scripts
    ..pipe livescript bare: true
      ..on 'error', -> console.log it
    ..pipe gulp.dest \.

gulp.task "gulp", ~>
  console.log "Gulpfile changed. Reloading!"
  if @p? then @p.kill!
  @p = spawn('lsc-gulp', [argv.task ?= \default], {stdio: 'inherit'});

# Rerun the task when a file changes
gulp.task "watch", ->
  gulp.watch paths.scripts, ["scripts"]
  gulp.watch paths.gulp, ["gulp"]
  return


# The default task (called when you run `gulp` from cli)
gulp.task "default", [
  "scripts"
  "watch"
]