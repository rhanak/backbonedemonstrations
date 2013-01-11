require
  #urlArgs: "b=#{(new Date()).getTime()}"
  paths:
    jquery: 'vendor/jquery'
    underscore: 'vendor/underscore'
    backbone: 'vendor/backbone'
    'backbone.marionette': 'vendor/backbone.marionette'

    # SlickGrid and dependencies
    'jquery.event.drag': 'vendor/jquery.event.drag-2.0.min'
    'slick.core': 'vendor/slick.core'
    'slick.grid': 'vendor/slick.grid'


  shim:
  	'jquery.event.drag': ['jquery']
  	'slick.core' : 
  		exports: 'Slick'
  		deps:    ['jquery.event.drag']
  	'slick.grid' : 
  		exports: 'Slick'
  		deps:    ['slick.core']
  packages: [{
  				name: 'angrycats'
  				location: 'app/modules/angrycats'
  			}]
  ,  ['init']
  , (Init) ->
    