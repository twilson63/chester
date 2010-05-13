class Base
  name: "Base"
  children: []
  find: (name) ->
    for child in this.children 
      if child.name == name
        result: child
        break
    result
    
  add: (child) ->
    this.children[this.children.length]: child
  
  
class Application extends Base
  version: "0.2.0"
  run: (options) ->
    this.find(options.controller)[options.action ?= '_index'](options.params ?= {} )
  

    
class Controller extends Base
  name: "Controller"
    
  
class View extends Base
  name: "View"
  data: ->
    result = {}
    for child in this.children 
      result[child.name] = child.value
    result
  
  render: ->
    print "Not Implemented"

Chester.View = View;
Chester.Controller = Controller;
Chester.Application = new Application();
Chester.Application.Models = new Base();
Chester.Application.Helpers = new Base();



