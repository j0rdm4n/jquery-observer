PROJECT = "jquery.observer"

{spawn, exec} = require "child_process"

command = (name, args...) ->
  proc = spawn name, args

  proc.stderr.on "data", (buffer) ->
    console.log buffer.toString()

  proc.stdout.on "data", (buffer) ->
    console.log buffer.toString()

  proc.on "exit", (status) -> process.exit(1) if status != 0

task "watch", "SASS and CoffeeScript", (options) ->
  command "sass", "--watch", "stylesheets:stylesheets"
  command "coffee", "-wc", "javascripts"

task "compile", "HAML", (opions) ->
  command "haml", "index.haml", "index.html"

task "package", "Package CSS and JS", (options) ->
  command "zip", "packages/#{PROJECT}.zip", "javascripts/#{PROJECT}.js"
  command "tar", "-cf", "packages/#{PROJECT}.tar", "javascripts/#{PROJECT}.js"