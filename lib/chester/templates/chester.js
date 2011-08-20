(function() {
  var Application, Base, Chester, Controller, View, root;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Base = (function() {
    function Base(name) {
      this.name = name;
    }
    Base.prototype.children = [];
    Base.prototype.names = [];
    Base.prototype.find = function(name) {
      return this.children[this.names.indexOf(name)];
    };
    Base.prototype._ = function(name) {
      return this.find(name);
    };
    Base.prototype.add = function(child) {
      child.parent = this;
      this.children[this.children.length] = child;
      return this.names[this.names.length] = child.name;
    };
    return Base;
  })();
  Application = (function() {
    __extends(Application, Base);
    function Application() {
      Application.__super__.constructor.apply(this, arguments);
    }
    Application.prototype.version = "0.3.0";
    Application.prototype.run = function(options) {
      var _ref, _ref2;
      return this.find(options.controller)[(_ref2 = options.action) != null ? _ref2 : options.action = '_index']((_ref = options.params) != null ? _ref : options.params = {});
    };
    return Application;
  })();
  Controller = (function() {
    __extends(Controller, Base);
    function Controller() {
      Controller.__super__.constructor.apply(this, arguments);
    }
    return Controller;
  })();
  View = (function() {
    __extends(View, Base);
    function View() {
      View.__super__.constructor.apply(this, arguments);
    }
    View.prototype.render = function() {
      return print("Not Implemented");
    };
    return View;
  })();
  Chester = new Base();
  Chester.View = View;
  Chester.Controller = Controller;
  Chester.add(new Application('app'));
  Chester._('app').Models = new Base('Models');
  Chester._('app').Helpers = new Base('Helpers');
  root = typeof exports !== "undefined" && exports !== null ? exports : this;
  root.Chester = Chester;
}).call(this);
