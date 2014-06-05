{filter, map, lists-to-obj} = require 'prelude-ls'

class Regex-route

  (@routes=[]) ~>

  addRoute: (route, fun) ->
    if typeof route is \string 
      @routes.push route, fun

  readTuple: (pair) ~>
    lists-to-obj <[condition name]>, pair.split ':'
    
  fromString: (string) ->
    if /^(\/?(.*?):([^\/]*))*\/?$/.test string
      filter (.name?), map @readTuple, string.split '/'
    else
      throw new Error "Invalid regex-route pattern" 

module.exports = new Regex-route