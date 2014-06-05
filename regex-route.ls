{filter, map, lists-to-obj} = require 'prelude-ls'

class Regex-route

  (@routes=[]) ~>

  addRoute: (route) -> 
    @routes.push route

  splitPair: (pair) ->
    pair.split ':'

  readTuple: (pair) ~>
    lists-to-obj <[condition name]> = @splitPair pair
    
  fromString: (string) ->
    if /^(\/?(.*?):([^\/]*))*\/?$/.test string
      map @readTuple, string.split '/'

      # /^(\/?(.*?):([^\/]*))*\/?$/g.exec string
    else
      throw new Error "Invalid regex-route pattern" 

module.exports = new Regex-route