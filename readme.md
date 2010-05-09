# Chester

A MVC framework for Titanium Developer.

The purpose of this framework is to organize your Titanium Developer projects in a Model-View-Controller (MVC) pattern.

# Why

Titanium Developer is an awesome JavaScript SDK for building mobile applications, but there are no conventions on how to organize your code. We build web applications using Ruby on Rails, and being able to organize our iPad applications using the same patterns will enable us to process and maintain our software projects more effectively.

# Requirements

* node.js
* coffeescript

# Install

<pre>
  <code>
gem install chester
  </code>
</pre>

# Test

<pre>
  <code>
rake spec
  </code>
</pre>
  
# Add to any Titanium Developer Project

Just run chester install, and it will create the chester.coffee file in your Resources folder.
 
<pre>
  <code>
cd ./Resources
chester install
  </code>
</pre>

# Easy to compile the coffee files to javascript

This command compiles your coffee script into JavaScript.

<pre>
  <code>
cd ./Resources
chester brew
  </code>
</pre>

# Easy to generate models | views | controllers

<pre>
  <code>
cd ./Resources
chester generate model person
chester generate controller people
chester generate view people index
  </code>
</pre>

These generators will make the following objects:

- models
  - person.coffee
  
<pre>
  <code>
class Person
  name: 'Person'
  # Insert your code here
  
Chester.Application.Models.add(new Person())
  </code>
</pre>

Just a quick run down on what is going on here: in order for chester to know your model, you MUST have an attribute called name. This attribute (name) will register the model to the application object. Chester will then be able to find your model whenever you request it.

- controllers
  - people.coffee
  
<pre>
  <code>
class PeopleController extends Chester.Controller
  name: 'PeopleController'

# Register Controller to application
Chester.Application.add(new PeopleController()) 

  </code>
</pre>

Just like with the model, the controller needs to have an attribute called name. That is the actual name used for Chester to recognize the controller.

- views
  - people
    - index.coffee
    
<pre>
  <code>
class PeopleIndex extends Chester.View
  name: "index"
  render: ->
    # TODO: add your presentation code here.

  # Register view to Patients Controller
Chester.Application.find("PeopleController").add(new PeopleIndex())
    
  </code>
</pre> 

# Include the framework | models | views | controllers in app.js

<pre>
  <code>
var Chester = {};

// Include MVC Framework
Ti.include('chester.js');

// Register Controllers
Ti.include('controllers/people_controller.js');

// Register Models
Ti.include('models/person.js');

// Register Views
Ti.include('views/peoples/index.js');
  </code>
</pre>


# Framework

The object hierarchy is very straight forward. Chester has a base object which has an add method and a find method.

- base object
  - has a collection called children
  
- Methods:
  - add : adds an object to the children array
  - find : locates and returns the object based on the name attribute

## Base

This is the core class definition that all other classes inherit.

## Application

This objects children are controllers. With the add method you can add new controllers to this object. With the find method you can locate the controller by the name of the controller.

####Add and Find Example:
- Chester.Application.find("PeopleController").add(new PeopleIndex())

There is another array of objects attached to this class called models. These are basic classes that can added to the Models array.

## Controller

This object's children are views. These are not the same as views in Titanium. These are simple JavaScript classes that are used to contain the user interface code to manage your mobile application.

## View

This will be the most confusing class because the UI objects in Titanium are user views. The Chester views are more like code containers that help isolate your user interface code from your business logic and domain logic.

## Application.run

This is the main routing method that makes the whole application work. It takes the following parameters as a JavaScript object.

* Controller: string,
* Action: string,
* Params: object

This method simply finds the controller and executes the action method on the controller, passing the params object as the parameter.

Chester is built using coffee because it is much easier to maintain. But, you don't need to use coffeescript to use Chester! You can use JavaScript just fine.

# Get Involved

* Submit a pull request!
* Report an issue on twitter.com/jackhq using #Ti.chester

