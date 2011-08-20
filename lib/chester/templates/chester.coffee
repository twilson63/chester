# Chester Framework
# 0.3.0
#  
# Classes:
#
# Base
# Application extends Base
# Controller extends Base
# View extends Base


class Base
  constructor: (name) ->
    @name = name
  children: []
  names: []
  find: (name) ->
    @children[@names.indexOf(name)]
  _: (name) ->
     @find(name)
  add: (child) ->
    child.parent = this
    @children[@children.length] = child
    @names[@names.length] = child.name

class Application extends Base
  version: "0.3.0"
  run: (options) ->
    @find(options.controller)[options.action ?= '_index'](options.params ?= {} )
  
class Controller extends Base
      
class View extends Base  
  render: ->
    print "Not Implemented"

Chester = new Base()
Chester.View = View
Chester.Controller =  Controller

Chester.add(new Application('app'))
Chester._('app').Models = new Base('Models')
Chester._('app').Helpers = new Base('Helpers')

root = exports ? this
root.Chester = Chester
